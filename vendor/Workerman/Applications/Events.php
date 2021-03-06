<?php
use \GatewayWorker\Lib\Gateway;
use \GatewayWorker\Lib\Db;

/**
 * 主逻辑
 * 主要是处理 onConnect onMessage onClose 三个方法
 * onConnect 和 onClose 如果不需要可以不用实现并删除
 */
class Events
{
    /**
     * 鉴权，客户端发送数据时验证客户端权限，是否需要进行逻辑处理
     * 目前只是简单实例，开发者可以根据自己项目情况扩展。
     * @param int $client_id 连接id
     * @param mixed $message 具体消息
     */
    public static function checkToken($message)
    {
        $token = isset($message['token']) ? $message['token'] : 0;
        if ($token !== 0) {
            return true;
        }
        return false;
    }

   /**
    * 当客户端发来消息时触发
    * @param int $client_id 连接id
    * @param mixed $message 具体消息
    */
   public static function onMessage($client_id, $data) {
       $message = json_decode($data, true);
       $message_type = $message['type'];
       if (!Events::checkToken($message)) {
           return;
       }

       switch($message_type) {
           case 'init':
               // uid
               $uid = $message['id'];
               // 设置session
               $_SESSION = [
                   'username' => $message['username'],
                   'avatar'   => $message['avatar'],
                   'id'       => $uid,
                   'sign'     => $message['sign']
               ];

               // 将当前链接与uid绑定
               Gateway::bindUid($client_id, $uid);
               // 通知当前客户端初始化
               $init_message = array(
                   'message_type' => 'init',
                   'id'           => $uid,
               );
               Gateway::sendToClient($client_id, json_encode($init_message));

               $db1 = Db::instance('db1');  //数据库链接

               //设置在线状态
               $db1->query("UPDATE `wei_chatuser` SET `status` = 'online' WHERE id=" . $_SESSION['id']);

               //通知所有人有人上线（这里实际情况应该只是通知好友就可以）
               $logout_message = [
                   'message_type' => 'login',
                   'id'           => $_SESSION['id']
               ];
               Gateway::sendToAll(json_encode($logout_message));

               //查询最近1周有无需要推送的离线信息
               $time = time() - 7 * 3600 * 24;
               $resMsg = $db1->select('id,fromid,fromname,fromavatar,timeline,content')->from('wei_chatlog')
                   ->where("toid= {$uid} and timeline > {$time} and type = 'friend' and needsend = 1" )
                   ->query();
                //var_export($resMsg);
               if( !empty( $resMsg ) ){

                   foreach( $resMsg as $key=>$vo ){

                       $log_message = [
                           'message_type' => 'logMessage',
                           'data' => [
                               'username' => $vo['fromname'],
                               'avatar'   => $vo['fromavatar'],
                               'id'       => $vo['fromid'],
                               'type'     => 'friend',
                               'content'  => htmlspecialchars( $vo['content'] ),
                               'timestamp'=> $vo['timeline'] * 1000,
                           ]
                       ];

                       Gateway::sendToUid( $uid, json_encode($log_message) );

                       //设置推送状态为已经推送
                       $db1->query("UPDATE `wei_chatlog` SET `needsend` = '0' WHERE id=" . $vo['id']);
                   }
               }

               //查询当前的用户是在哪个分组中,将当前的链接加入该分组
               $ret = $db1->query("select `groupid` from `wei_groupdetail` where `userid` = {$uid} group by `groupid`");
               if( !empty( $ret ) ){
                   foreach( $ret as $key=>$vo ){
                       Gateway::joinGroup($client_id, $vo['groupid']);  //将登录用户加入群组
                   }
               }
               unset( $ret );
               return;
               break;
           case 'addFriend' :
               //获取该接受者未读消息数量
               $db1 = Db::instance('db1');  //数据库链接
               $friend_id = $message['to_user_id'];
               $msgCount = $db1->query("select count(*) as num from  `wei_system_message` where `user_id` = {$friend_id} and `read` = 0");
               $count = $msgCount && $msgCount[0]['num'] ? $msgCount[0]['num'] :0;
               $data = [
                   "message_type"      => "msgBox",
                   "count"     => $count
               ];
               $dataMobile = [
                   "message_type"      => "friendRequest",
                   "count"     => $count
               ];
                Gateway::sendToUid($friend_id, json_encode($dataMobile));//移动端接受好友请求消息
                Gateway::sendToUid($friend_id, json_encode($data));
                return ;
               break;
           case "refuseFriend":
               $id = $message['id'];//消息id
               $db1 = Db::instance('db1');  //数据库链接
               $system_message = $db1->row("select * from  `wei_system_message` where `id` = {$id}");

               //获取该接受者未读消息数量
               $count = $db1->row("select count(*) as num from  `wei_system_message` where `user_id` = {$system_message['from_id']} and `read` = 0");
               $data = [
                   "message_type"      => "msgBox",
                   "count"     => $count['num']
               ];
               return Gateway::sendToUid($system_message['from_id'], json_encode($data));
               break;
           case "agreeFriend":
               $db1 = Db::instance('db1');  //数据库链接
               $user = $db1->row("select * from `wei_chatuser` where `id` = {$_SESSION['id']}");
               $data = [
                   "message_type" => "addList",
                   "data" => [
                       "type"  => "friend",
                       "avatar"    => $user['avatar'],
                       "username" => $user['username'],
                       "groupid" => $message['fromgroup'],
                       "id"        => $user['id'],
                       "sign"    => $user['sign']
                   ]
               ];
               //获取未读消息盒子数量
               $count = $db1->row("select count(*) as num from `wei_system_message` where `user_id` = {$message['user_id']} and `read` = 0");

               $data1 = [
                   "type"      => "msgBox",
                   "count"     => $count['num']
               ];
               Gateway::sendToUid($message['user_id'], json_encode($data));
               Gateway::sendToUid($message['user_id'], json_encode($data1));
               return ;
               break;
           case 'delUser' :
               //删除用户
               $del_message = [
                   'message_type' => 'delUser',
                   'data' => [
                       'type' => 'friend',
                       'id'       => $message['data']['id']
                   ]
               ];
               Gateway::sendToAll( json_encode($del_message), null, $client_id );
               return;
               break;
           case 'addGroup':
               //添加群组
               $uids = explode( ',', $message['data']['uids'] );
               $client_id_array = [];
               foreach( $uids as $vo ){
                    $ret = Gateway::getClientIdByUid( $vo );  //当前组中在线的client_id
                    if( !empty( $ret ) ){
                        $client_id_array[] = $ret['0'];

                        Gateway::joinGroup($ret['0'], $message['data']['id']);  //将这些用户加入群组
                    }
               }
               unset( $ret, $uids );

               $add_message = [
                   'message_type' => 'addGroup',
                   'data' => [
                       'type' => 'group',
                       'avatar'   => $message['data']['avatar'],
                       'id'       => $message['data']['id'],
                       'groupname'     => $message['data']['groupname']
                   ]
               ];
               Gateway::sendToAll( json_encode($add_message), $client_id_array );
               return;
               break;
           case 'joinGroup':
               //加入群组
               $uid = $message['data']['uid'];
               $ret = Gateway::getClientIdByUid( $uid ); //若在线实时推送
               if( !empty( $ret ) ){
                   Gateway::joinGroup($ret['0'], $message['data']['id']);  //将该用户加入群组

                   $add_message = [
                       'message_type' => 'addGroup',
                       'data' => [
                           'type' => 'group',
                           'avatar'   => $message['data']['avatar'],
                           'id'       => $message['data']['id'],
                           'groupname'     => $message['data']['groupname']
                       ]
                   ];
                   Gateway::sendToAll( json_encode($add_message), [$ret['0']], $client_id );  //推送群组信息
               }

               return;
               break;
           case 'addMember':
               //添加群组成员
               $uids = explode( ',', $message['data']['uid'] );
               $client_id_array = [];
               foreach( $uids as $vo ){
                   $ret = Gateway::getClientIdByUid( $vo );  //当前组中在线的client_id
                   if( !empty( $ret ) ){
                       $client_id_array[] = $ret['0'];

                       Gateway::joinGroup($ret['0'], $message['data']['id']);  //将这些用户加入群组
                   }
               }
               unset( $ret, $uids );

               $add_message = [
                   'message_type' => 'addGroup',
                   'data' => [
                       'type' => 'group',
                       'avatar'   => $message['data']['avatar'],
                       'id'       => $message['data']['id'],
                       'groupname'     => $message['data']['groupname']
                   ]
               ];
               Gateway::sendToAll( json_encode($add_message), $client_id_array, $client_id );  //推送群组信息
               return;
               break;
           case 'removeMember':
               //将移除群组的成员的群信息移除，并从讨论组移除
               $ret = Gateway::getClientIdByUid( $message['data']['uid'] );
               if( !empty( $ret ) ){

                   Gateway::leaveGroup($ret['0'], $message['data']['id']);

                   $del_message = [
                       'message_type' => 'delGroup',
                       'data' => [
                           'type' => 'group',
                           'id'       => $message['data']['id']
                       ]
                   ];
                   Gateway::sendToAll( json_encode($del_message), [$ret['0']], $client_id );
               }

               return;
               break;
           case 'delGroup':
               //删除群组
               $del_message = [
                   'message_type' => 'delGroup',
                   'data' => [
                       'type' => 'group',
                       'id'       => $message['data']['id']
                   ]
               ];

               $groupUsers = Gateway::getClientSessionsByGroup( $message['data']['id'] );
               foreach ($groupUsers as $clientId => $user) {
                   Gateway::leaveGroup($clientId, $message['data']['id']);
               }
               Gateway::sendToAll( json_encode($del_message), null, $client_id );
               return;
               break;
           case 'chatMessage':
               $db1 = Db::instance('db1');  //数据库链接
               // 聊天消息
               $type = $message['data']['to']['type'];
               $to_id = $message['data']['to']['id'];
               $uid = $_SESSION['id'];
 
               $chat_message = [
                    'message_type' => 'chatMessage',
                    'data' => [
                        'username' => $_SESSION['username'],
                        'avatar'   => $_SESSION['avatar'],
                        'id'       => $type === 'friend' ? $uid : $to_id,
                        'type'     => $type,
                        'content'  => htmlspecialchars($message['data']['mine']['content']),
                        'timestamp'=> time()*1000,
                    ]
               ];
               //聊天记录数组
               $param = [
                   'fromid' => $uid,
                   'toid' => $to_id,
                   'fromname' => $_SESSION['username'],
                   'fromavatar' => $_SESSION['avatar'],
                   'content' => htmlspecialchars($message['data']['mine']['content']),
                   'timeline' => time(),
                   'needsend' => 0
               ];
               switch ($type) {
                   // 私聊
                   case 'friend':
                       // 插入
                       if ($uid != $to_id) {
                           $param['type'] = 'friend';
                           if( empty( Gateway::getClientIdByUid( $to_id ) ) ){
                               $param['needsend'] = 1;  //用户不在线,标记此消息推送
                           }
                           $db1->insert('wei_chatlog')->cols( $param )->query();
                           return Gateway::sendToUid($to_id, json_encode($chat_message));
                       }
                   // 群聊
                   return;
                   case 'group':
                       $member = $db1->row("select * from `wei_groupdetail` where `userid` = {$_SESSION['id']} and `groupid` = {$to_id}");
                       if ($member) {
                           $param['type'] = 'group';
                           $db1->insert('wei_chatlog')->cols( $param )->query();
                           return Gateway::sendToGroup($to_id, json_encode($chat_message), $client_id);
                       }
                       return;
               }
               return;
               break;
           case 'hide':
           case 'online':
               $status_message = [
                   'message_type' => $message_type,
                   'id'           => $_SESSION['id'],
               ];
               $_SESSION['online'] = $message_type;
               Gateway::sendToAll(json_encode($status_message));
               return;
               break;
           case 'ping':
               return;
           default:
               echo "unknown message $data" . PHP_EOL;
       }
   }
   
   /**
    * 当用户断开连接时触发
    * @param int $client_id 连接id
    */
   public static function onClose($client_id) {
       if (isset($_SESSION['id']) && $_SESSION['id']) {
           $logout_message = [
               'message_type' => 'logout',
               'id'           => $_SESSION['id']
           ];
           $db1 = Db::instance('db1');  //数据库链接

           //设置推送状态为已经推送
           $db1->query("UPDATE `wei_chatuser` SET `status` = 'offline' WHERE id=" . $_SESSION['id']);
           Gateway::sendToAll(json_encode($logout_message));
       } else {
           var_dump($_SESSION);
       }
   }
}