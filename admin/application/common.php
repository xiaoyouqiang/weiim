<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件

/**
 * @desc php截取字符串(带中文)，多余的省略号代替
 * @param $text
 * @param $length
 * @return string
 */
function subText($text, $length = 8)
{
    if (mb_strlen($text, 'utf8') > $length) {
        return mb_substr($text, 0, $length, 'utf8') . '...';
    } else {
        return $text;
    }
}