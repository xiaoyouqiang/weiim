<?php

// +----------------------------------------------------------------------
// | ThinkAdmin
// +----------------------------------------------------------------------
// | 版权所有 2014~2019 广州楚才信息科技有限公司 [ http://www.cuci.cc ]
// +----------------------------------------------------------------------
// | 官方网站: http://demo.thinkadmin.top
// +----------------------------------------------------------------------
// | 开源协议 ( https://mit-license.org )
// +----------------------------------------------------------------------
// | gitee 代码仓库：https://gitee.com/zoujingli/ThinkAdmin
// | github 代码仓库：https://github.com/zoujingli/ThinkAdmin
// +----------------------------------------------------------------------

namespace app\admin\controller;

use library\Controller;

/**
 * Class Member
 * @package app\store\controller
 */
class Chatgroup extends Controller
{

    /**
     * 绑定数据表
     * @var string
     */
    protected $table = 'chatgroup';

    public function index()
    {
        $this->title = '群组管理';

        $query = $this->_query($this->table);
        $query->order('id desc')
            ->like('groupname,owner_name')
            ->page();
    }

    //查看聊天记录
    public function seeChatRecord()
    {
        $this->title = '群聊天记录';
        $groupId = $this->request->get('id');

        $query = $this->_query('chatlog')->alias('a')->field('a.*,b.avatar img1,b.username username1,c.avatar img2,c.username username2');
        $query->join('chatuser b', 'a.toid = b.id')
            ->join('chatuser c', 'a.fromid = c.id')
            ->where(['a.id' => $groupId, 'type' => 'group'])
            ->order('a.id desc')
            ->like('content')
            ->page();
    }

    //查看群成员
    public function seeMembers()
    {
        $this->title = '群员列表';
        $groupId = $this->request->get('id');

        $query = $this->_query('groupdetail');
        $query->where('groupid', $groupId)
            ->order('userid desc')
            ->page();
    }

    //编辑群组
    public function edit()
    {
        $this->applyCsrfToken();
        $this->_form($this->table, 'form');
    }

    //删除群组(包括群成员)
    public function remove()
    {
        $groupId = $this->request->post('id');
        if ($groupId) {
            \think\Db::name('groupdetail')->where('groupid', $groupId)->delete();
        }

        $this->applyCsrfToken();
        $this->_delete($this->table);
    }

    //删除群成员
    public function removeDetails()
    {
        $data['userid'] = $this->request->post('userid');
        $this->_delete('groupdetail','',$data);
    }

}