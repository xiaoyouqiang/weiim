<?php
// +----------------------------------------------------------------------
// | layerIM + Workerman + ThinkPHP5 即时通讯
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2012 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: xiaoyouqiang <20813341@qq.com>
// +----------------------------------------------------------------------
namespace app\chat\controller;

use think\FrontController;

class Index extends FrontController
{
    //socket通信地址,前端需要
    protected $socketDomain = "ws://127.0.0.1:8282";

    public function index()
    {
    	$mine = db('chatuser')->where('id', $this->user['id'])->find();
    	$this->assign([
    			'uinfo' => $mine,
                'socket_domain' => $this->socketDomain,
        ]);
        return $this->fetch();
    }

    public function  pc()
    {
        $mine = db('chatuser')->where('id', $this->user['id'])->find();
        $this->assign([
            'uinfo' => $mine,
            'socket_domain' => $this->socketDomain,
        ]);
        return $this->fetch();
    }

    //移动端好友请求列表
    public function friendRequestList()
    {
        $uid = $this->user['id'];
        $page = input('param.page') ?:1;
        $page = (int)$page;
        $limit = 10;
        $offset = ($page - 1) * $limit;
        db('system_message')->where('user_id',$uid)->where('type', 0)->update(['read' => 1]);
        $count = db('system_message')->where('user_id', $uid)->where('type', 0)->count();
        $totalPage = ceil($count / $limit);
        $list = db('system_message')
            ->alias('sm')
            ->join('chatuser as f','f.id=sm.from_id', 'left')
            ->field('sm.id,f.id as user_id,f.avatar,f.username,sm.remark,sm.time,sm.type,sm.group_id,sm.status')
            ->where('user_id', $uid)
            ->where('type', 0)
            ->order('id', 'DESC')
            ->limit($offset, $limit)
            ->select();
        $host = 'http://' . $_SERVER['HTTP_HOST'];
        foreach ($list as $k => $v) {
            $list[$k]['time'] = time_tranx($v['time']);
            $list[$k]['avatar'] = $host . $list[$k]['avatar'];
        }
        $result = [
            'list' => $list,
            "page" => $page,
            'count' => $count,
            'totalPage' => $totalPage
        ];
        return json( ['code' => 1, 'data' => $result, 'msg' => '成功' ] );
    }

    //消息盒子
    public function messageBox()
    {
        $uid = $this->user['id'];
        $page = input('param.page') ?:1;
        $page = (int)$page;
        $limit = 10;
        $offset = ($page - 1) * $limit;
        db('system_message')->where('user_id',$uid)->update(['read' => 1]);
        $count = db('system_message')->where('user_id', $uid)->count();
        $totalPage = ceil($count / $limit);
        $list = db('system_message')
            ->alias('sm')
            ->join('chatuser as f','f.id=sm.from_id', 'left')
            ->field('sm.id,f.id as user_id,f.avatar,f.username,sm.remark,sm.time,sm.type,sm.group_id,sm.status')
            ->where('user_id', $uid)
            ->order('id', 'DESC')
            ->limit($offset, $limit)
            ->select();
        foreach ($list as $k => $v) {
            $list[$k]['time'] = time_tranx($v['time']);
        }
        $result = [
            'list' => $list,
            "page" => $page,
            'count' => $count,
            'totalPage' => $totalPage
        ];
        if( request()->isAjax() ){
            return json( ['code' => 1, 'data' => $result, 'msg' => '成功' ] );
        } else {
            $this->assign($result);
            return $this->fetch();
        }
    }

    //获取好友列表
    public function getList()
    {
    	//查询自己的信息
    	$mine = db('chatuser')->where('id', $this->user['id'])->find();
    	$friends = db('friend')->where('user_id', $this->user['id'])->select();
        $userGroup = db('friend_group')->where('user_id', $this->user['id'])->select();
        !$friends && $friends = [];
        $userDatas = [];
        if ($friends) {
            $userIds = array_column($friends, 'friend_id');
            $userDatas = db('chatuser')->where('id', 'in', $userIds)->select();
        }
        $users = [];
        foreach ($userDatas as $value) {
            $users[$value['id']] = $value;
        }

        $host = 'http://' . $_SERVER['HTTP_HOST'];

        //查询当前用户的所处的群组
        $groupArr = [];
        $groups = db('groupdetail')->field('groupid')->where('userid', $this->user['id'])->group('groupid')->select();
        if( !empty( $groups ) ){
            foreach( $groups as $key=>$vo ){
                $ret = db('chatgroup')->where('id', $vo['groupid'])->find();
                if( !empty( $ret ) ){
                    $ret['avatar'] = $host . $ret['avatar'];
                    $groupArr[] = $ret;
                }
            }
        }
        unset( $ret, $groups );

        $online = 0;
        $group = [];  //记录分组信息
        $list = [];  //群组成员信息
        $j = 0;
        //用户好友的默认分组，分组id=0
        $group[0] = [
            'groupname' => '默认分组',
            'id' => 0,
            'online' => 0,
            'list' => []
        ];
        foreach( $userGroup as $key=>$vo ){
            $group[$vo['id']] = [
                'groupname' => $vo['groupname'],
                'id' => $vo['id'],
                'online' => 0,
                'list' => []
            ];
        }
        unset( $userGroup );

        foreach( $group as $key=>$vo ){

            foreach( $friends as $k=>$v ) {

                if ($vo['id'] == $v['friend_group_id']) {

                    $list[$j]['username'] = $users[$v['friend_id']]['username'];
                    $list[$j]['id'] = $v['friend_id'];
                    $list[$j]['avatar'] = $host . $users[$v['friend_id']]['avatar'];
                    $list[$j]['sign'] = $users[$v['friend_id']]['sign'];
                    $list[$j]['status'] = $users[$v['friend_id']]['status'];

                    if ('online' == $users[$v['friend_id']]['status']) {
                        $online++;
                    }

                    $group[$key]['online'] = $online;
                    $group[$key]['list'] = $list;

                    $j++;
                }
            }
            $j = 0;
            $online = 0;
            unset($list);
        }
        unset( $friends );
    			
        $return = [
       		'code' => 0,
       		'msg'=> '',
       		'data' => [
       			'mine' => [
	       				'username' => $mine['username'],
	       				'id' => $mine['id'],
	       				'status' => 'online',
       					'sign' => $mine['sign'],
       					'avatar' => $host . $mine['avatar']
       			],
       			'friend' => $group,
				'group' => $groupArr
       		],
        ];

    	return json( $return );

    }
    
    //获取组员信息
    public function getMembers()
    {
    	$id = input('param.id');
    	
    	//群主信息
    	$owner = db('chatgroup')->field('id,owner_name,owner_id,owner_avatar,owner_sign')->where('id = ' . $id)->find();
    	//群成员信息
    	$list = db('groupdetail')
            ->alias('gt')
            ->field('gt.userid id,cu.username,cu.avatar,cu.sign sign')
            ->join('chatuser cu', 'gt.userid=cu.id', 'left')
    	    ->where('groupid = ' . $id)->select();
        $host = 'http://' . $_SERVER['HTTP_HOST'];

        foreach ($list as &$item) {
            $item['avatar'] = $host . $item['avatar'];
        }
        $return = [
    			'code' => 0,
    			'msg' => '',
    			'data' => [
    				'owner' => [
    						'username' => $owner['owner_name'],
    						'id' => $owner['owner_id'],
                            'group_id' => $owner['id'],
                            'is_owner' => $this->user['id'] == $owner['owner_id'] ? 1 : 0,//当前登录用户是否是群主
    						'avatar' => $host . $owner['owner_avatar'],
    						'sign' => $owner['owner_sign']
    				],
    				'list' => $list	
    			]
    	];
    	
    	return json( $return );
    }

    //更新签名
    public function updateSign()
    {
        $sign = input('param.sign');

        $res = db('chatuser')->where('id', $this->user['id'])->update(['sign' => $sign]);
        if (!$res) {
            return json( ['code' => -1, 'data' => [], 'msg' => '您搜的群不存在' ] );

        }
        return json( ['code' => 0, 'data' => [], 'msg' => '签名修改成功' ] );

    }


}
