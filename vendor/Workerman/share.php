<?php
namespace app\index\controller;

use cmf\controller\HomeBaseController;
use think\Db;

class ArticleController extends HomeBaseController
{
    private $appid = 'wxefdf4fd4951cbe94'; //此处填写绑定的微信公众号的appid
    private $appsecret = '99300841bc8ccb9c42cd023fd369f20f'; //此处填写绑定的微信公众号的密钥id

    //文章详情页
    private function nonceStr($length){
        $str = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJK1NGJBQRSTUVWXYZ';//随即串，62个字符
        $strlen = 62;
        while($length > $strlen){
            $str .= $str;
            $strlen += 62;
        }
        $str = str_shuffle($str);
        return substr($str,0,$length);
    }
    private function http_get($url){
        $oCurl = curl_init();
        if(stripos($url,"https://")!==FALSE){
            curl_setopt($oCurl, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($oCurl, CURLOPT_SSL_VERIFYHOST, FALSE);
            curl_setopt($oCurl, CURLOPT_SSLVERSION, 1); //CURL_SSLVERSION_TLSv1
        }
        curl_setopt($oCurl, CURLOPT_URL, $url);
        curl_setopt($oCurl, CURLOPT_RETURNTRANSFER, 1 );
        $sContent = curl_exec($oCurl);
        $aStatus = curl_getinfo($oCurl);
        curl_close($oCurl);
        if(intval($aStatus["http_code"])==200){
            return $sContent;
        }else{
            return false;
        }
    }
    private function getWxConfig($jsapiTicket,$url,$timestamp,$nonceStr) {
        $string = "jsapi_ticket=$jsapiTicket&noncestr=$nonceStr&timestamp=$timestamp&url=$url";
        $signature = sha1 ( $string );

        $WxConfig["appId"] = $this->appid;
        $WxConfig["nonceStr"] = $nonceStr;
        $WxConfig["timestamp"] = $timestamp;
        $WxConfig["url"] = $url;
        $WxConfig["signature"] = $signature;
        $WxConfig["rawString"] = $string;
        return $WxConfig;
    }

    private function share() {
        $appid = $this->appid; //此处填写绑定的微信公众号的appid
        $appsecret = $this->appsecret; //此处填写绑定的微信公众号的密钥id
        $result = $this->http_get('https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$appid.'&secret='.$appsecret);
        $json = json_decode($result,true);
        $access_token = $json['access_token'];

        $url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token=$access_token";
        $res = json_decode ( $this->http_get ( $url ) );
        $ticket = $res->ticket;
        $surl = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
        $result = $this->getWxConfig( $ticket,$surl,time(),$this->nonceStr(16) );
        $result['surl'] = $surl;
        return $result;
    }

    public function index($id) {
        $id = (int)$id;
        $currentArticleId = $id;

        //如果缓存中没有当前文章数据
//        $currentArticle = Cache::get("currentArticle_{$currentArticleId}");
        $currentArticle = null;

        if (!$currentArticle) {
            //查询当前文章
            $currentArticle = Db::name('portal_post')
                ->field("id,post_content,post_home_page,post_public_number_name,post_reading_volume,post_watch_amount,post_jump_url,post_jump_domain_name,published_time,post_title")
                ->where("id = {$currentArticleId}")
                ->find();

            empty($currentArticle) && die('此文章不存在');
        }

        $currentDomain = $_SERVER['HTTP_HOST'];//当前域名
        //如果当前域名与起始域名相同，则按规则跳转
        if ($currentArticle['post_home_page'] == $currentDomain) {
            //把跳转网址与跳转域名格式化成数组(网址优先级大)
            $currentArticle['post_jump_url'] = json_decode($currentArticle['post_jump_url'], true);
            $currentArticle['post_jump_domain_name'] = json_decode($currentArticle['post_jump_domain_name'], true);
            if ($currentArticle['post_jump_url']) {
                $jumpUrlIndex = array_rand($currentArticle['post_jump_url'],1);//随机取值

                //如果匹配的网址没有http，则提示错误
                !strstr($currentArticle['post_jump_url'][$jumpUrlIndex],'http') && die("{$currentArticle['post_jump_url'][$jumpUrlIndex]}，跳转网址格式错误（缺少http头）");
                //随机跳转网址
                header("Location:{$currentArticle['post_jump_url'][$jumpUrlIndex]}");
                die;
            }
            if ($currentArticle['post_jump_domain_name']) {
                $jumpDomainNameIndex = array_rand($currentArticle['post_jump_domain_name'],1);//随机取值
                //随机跳转域名
                $requestUrl = $_SERVER['REQUEST_URI'];

                $http = 'http://';
//                !strstr($currentArticle['post_jump_domain_name'][$jumpDomainNameIndex],'http') && $http = 'http://';
                $targetUrl = $http . "{$currentArticle['post_jump_domain_name'][$jumpDomainNameIndex]}{$requestUrl}";//目标URL
                header("Location: {$targetUrl}");
                die;
            }
        }
        Db::name('portal_post')->where('id', $id)->setInc('post_hits');

        $domain = 'http://' . $currentArticle['post_home_page'];
        // $currentArticle['post_content'] = preg_replace('/src=&quot;default(.+)&quot;/', "src=&quot;" . $domain . '/upload/default' . "\${1}&quot;",  $currentArticle['post_content']);
        //	die;
        $currentArticle['post_content'] = str_replace('src=&quot;default/',"src=&quot;{$domain}/upload/default/",$currentArticle['post_content']);
        $currentArticle['post_content'] = htmlspecialchars_decode($currentArticle['post_content']);//将文章内容的html实体转标签


        $currentArticle['published_time'] = $this->getSpeciaiTime($currentArticle['published_time']);

        $share = $this->share();
        $this->assign('share', $share);
        $this->assign('currentArticle', $currentArticle);
        return $this->fetch();
    }

    //投诉
    public function complaint() {

        return $this->fetch();
    }

    //投诉内容
    public function complaintContent() {

        return $this->fetch();
    }

    /**
     * @desc 获取特殊日期（昨天 or 今天 or 明天 or demo 08-06）
     * @param int $time
     * @return int
     */
    private function getSpeciaiTime($time = 0) {

        $currentTime = time();//当前时间

        //昨天时间
        $yesterday = mktime(0,0,0,date("m"),date("d")-1,date("Y"));
        $yesterday = date("Y-m-d", $yesterday);
        $yesterdayStart = strtotime($yesterday  . ' 00:00:00');
        $yesterdayEnd = strtotime($yesterday  . ' 23:59:59');

        //今天时间
        $today = date("Y-m-d");
        $todayStart = strtotime($today  . ' 00:00:00');
        $todayEnd = strtotime($today  . ' 23:59:59');

        //明天时间
        $tomorrow = mktime(0,0,0,date("m"),date("d")+1,date("Y"));
        $tomorrow = date("Y-m-d", $tomorrow);
        $tomorrowStart = strtotime($tomorrow  . ' 00:00:00');
        $tomorrowEnd = strtotime($tomorrow  . ' 23:59:59');

        if ($time >= $yesterdayStart && $time <= $yesterdayEnd) {
            $time = '昨天';
        } else if ($time >= $todayStart && $time <= $todayEnd) {
            $time = '今天';
        } else if ($time >= $tomorrowStart && $time <= $tomorrowEnd) {
            $time = '明天';
        } else {
            $time = date('m-d', $time);//处理发布时间格式
        }
        return $time;
    }
}