resourceCount = 0;//已经成功加载完成的资源个数
var layer;
var socket;
var ping;
var layim;

function sendMessage(socket, data){
    data = JSON.parse(data);
    data['token'] = loginToken;
    socket.send(JSON.stringify(data));
}
function socketConnect()
{
    //建立WebSocket通讯
    socket = new WebSocket(socketDomain);
}

function socketOpen()
{
    var login_data = '{"type":"init","id":"' + mineGlobal.id +'","username":"' + mineGlobal.username + '","avatar":"' + mineGlobal.avatar +'","sign":"' + mineGlobal.sign + '"}';
    // socket.send(login_data);
    sendMessage(socket,login_data);

    console.log("websocket握手成功!");
    ping = setInterval(function () {
        // socket.send('{"type":"ping"}');
        sendMessage(socket,'{"type":"ping"}');
        console.log("ping...");
    }, 1000 * 10)
}

var disConnect = function(){
    layer.msg('socket连接断开,正在重连');
    clearInterval(ping);
    setTimeout(function(){
        reconnect();
    },5000);
}

function reconnect (){
    console.log('reconnecting...');
    socket = new WebSocket(socketDomain);
    socket.onmessage = function(res){
        onMessage(res);
    };
    socket.onopen = socketOpen;
    socket.onclose = disConnect;
}

function onMessage(res)
{
    var data = eval("(" + res.data + ")");
    console.log(data);

    switch (data['message_type']) {
        // 服务端ping客户端
        case 'ping':
            sendMessage(socket,'{"type":"ping"}');
            // socket.send('{"type":"ping"}');
            break;
        // 登录 更新用户列表
        case 'init':
            //console.log(data['id']+"登录成功");
            //layim.getMessage(res.data); //res.data即你发送消息传递的数据（阅读：监听发送的消息）
            break;
        //将新好友添加到列表
        case "addList":
            layim.addList(data.data);
            break;
        case 'delUser':
            layim.removeList({
                type: 'friend'
                , id: data.data.id //好友或者群组ID
            });
            break;
        // 添加 分组信息
        case 'addGroup':
            console.log('addgroup');
            console.log(data.data);

            layim.addList(data.data);
            break;
        case 'delGroup':
            layim.removeList({
                type: 'group'
                , id: data.data.id //好友或者群组ID
            });
            break;
        // 检测聊天数据
        case 'chatMessage':
            layim.getMessage(data.data);
            break;
        case "msgBox" :
            //为了等待页面加载，不然找不到消息盒子图标节点
            setTimeout(function () {
                if (data.count > 0) {
                    layim.msgbox(data.count);
                }
            }, 1000);
            break;
        // 离线消息推送
        case 'logMessage':
            setTimeout(function () {
                layim.getMessage(data.data)
            }, 1000);
            break;
        case 'logout':
            layim.setFriendStatus(data['id'], 'offline'); //设置指定好友在线，即头像置灰
            break;
        // 用户登录设置好友在线状态
        case 'login':
            layim.setFriendStatus(data['id'], 'online'); //设置指定好友在线，即头像置灰
            break;
    }
}
function loadJS(url) {
    var _doc = document.getElementsByTagName('head')[0];
    var js = document.createElement('script');

    js.setAttribute('type', 'text/javascript');
    js.setAttribute('src', url);
    _doc.appendChild(js);

    js.onload = function() {
        ++resourceCount;
        console.log('JS加载完成');
    }
}
function loadCSS(url) {
    var _doc = document.getElementsByTagName('head')[0];
    var css = document.createElement('link');

    css.setAttribute('rel', 'stylesheet');
    css.setAttribute('type', 'text/css');
    css.setAttribute('href', url);
    _doc.appendChild(css);

    css.onload = function() {
        ++resourceCount;
        console.log('CSS加载完成');
    }
}

//载入js,css资源
function importResource(baseUrl, loginToken)
{
    loadJS(baseUrl + '/static/layuinew/layui.js');
    loadJS(baseUrl + '/chat/login/dologinfromout?token='+loginToken);
    loadCSS( baseUrl + '/static/layuinew/css/layui.css');
    loadCSS( baseUrl + '/static/im/chatlog.css');
}
/**
 * imDomainUrl string im系统中的接口域名url，无需带http://
 * socketDomainUrl string im系统socket通信地址
 * loginToken 当前用户登录的token标识，imDomainUrl，socketDomainUrl请求时都会验证用户身份合法性
 */
function runIm(imDomainUrl, socketDomainUrl, loginToken)
{
    if (typeof(loginToken) == 'undefined' || typeof(socketDomainUrl) == 'undefined'
        || typeof(imDomainUrl) == 'undefined') {
        console.log('webIm启动失败，运行参数错误');
        return;
    }
    importResource('http://' + imDomainUrl, loginToken);
    var t;
    t = setTimeout(function()
        {
            if (resourceCount == 4) {
                clearTimeout(t);
                runAfter(imDomainUrl, socketDomainUrl, loginToken);
            }
        },
        1000);
}
mineGlobal = {};
function runAfter(imDomainUrl, socketDomainUrl, loginToken) {
    imDomainUrl = 'http://' + imDomainUrl + '/chat';
    socketDomain = socketDomainUrl;
    getListApi = imDomainUrl + '/index/getList';
    uploadFileApi = imDomainUrl + '/upload/uploadFile';
    chatlogApi = imDomainUrl + '/chatlog/detail';
    uploadImgApi = imDomainUrl + '/upload/uploadimg?token=' + loginToken;
    getMembersApi = imDomainUrl + '/index/getMembers?token=' + loginToken;
    messageboxApi = imDomainUrl + '/index/messagebox?token=' + loginToken;
    chatlogIndexApi = imDomainUrl + '/Chatlog/index';
    findIndexApi = imDomainUrl + '/find/index?token=' + loginToken;
    updateSignApi = imDomainUrl + '/index/updateSign';
    token = loginToken;

    layui.use('layer', function(){
        layer = layui.layer;
    });

    layui.use('layim', function(){
        layim = layui.layim;
        $.getJSON(getListApi, {'token':token}, function(res){
            if( 0 == res.code ){
                mineGlobal = res.data.mine;
                layim.config({
                    //获取主面板列表信息
                    init: {
                    //我的信息
                    mine: res.data.mine
                        //我的好友列表
                        ,friend: res.data.friend
                        ,group: res.data.group
                    }
                    //获取群员接口
                    ,members: {
                        url: getMembersApi //接口地址（返回的数据格式见下文）
                        ,type: 'get' //默认get，一般可不填
                        ,data: {} //额外参数
                    },
                    uploadFile: {
                        url: uploadFileApi
                    }
                    ,uploadImage: {
                        url: uploadImgApi
                    }
                    ,tool: [{
                        alias: 'code' //工具别名
                        ,title: '代码' //工具名称
                        ,icon: '&#xe64e;' //工具图标，参考图标文档
                    }]
                    ,msgbox: messageboxApi //消息盒子页面地址，若不开启，剔除该项即可
                    ,isAudio:true
                    ,notice:true
                    ,brief: false //是否简约模式（默认false，如果只用到在线客服，且不想显示主面板，可以设置 true）
                    ,title: '我的LayIM' //主面板最小化后显示的名称
                    ,maxLength: 3000 //最长发送的字符长度，默认3000
                    ,isfriend: true //是否开启好友（默认true，即开启）
                    ,isgroup: true //是否开启群组（默认true，即开启）
                    ,right: '0px' //默认0px，用于设定主面板右偏移量。该参数可避免遮盖你页面右下角已经的bar。
                    ,chatLog: chatlogIndexApi //聊天记录地址（如果未填则不显示）
                    ,find: findIndexApi //查找好友/群的地址（如果未填则不显示）
                    ,copyright: true //是否授权，如果通过官网捐赠获得LayIM，此处可填true
                });
                layImAfter();
            }
        });

        function layImAfter()
        {
            //建立WebSocket通讯
            socketConnect();

            //连接成功时触发
            socket.onopen = socketOpen;

            socket.onclose = disConnect;

            //监听收到的消息
            socket.onmessage = function (res)
            {
                onMessage(res);
            };

            layim.on('sign', function(value){
                $.ajax({
                    url:updateSignApi,
                    type:"post",
                    data:{sign:value,token:loginToken},
                    dataType:"json",
                    success:function (res) {
                        if(res.code == 200){
                            layer.msg(res.msg)
                        }else{
                            layer.msg(res.msg,function () {})
                        }
                    },
                    error:function () {
                        layer.msg("网络繁忙",function(){});
                    }
                })
            });

            layim.on('tool(code)', function(insert, send, obj){ //事件中的tool为固定字符，而code则为过滤器，对应的是工具别名（alias）
                layer.prompt({
                    title: '插入代码'
                    ,formType: 2
                    ,shade: 0
                }, function(text, index){
                    layer.close(index);
                    insert('[pre class=layui-code]' + text + '[/pre]'); //将内容插入到编辑器，主要由insert完成
                    //send(); //自动发送
                });
            });

            layim.on('chatChange', function(obj){
                var type = obj.data.type;
                if(type === 'friend'){
                    if(obj.data.status == 'online'){
                        layim.setChatStatus('<span style="color:#FF5722;">在线</span>'); //模拟标注好友在线状态
                    }else{
                        layim.setChatStatus('<span style="color:#666;">离线</span>'); //模拟标注好友在线状态
                    }
                }
            });

            //layim建立就绪
                layim.on('sendMessage', function(res){
                    if (typeof(res.to.type) == 'undefined' && res.mine.id == res.to.id) {
                        layer.alert('不能给自己发消息');
                        return;
                    }
                    var mine = JSON.stringify(res.mine);
                    var to = JSON.stringify(res.to);
                    var message_data = '{"type":"chatMessage","data":{"mine":'+mine+', "to":'+to+'}}';
                    sendMessage(socket,message_data);
                });

        }
    });
}