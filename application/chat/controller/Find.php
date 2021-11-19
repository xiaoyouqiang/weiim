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

class Find extends FrontController
{
    //显示查询 / 添加 分组的页面
    public function index()
    {
        $type = input('param.type');
        $groupArr = db('chatgroup')->order('id desc')->limit(4)->select();
        $this->assign([
            'group' => $groupArr
        ]);
        $this->assign([
            'type' => $type
        ]);
        return $this->fetch();
    }

    //搜索查询群组
    public function search()
    {
        $groupname = input('param.group_name');
        $page = input('param.page') ?:1;
        $page = (int)$page;
        $limit = 10;
        $offset = ($page - 1) * $limit;
        $count = db('chatgroup')->where("groupname like '%" . $groupname . "%'") ->count();

        $find = db('chatgroup')->where("groupname like '%" . $groupname . "%'")
            ->limit($offset, $limit)
            ->select();
        if( empty($find) ){
            return json( ['code' => -1,'count'=>$count, 'data' => [], 'msg' => '您搜的群不存在' ] );
        }
        $totalPage = ceil($count / $limit);
        $host = 'http://' . $_SERVER['HTTP_HOST'];
        foreach ($find as &$item) {
            $item['avatar'] = $host . $item['avatar'];
        }

        return json( ['code' => 1, 'page' => $page,'totalPage'=>$totalPage, 'count'=>$count, 'data' => $find, 'msg' => 'success' ] );
    }

    //搜索查询群组
    public function searchUser()
    {
        $userName = input('param.user_name');
        $page = input('param.page') ?:1;
        $page = (int)$page;
        $limit = 10;
        $offset = ($page - 1) * $limit;
        $count = db('chatuser')->where("username like '%" . $userName . "%'") ->count();

        $users = db('chatuser')->where("username like '%" . $userName . "%'")
            ->limit($offset, $limit)
            ->select();
        if( empty($users) ){
            return json( ['code' => -1, 'count'=>$count, 'data' => '', 'msg' => '您搜的用户不存在' ] );
        }
        $totalPage = ceil($count / $limit);

        $host = 'http://' . $_SERVER['HTTP_HOST'];
        foreach ($users as &$item) {
            $item['avatar'] = $host . $item['avatar'];
        }

        return json( ['code' => 1,'page' => $page,'totalPage'=>$totalPage, 'count'=>$count, 'data' => $users, 'msg' => 'success' ] );
    }
    
    //加入群组
    public function joinGroup()
    {
    	$groupid = input('param.gid');
    	$has = db('chatgroup')->where('id = ' . $groupid)->find();
    	
    	if( empty( $has ) ){
    		return json( ['code' => -1, 'data' => '', 'msg' => '该群组不存在' ] );
    	}
    	
    	$uid = $this->user['id'];
    	//已经加入了
    	$allready = db('groupdetail')->field('userid')
    	->where('groupid = ' . $groupid . ' and userid = ' . $uid)
    	->find();
    	
    	if( !empty( $allready ) ){
    		return json( ['code' => -2, 'data' => '', 'msg' => '你已经加入该群了' ] );
    	}

    	$param = [
    			'userid' => $uid,
    			'username' => $this->user['username'],
    			'useravatar' => $this->user['avatar'],
    			'usersign' => $this->user['sign'],
    			'groupid' => $groupid
    	];
    	
    	db('groupdetail')->insert( $param );
        $host = 'http://' . $_SERVER['HTTP_HOST'];

        //socket data
        $join_data = '{"type":"joinGroup", "data" : {"avatar":"' . $host . $has['avatar'] . '","groupname":"' . $has['groupname'] . '",';
        $join_data .= '"id":"' . $groupid. '", "uid":"' . $uid . '"}}';
    	
    	return json( ['code' => 1, 'data' => $join_data, 'msg' => '成功加入' ] );
    }

    //添加好友请求
    public function addFriend()
    {
        if( empty($this->user['id']) ){
            return json( ['code' => -3, 'data' => '', 'msg' => '登录过期，请重新登录！' ] );
        }

        $to_user_id = input('param.to_user_id');
        $group = input('param.group') ?:0;
        $remark = input('param.remark');

        $isFriend = db('friend')->where('friend_id', $to_user_id)->where('user_id', $this->user['id'])->find();

        if ($isFriend) {
            return json( ['code' => -3, 'data' => '', 'msg' => '对方已经是你的好友，不可重复添加' ] );
        }
        if ($to_user_id == $this->user['id']) {
            return json( ['code' => -3, 'data' => '', 'msg' => '不能添加自己为好友' ] );
        }
        $system_message_data = [
            'user_id'   => $to_user_id,//接受者
            'from_id'   => $this->user['id'],//来源者
            'remark'    => $remark,
            'type'      => 0,
            'group_id'  => $group,
            'time'      => time()
        ];
        db('system_message')->insert($system_message_data);
        return json( ['code' => 1, 'data' => [], 'msg' => '已发送好友请求' ] );
    }

    //拒绝好友请求
    public function refuseFriend()
    {
        if( empty($this->user['id']) ){
            return json( ['code' => -3, 'data' => '', 'msg' => '登录过期，请重新登录！' ] );
        }
        $messageId = input('param.id');

        $system_message = db('system_message')->where('id', $messageId)->find();
        $res = db('system_message')->where('id',$messageId)->update(['status' => 2]);
        $data = [
            'user_id'   => $system_message['from_id'],
            'from_id'   => $system_message['user_id'],
            'type'      => 1,
            'status'    => 2,
            'time'      => time()
        ];
        $res1 = db('system_message')->insert($data);
        if ($res && $res1){
            return json( ['code' => 1, 'data' => [], 'msg' => '已拒绝' ] );
        } else {
            return json( ['code' => -2, 'data' => [], 'msg' => '操作失败' ] );
        }
    }

    //同意好友请求
    public function agreeFriend()
    {
        if( empty($this->user['id']) ){
            return json( ['code' => -3, 'data' => '', 'msg' => '登录过期，请重新登录！' ] );
        }
        $messageId = input('param.id');
        $groupid = input('param.groupid');

        $system_message = db('system_message')->where('id', $messageId)->find();
        $isFriend = db('friend')->where('user_id',$system_message['user_id'])->where('friend_id',$system_message['from_id'])->find();
        if ($isFriend) {
            return json( ['code' => -1, 'data' => [], 'msg' => '已经是好友了' ] );
        }
        $data = [
            [
                'user_id' => $system_message['user_id'],
                'friend_id' =>$system_message['from_id'],
                'friend_group_id' => $groupid
            ],
            [
                'user_id' =>$system_message['from_id'],
                'friend_id' => $system_message['user_id'],
                'friend_group_id' => $system_message['group_id']
            ]
        ];
        $res = db('friend')->insertAll($data);
        if (!$res) {
            return json( ['code' => -1, 'data' => [], 'msg' => '添加失败' ] );
        }
        db('system_message')->where('id',$messageId)->update(['status' => 1]);
        $user = db('chatuser')->where('id', $system_message['from_id'])->find();
        $host = 'http://' . $_SERVER['HTTP_HOST'];

        $data = [
            "type"  => "friend",
            "avatar"    => $host . $user['avatar'],
            "username" => $user['username'],
            "groupid" => $groupid,
            "id"        => $user['id'],
            "sign"    => $user['sign']
        ];
        $system_message_data = [
            'user_id'   => $system_message['from_id'],
            'from_id'   => $system_message['user_id'],
            'type'      => 1,
            'status'    => 1,
            'time'      => time()
        ];
        $res1 = db('system_message')->insert($system_message_data);
        return json( ['code' => 1, 'data' => $data, 'msg' => '添加成功' ] );
    }

    //添加群组
    public function addGroup()
    {
    	if( empty($this->user['id']) ){
    		$this->redirect( url('index/index') );
    	}

    	if( request()->isPost() ){
    		
    		$param = input('post.');
    		if( empty($param['groupname']) ){
    			return json( ['code' => -1, 'data' => '', 'msg' => '群组名不能为空' ] );
    		}


    		$this->_getUpFile( $param );

            $param['owner_name'] = $this->user['username'];
    		$param['owner_id'] = $this->user['id'];
    		$param['owner_avatar'] = $this->user['avatar'];
    		$param['owner_sign'] = $this->user['sign'];
            $param['created_time'] = time();

            $flag = db('chatgroup')->insert( $param );
    		if( empty( $flag ) ){
    			return json( ['code' => -3, 'data' => '', 'msg' => '添加群组失败' ] );
    		}
    		
    		//unset( $param );
    		//拼装上自己
    		$ids = $this->user['id'];
    		$groupid = db('chatgroup')->getLastInsID();

    		$users = db('chatuser')->where("id in($ids)")->select();
    		if( !empty( $users ) ){
    			foreach( $users as $key=>$vo ){
    				
    				$params = [
    						'userid' => $vo['id'],
    						'username' => $vo['username'],
    						'useravatar' => $vo['avatar'],
    						'usersign' => $vo['sign'],
    						'groupid' => $groupid
    				];
    				
    				db('groupdetail')->insert( $params );
    				unset( $params );
    			}
    		}
            $host = 'http://' . $_SERVER['HTTP_HOST'];

			//socket data
			$add_data = '{"type":"addGroup", "data" : {"avatar":"' . $host . $param['avatar'] . '","groupname":"' . $param['groupname'] . '",';
			$add_data .= '"id":"' . $groupid. '", "uids":"' . $ids . '"}}';
    		
    		return json( ['code' => 1, 'data' => $add_data, 'msg' => '创建群组 成功' ] );
    	}
    	
        return $this->fetch();
    }

    //添加群组
    public function addGroupMobile()
    {
        if( empty($this->user['id']) ){
            $this->redirect( url('index/index') );
        }
        $token = input('param.token');

        if( request()->isPost() ){

            $param = input('post.');
            if( empty($param['groupname']) ){
                return json( ['code' => -1, 'data' => '', 'msg' => '群组名不能为空' ] );
            }


            $this->_getUpFile( $param );

            $param['owner_name'] = cookie('username');
            $param['owner_id'] = $this->user['id'];
            $param['owner_avatar'] = cookie('avatar');
            $param['owner_sign'] = cookie('sign');

            $flag = db('chatgroup')->insert( $param );
            if( empty( $flag ) ){
                return json( ['code' => -3, 'data' => '', 'msg' => '添加群组失败' ] );
            }

            //unset( $param );
            //拼装上自己
            $ids = $this->user['id'];
            $groupid = db('chatgroup')->getLastInsID();

            $users = db('chatuser')->where("id in($ids)")->select();
            if( !empty( $users ) ){
                foreach( $users as $key=>$vo ){

                    $params = [
                        'userid' => $vo['id'],
                        'username' => $vo['username'],
                        'useravatar' => $vo['avatar'],
                        'usersign' => $vo['sign'],
                        'groupid' => $groupid
                    ];

                    db('groupdetail')->insert( $params );
                    unset( $params );
                }
            }
            $host = 'http://' . $_SERVER['HTTP_HOST'];

            //socket data
            $add_data = '{"type":"addGroup", "data" : {"avatar":"' . $host . $param['avatar'] . '","groupname":"' . $param['groupname'] . '",';
            $add_data .= '"id":"' . $groupid. '", "uids":"' . $ids . '"}}';

            return json( ['code' => 1, 'data' => $add_data, 'msg' => '创建群组 成功' ] );
        }

        return $this->fetch();
    }
    
    //管理我的群组
    public function myGroup()
    {
    	
    	if( request()->isAjax() ){
    		$groupid = input('param.id');
    		$users = db('groupdetail')->field('username,userid,useravatar,groupid')->where('groupid', $groupid)->select();
    		
    		return json( ['code' => 1, 'data' => $users, 'msg' => 'success'] );
    	}
    	
    	$users = [];
    	$group = db('chatgroup')->field('id,groupname')->where('owner_id', $this->user['id'])->select();

    	if( !empty($group) ){
    		$users = db('groupdetail')->field('username,userid,useravatar,groupid')->where('groupid', $group['0']['id'])->select();
    	}
    	
    	$this->assign([
    			'group' => $group,
    			'users' => $users
    			
    	]);
    	return $this->fetch();
    }
    
    //追加群组人员
    public function addMembers()
    {
    	$groupid = input('param.gid');
    	$ids = input('param.ids');
    	$users = db('chatuser')->where("id in($ids)")->select();
    	if( !empty( $users ) ){
    		foreach( $users as $key=>$vo ){
    	
    			$param = [
    					'userid' => $vo['id'],
    					'username' => $vo['username'],
    					'useravatar' => $vo['avatar'],
    					'usersign' => $vo['sign'],
    					'groupid' => $groupid
    			];
    	
    			db('groupdetail')->insert( $param );
    			unset( $param );
    		}
    	}
        $host = 'http://' . $_SERVER['HTTP_HOST'];

        $group = db('chatgroup')->field('avatar,groupname')->where('id', $groupid)->find();
        //socket data
        $add_data = '{"type":"addMember", "data" : {"avatar":"' . $host . $group['avatar'] . '","groupname":"' . $group['groupname'] . '",';
        $add_data .= '"id":"' . $groupid. '", "uid":"' . $ids . '"}}';
    	
    	return json( ['code' => 1, 'data' => $add_data, 'msg' => '加入群组 成功' ] );
    }
    
    //移出成员出组
    public function removeMembers()
    {
    	$uid = input('param.uid');
    	$groupid = input('param.gid');
    	
    	$cannot = db('chatgroup')->field('id')->where('owner_id = ' . $uid . ' and id = ' . $groupid)->find();
    	if( !empty( $cannot ) ){
    		return json( ['code' => -1, 'data' => '', 'msg' => '不可移除群主'] );
    	}
    	
    	db('groupdetail')->where('userid = ' . $uid . ' and groupid = ' .$groupid)->delete();
    	
    	return json( ['code' => 1, 'data' => '', 'msg' => '移除成功'] );
    }
    
    //解散群组
    public function removeGroup()
    {
    	$groupid = input('param.gid');
    	//删除群组
    	db('chatgroup')->where('id', $groupid)->delete();
    	
    	//删除群成员
    	db('groupdetail')->where('groupid', $groupid)->delete();
    	
    	return json( ['code' => 1, 'data' => '', 'msg' => '成功解散该群'] );
    }
    
    //获取所有的用户
    public function getUsers()
    {
        $friendData = db('friend')->field('friend_id')
            ->where('user_id', $this->user['id'])
            ->select();

        $friendUids = array_column($friendData, 'friend_id');
    	$result = db('chatuser')->field('id,username')
    	->where('id', 'in', $friendUids)
    	->select();
    	
    	if( empty($result) ){
    		return json( ['code' => -1, 'data' => '', 'msg' => '暂无其他成员'] );
    	}
    	
    	$str = "";
    	$flag = input('param.flag');
    	$flag = empty( $flag ) ? false : true;
    	if( $flag ){
    		//查询该分组中的成员id
    		$groupid = input('param.gid');
    		$ids = db('groupdetail')->field('userid')->where('groupid', $groupid)->select();
    		
    		if( !empty( $ids ) ){
    			foreach( $ids as $key=>$vo ){
    				$idsArr[] = $vo['userid'];
    			}
    			unset( $ids );
    		}
    		
    		foreach( $result as $key=>$vo ){
    			if( in_array( $vo['id'], $idsArr ) ){
    				unset( $result[$key] );
    			}
    		}
    	}
    	
    	if( empty($result) ){
    		return json( ['code' => -2, 'data' => '', 'msg' => '该群组已经包含了全部成员'] );
    	}
    	
    	$group = config('user_group');
    	//先将默认分组拼装好
    	foreach( $group as $key=>$vo ){
    		$str .= '{ "id": "-' . $key . '", "pId":0, "name":"' . $vo .'"},';
    	}
    	
    	foreach($result as $key=>$vo){
    		$str .= '{ "id": "' . $vo['id'] . '", "pId":"-' . '0' . '", "name":"' . $vo['username'].'"},';
    	}
    	
    	$str = "[" . substr($str, 0, -1) . "]";
    	
    	return json( ['code' => 1, 'data' => $str, 'msg' => 'success'] );
    }
    
    /**
     * 上传图片方法
     * @param $param
     */
    private function _getUpFile(&$param)
    {
    	// 获取表单上传文件
    	$file = request()->file('avatar');
    
    	// 移动到框架应用根目录/public/uploads/ 目录下
    	if( !is_null( $file ) ){
    
    		$info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
    		if($info){
    			// 成功上传后 获取上传信息
    			$param['avatar'] =  '/uploads' . '/' . date('Ymd') . '/' . $info->getFilename();
    		}else{
    			// 上传失败获取错误信息
    			echo $file->getError();
    		}
    	}else{
    		unset( $param['avatar'] );
    	}
    
    }
}