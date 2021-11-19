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

namespace app\store\controller;

use library\Controller;
use library\tools\Data;


/**
 * 会员信息管理
 * Class Member
 * @package app\store\controller
 */
class Member extends Controller
{

    /**
     * 绑定数据表
     * @var string
     */
    protected $table = 'chatuser';

    /**
     * 会员信息管理
     * @auth true
     * @menu true
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function index()
    {
        $this->title = '会员信息管理';
        $query = $this->_query($this->table)->like('username,phone,created_time');
        $query->dateBetween('created_time')->order('id desc')->page();
    }

    //查看聊天记录
    public function see()
    {
        $this->title = '群聊天记录';
        $uId = $this->request->get('id');

        $query = $this->_query('chatlog')->alias('a')->field('a.*,b.avatar img1,b.username username1,c.avatar img2,c.username username2');
        $query->join('chatuser b', 'a.toid = b.id')
            ->join('chatuser c', 'a.fromid = c.id')
            ->whereOr(['a.fromid' => $uId, 'a.toid' => $uId])
            ->order('a.id desc')
            ->like('content')
            ->page();
    }

    public function edit()
    {
        $this->applyCsrfToken();
        $this->_form($this->table, 'form');
    }

    public function pass()
    {
        $this->applyCsrfToken();
        if ($this->request->isGet()) {
            $this->verify = false;
            $this->_form($this->table, 'pass');
        } else {
            $post = $this->request->post();
            if ($post['password'] !== $post['repassword']) {
                $this->error('两次输入的密码不一致！');
            }
            $result = $this->checkpwd($post['password']);
            if (empty($result['code'])) $this->error($result['msg']);
            if (Data::save($this->table, ['id' => $post['id'], 'pwd' => md5($post['password'])], 'id')) {
                $this->success('密码修改成功，下次请使用新密码登录！', '');
            } else {
                $this->error('密码修改失败，请稍候再试！');
            }
        }
    }

    /**
     * 检查密码是否合法
     * @param string $password
     * @return array
     */
    public function checkpwd($password)
    {
        $password = trim($password);
        if (!strlen($password) >= 6) {
            return ['code' => 0, 'msg' => '密码必须大于6字符！'];
        }
        if (!preg_match("/^(?![\d]+$)(?![a-zA-Z]+$)(?![^\da-zA-Z]+$).{6,32}$/", $password)) {
            return ['code' => 0, 'msg' => '密码必需包含大小写字母、数字、符号任意两者组合！'];
        } else {
            return ['code' => 1, 'msg' => '密码复杂度通过验证！'];
        }
    }

}