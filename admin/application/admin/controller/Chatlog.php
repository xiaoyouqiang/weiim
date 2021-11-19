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
class Chatlog extends Controller
{

    /**
     * 绑定数据表
     * @var string
     */
    protected $table = 'chatlog';

    public function index()
    {
        $this->title = '聊天记录管理';

        $query = $this->_query($this->table)->alias('a')->field('a.*,b.avatar img1,b.username username1,c.avatar img2,c.username username2');
        $query->join('chatuser b', 'a.toid = b.id')
            ->join('chatuser c', 'a.fromid = c.id')
            ->where('a.type', 'friend')
            ->order('a.id desc')
            ->like('content')
            ->page();
    }

}