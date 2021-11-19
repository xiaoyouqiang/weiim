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

class Chatlog extends FrontController
{
    //聊天记录界面
    public function index()
    {
        $id = input('id');
        $type = input('type');

        $this->assign([
            'id' => $id,
            'type' => $type
        ]);

        return $this->fetch();
    }

    //聊天记录详情
    public function detail()
    {
        $id = input('id');
        $type = input('type');
        $uid = $this->user['id'];
        $page = input('param.page') ?:1;
        $page = (int)$page;
        $limit = 10;
        $offset = ($page - 1) * $limit;

        if( 'friend' == $type ){
            $result = db('chatlog')->where("((fromid={$uid} and toid={$id}) or (fromid={$id} and toid={$uid})) and type='friend'")
                ->order('timeline desc')
                ->limit($offset, $limit)
                ->select();

            if( empty($result) ){
                return json( ['code' => -1, 'count'=>0, 'data' => '', 'msg' => '没有记录'] );
            }
            $count = db('chatlog')
                ->where("((fromid={$uid} and toid={$id}) or (fromid={$id} and toid={$uid})) and type='friend'")
                ->count();

            $chatUsers = db('chatuser')->where('id', 'in', [$uid, $id])->select();
            $chatUserIndex = [];
            foreach ($chatUsers as $value) {
                $chatUserIndex[$value['id']] = $value;
            }
            $totalPage = ceil($count / $limit);

            return json( ['code' => 1, 'page' => $page, 'totalPage'=>$totalPage, 'count'=>$count, 'chat_users' => $chatUserIndex,  'data' => $result, 'msg' => 'success'] );
        }else if('group' == $type){

            $result = db('chatlog')->where("toid={$id} and type='group'")
                ->limit($offset, $limit)
                ->order('timeline desc')
                ->select();
            
            if( empty($result) ){
                return json( ['code' => -1, 'count'=>0, 'data' => '', 'msg' => '没有记录'] );
            }

            $uids = array_column($result, 'fromid');
            $chatUsers = db('chatuser')->where('id', 'in', $uids)->select();
            $chatUserIndex = [];
            foreach ($chatUsers as $value) {
                $chatUserIndex[$value['id']] = $value;
            }

            $count = db('chatlog')
                ->where("toid={$id} and type='group'")
                ->count();
            $totalPage = ceil($count / $limit);

            return json( ['code' => 1, 'page' => $page, 'totalPage'=>$totalPage, 'count' => $count, 'chat_users' => $chatUserIndex, 'data' => $result, 'msg' => 'success'] );
        }


    }
}