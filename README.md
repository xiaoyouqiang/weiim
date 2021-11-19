# WeiIm
webIM即时通讯系统
 
前端 layIM

后端  workerman+thinkphp5

功能:  
1、后台管理:用户管理、消息管理、群管理   
2、单聊、群聊、加好友、好友列表 
3、创建群、加群、删除群、群成员管理  
4、离线消息上线推送  
5、文字、表情、图片、文件发送  
6、聊天记录查看  
7、断线重连、声音提醒、高并发集群扩展  
8、良好的二次开发支持

# 关于LayIM
layIM 是一套前端UI,不开源，商用需去http://layim.layui.com 购买授权  

# 安装运行  
1、下载代码，按 tp5框架的配置方式配置好运行环境
  
2、导入 根目录的 webim.sql

3、workerman的数据库配置，vendor/Workerman/Applications/Config/Db.php

\application\index\controller\index.php 中的socket地址和端口配置

3、启动 getwayworker

windows 环境:

运行 /vendor/Workerman/start_for_win.bat,然后不要关闭窗口。

linux 环境:

去workman官网 下载 linux 版本 gatewayworker。
请先阅读 gatewayworker 文档，启动linux下的 gatewayworker

# 体验
http://www.opapis.com/

