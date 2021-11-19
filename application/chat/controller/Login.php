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
use think\Loader;

class Login extends FrontController
{
    //登录页面逻辑不检查登录
    protected $notNeedLogin = true;

    public function getImgCode()
    {
        @session_start();
        Loader::import('imgcode.ValidateCode', EXTEND_PATH, '.php');
        $code = new \ValidateCode();  //实例化一个对象
        $code->doimg();
        $_SESSION['img_code'] = $code->getCode();//验证码保存到SESSION中
    }

    //发送短信验证码
    public function sendPhoneCode()
    {
        @session_start();
        $imgCode = input('param.code');
        $phone = input('param.phone');

        if (empty($imgCode) || empty($phone) ) {
            return json( ['code' => 0, 'data' => [], 'msg' => '参数错误' ] );
        }
        if($imgCode != $_SESSION["img_code"]) {
            return json( ['code' => 0, 'data' => [], 'msg' => '验证输入错误' ] );
        }

        Loader::import('aliyun-sms.api_demo.SmsDemo', EXTEND_PATH, '.php');

        $smsCode = rand(1111,9999);
        $response = \SmsDemo::sendSms($phone,'SMS_140625229', ['code'=>$smsCode]);
        $result = (array)$response;
        $msg = '发送成功';
        $code = 1;
        if ($result && $result['Code'] != 'OK') {
            $code = 0;
            $msg = $result['Message'];
        }
        $time = time();
        //验证码入库
        $smsCode = [
            'phone'   => trim($phone),
            'code'    => $smsCode,
            'msg' => $msg,
            'created_time'      => $time,
            'updated_time'      => $time,
            'expire_time'      => $time + 60

        ];
        db('sms_code')->insert($smsCode);

        //发送短信验证码
        return json( ['code' => $code, 'data' => [], 'msg' => $msg ] );
    }

    //注册
    public function register()
    {
        $nickname = input('param.nickname');
        $phone = input('param.phone');
        $code = input('param.code');
        $pwd = input('param.pwd');

        if ($nickname && $phone && $code && $pwd) {
            $smsCode = db('sms_code')->where('phone', $phone)->where('code', $code)->find();
            if (!$smsCode || $smsCode['expire_time'] <= time()) {
                return json( ['code' => 0, 'data' => [], 'msg' => '短信验证码错误' ] );
            }

            $user = db('chatuser')->where('phone', $phone)->find();
            if ($user) {
                return json( ['code' => 0, 'data' => [], 'msg' => '该手机已注册' ] );
            }
            $time = time();
            $user = [
                'username'   => trim($nickname),
                'phone'   => trim($phone),
                'avatar' => '/uploads/20190907/m.jpg',
                'pwd'    => md5(trim($pwd)),
                'created_time'      => $time,
                'updated_time'      => $time
            ];
            db('chatuser')->insert($user);

            return json( ['code' => 1, 'data' => [], 'msg' => '注册成功' ] );
        }
        return json( ['code' => 0, 'data' => [], 'msg' => '注册失败' ] );
    }

    public function index()
    {
        return $this->fetch();
    }

    public function doLoginFromOut()
    {
        header('P3P: CP="CURa ADMa DEVa PSAo PSDo OUR BUS UNI PUR INT DEM STA PRE COM NAV OTC NOI DSP COR"');
        $token = input('param.token');
        cookie('uid', $token);
    }

    public function doLogin()
    {
    	$phone = input('param.phone');
    	$userinfo = db('chatuser')->where('phone', $phone)->find();

    	if( empty($userinfo) ){
    		$this->error("用户不存在");
    	}

        $pwd = input('param.pwd');
		if( md5($pwd) != $userinfo['pwd'] ){
            $this->error("密码不正确");
        }
    	
    	//设置为登录状态
    	db('chatuser')->where('phone', $phone)->setField('status', 'online');
    	
    	cookie( 'uid', $userinfo['id'] );
    	cookie( 'username', $userinfo['username'] );
        cookie( 'avatar', $userinfo['avatar'] );
        cookie( 'sign', $userinfo['sign'] );

        if (isMobile()) {
            $this->redirect(url('index/index'));
        } else {
            $this->redirect(url('index/pc'));
        }
    }
    
}
