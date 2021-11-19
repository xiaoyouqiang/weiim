<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

namespace think;

\think\Loader::import('controller/Jump', TRAIT_PATH, EXT);

use think\Exception;
use think\exception\ValidateException;

class FrontController extends Controller
{
    use \traits\controller\Jump;

    // 视图类实例
    protected $view;
    // Request实例
    protected $request;
    // 验证失败是否抛出异常
    protected $failException = false;
    // 是否批量验证
    protected $batchValidate = false;
    //当前登录用户信息
    protected $user = [];

    /**
     * 前置操作方法列表
     * @var array $beforeActionList
     * @access protected
     */
    protected $beforeActionList = [];

    /**
     * 架构函数
     * @param Request    $request     Request对象
     * @access public
     */
    public function __construct(Request $request = null)
    {
        parent::__construct();
    }

    public function _initialize()
    {
        $token = input('param.token') ?:cookie('uid');
        if (!isset($this->notNeedLogin) || $this->notNeedLogin == false) {
            if(!$this->isLogin()){
                $this->redirect( url('login/index'), 302 );
            }
            $this->user = db('chatuser')->where('id', $token)->find();
            if (empty($this->user['id'])) {
                $this->redirect( url('login/index'), 302 );
            }
        }
        $url="http://".$_SERVER ['HTTP_HOST'];
        preg_match("#\.(.*)#i",$url,$match);//获取根域名
        $domin = $match[1];
        $this->assign([
            'root_domain' => $_SERVER ['HTTP_HOST'],
            'domain' => $domin,
        ]);
    }

    public function isLogin()
    {
        $token = input('param.token') ?:cookie('uid');

        if( empty($token)){
            return false;
        }

        return true;
    }
}
