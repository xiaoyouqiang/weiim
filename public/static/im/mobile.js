groupDiv = 0;
search_user_tpl = "    <div id=\"user_list\">\n" +
    "            {{#  layui.each(d.data, function(index, item){ }}\n" +
    "            <div class=\"friend_item\" style=\"border: 3px solid #f6f6f6;\">\n" +
    "                <div>\n" +
    "                    <h5 style=\"font-size: 14px\">{{item.username}}</h5>\n" +
    "                </div>\n" +
    "                <div style=\"margin-top:15px;margin-bottom: 75px;\">\n" +
    "                    <div style=\"margin: 0 auto;float:left;\">\n" +
    "                        <img src=\"{{item.avatar}}\" width=\"50px\" height=\"50px\"/>\n" +
    "                    </div>\n" +
    "                    <div style=\"float: right\"><button class=\"layui-btn layui-btn-bs\" type=\"button\" onclick=\"addFriend('{{item.id}}','{{item.username}}','{{item.avatar}}')\">添加</button></div>\n" +
    "                </div>\n" +
    "            </div>\n" +
    "            {{#  }); }}\n" +
    "        </div>\n" +
    "\n" +
    "        {{#  if(d.page < d.totalPage){ }}\n" +
    "        <div id=\"moreUserList\" style=\"text-align:center\"><button onclick=\"findUser({{d.page}} + 1)\" style=\"width: 15%;\"class=\"layui-btn layui-btn-normal\" type=\"button\">加载更多...</button></div>\n" +
    "        {{#  } }}\n" +
    "\n" +
    "        {{#  if(d.data.length === 0){ }}\n" +
    "        <div style=\"text-align: center;color: red\">没有找到用户</div>\n" +
    "        {{#  } }}";

search_group_tpl = " <div id=\"group_list\">\n" +
    "            {{#  layui.each(d.data, function(index, item){ }}\n" +
    "            <div class=\"friend_item\" style=\"border: 3px solid #f6f6f6;\">\n" +
    "                <div>\n" +
    "                    <h5 style=\"font-size: 14px\">{{item.groupname}}</h5>\n" +
    "                </div>\n" +
    "                <div style=\"margin-top:15px;margin-bottom: 75px;\">\n" +
    "                    <div style=\"margin: 0 auto;float:left;\">\n" +
    "                        <img src=\"{{item.avatar}}\" width=\"50px\" height=\"50px\"/>\n" +
    "                    </div>\n" +
    "                    <div style=\"float: right\"><button class=\"layui-btn layui-btn-bs\" type=\"button\" onclick=\"joinGroup('{{item.id}}')\">添加</button></div>\n" +
    "                </div>\n" +
    "            </div>\n" +
    "            {{#  }); }}\n" +
    "        </div>\n" +
    "\n" +
    "        {{#  if(d.page < d.totalPage){ }}\n" +
    "        <div id=\"moreGroupList\" style=\"text-align:center\"><button onclick=\"findGroup({{d.page}} + 1)\" style=\"width: 15%;\"class=\"layui-btn layui-btn-normal\" type=\"button\">加载更多...</button></div>\n" +
    "        {{#  } }}\n" +
    "\n" +
    "        {{#  if(d.data.length === 0){ }}\n" +
    "        <div style=\"text-align: center;color: red\">没有找到群</div>\n" +
    "        {{#  } }}";

new_friend_tpl = "   <div class=\"layui-tab layui-tab-brief\" lay-filter=\"docDemoTabBrief\">\n" +
    "            <ul class=\"layui-tab-title\">\n" +
    "                <li class=\"layui-this\">好友请求</li>\n" +
    "                <li>添加好友</li>\n" +
    "                <li>添加群</li>\n" +
    "            </ul>\n" +
    "            <div class=\"layui-tab-content\">\n" +
    "                <div class=\"layui-tab-item layui-show\">\n" +
    "                    <div class=\"friend_request_list\" id=\"friend_request_list\">\n" +
    "                        {{#  layui.each(d.data.list, function(index, item){ }}\n" +
    "                        <div class=\"friend_item\" style=\"border: 3px solid #f6f6f6;\">\n" +
    "                            <div>\n" +
    "                                <h5 style=\"font-size: 14px\">{{item.username}}</h5>\n" +
    "                                <h5 style=\"font-size: 14px\">{{item.time}}</h5>\n" +
    "                            </div>\n" +
    "                            <div style=\"margin-top:15px;margin-bottom: 75px;\">\n" +
    "                                <div style=\"margin: 0 auto;float:left;\">\n" +
    "                                    <img src=\"{{item.avatar}}\" width=\"50px\" height=\"50px\"/>\n" +
    "                                </div>\n" +
    "                                <div style=\"float: right\">\n" +
    "                                    {{#  if(item.status == 2){ }}\n" +
    "                                    <span>已拒绝</span>\n" +
    "                                    {{#  } }}\n" +
    "                                    {{#  if(item.status == 1){ }}\n" +
    "                                    <span>已同意</span>\n" +
    "                                    {{#  } }}\n" +
    "                                    {{#  if(item.status == 0){ }}\n" +
    "                                    <button style=\"display: block;margin-top:5px\" class=\"layui-btn layui-btn-xs\" type=\"button\" onclick=\"agree({{item.id}}, {{item.user_id}}, this)\">接受</button>\n" +
    "                                    <button style=\"display: block;margin-top:5px;margin-left:0px\" class=\"layui-btn layui-btn-xs\" type=\"button\" onclick=\"refuse({{item.id}},this)\">拒绝</button>\n" +
    "                                    {{#  } }}\n" +
    "                                </div>\n" +
    "                            </div>\n" +
    "                        </div>\n" +
    "                        {{#  }); }}\n" +
    "                    </div>\n" +
    "                    {{#  if(d.data.page < d.data.totalPage){ }}\n" +
    "                    <div id=\"moreFriendRquestList\" style=\"text-align:center\"><button onclick=\"friendRequestList({{d.data.page}} + 1)\" style=\"width: 15%;\"class=\"layui-btn layui-btn-normal\" type=\"button\">加载更多...</button></div>\n" +
    "                    {{#  } }}\n" +
    "                </div>\n" +
    "                <div class=\"layui-tab-item\">\n" +
    "                    <div>\n" +
    "                        <input style=\"display: inline-block;width: 70%;\" type=\"text\" id=\"user-wd\" required lay-verify=\"required\" placeholder=\"请输入昵称\" autocomplete=\"off\" class=\"layui-input\"><button onclick=\"findUser(1)\" style=\"width: 15%;\"class=\"layui-btn layui-btn-normal\" type=\"button\">查询</button>\n" +
    "                    </div>\n" +
    "                    <div class=\"add_friend_list\" id=\"search_user\">\n" +
    "\n" +
    "                    </div>\n" +
    "                </div>\n" +
    "                <div class=\"layui-tab-item\">\n" +
    "                    <div style=\"text-align: center;margin-bottom: 10px\">\n" +
    "                        <button id=\"createGroup\" onclick=\"createGroup()\" style=\"width: 15%;\"class=\"layui-btn layui-btn-normal\" type=\"button\">创建群</button>\n" +
    "                    </div>\n" +
    "                    <div>\n" +
    "                        <input style=\"display: inline-block;width: 70%;\" type=\"text\" id=\"group-wd\" required lay-verify=\"required\" placeholder=\"请输入群名称\" autocomplete=\"off\" class=\"layui-input\"><button onclick=\"findGroup(1)\" style=\"width: 15%;\"class=\"layui-btn layui-btn-normal\" type=\"button\">查询</button>\n" +
    "                    </div>\n" +
    "                    <div class=\"add_group_list\" id=\"search_group\">\n" +
    "\n" +
    "                    </div>\n" +
    "                </div>\n" +
    "            </div>\n" +
    "        </div>";
a = "    {{#  if(d.data.owner.is_owner){ }}\n" +
    "        <div style=\"text-align: center\"><button class=\"layui-btn layui-btn-normal\" type=\"button\"  onclick=\"removeGroup('{{d.data.owner.group_id}}')\">解散群</button></div>\n" +
    "        {{#  } }}\n" +
    "\n" +
    "        {{#  layui.each(d.data.list, function(index, item){ }}\n" +
    "        <div class=\"col-sm-3\" style=\"border: 3px solid #f6f6f6;width: 30%;float: left;text-align: center\">\n" +
    "            <div>\n" +
    "                <div>\n" +
    "                    <h5 style=\"font-size: 14px\">{{item.username}}</h5>\n" +
    "                </div>\n" +
    "                <div style=\"margin-top:15px;margin-bottom: 75px;\">\n" +
    "                    <div style=\"margin: 0 auto;float:left;\">\n" +
    "                        <img src=\"{{item.avatar}}\" width=\"50px\" height=\"50px\"/>\n" +
    "                    </div>\n" +
    "                    {{#  if(d.data.owner.is_owner){ }}\n" +
    "                    <div style=\"float: right\"><button class=\"layui-btn layui-btn-xs\" type=\"button\" onclick=\"remove(this, '{{item.id}}', '{{d.data.owner.group_id}}')\">删除</button></div>\n" +
    "                    {{#  } }}\n" +
    "                </div>\n" +
    "            </div>\n" +
    "        </div>\n" +
    "        {{#  }); }}\n" +
    "        {{#  if(d.data.list.length === 0){ }}\n" +
    "        <div class=\"col-sm-12\">\n" +
    "            无成员\n" +
    "        </div>\n" +
    "        {{#  } }}";

group_members_tpl = "    {{#  if(d.data.owner.is_owner){ }}\n" +
    "        <div style=\"text-align: center\"><button class=\"layui-btn layui-btn-normal\" type=\"button\"  onclick=\"removeGroup('{{d.data.owner.group_id}}')\">解散群</button></div>\n" +
    "        {{#  } }}\n" +
    "\n" +
    "        {{#  layui.each(d.data.list, function(index, item){ }}\n" +
    "        <div class=\"col-sm-3\" style=\"border: 3px solid #f6f6f6;width: 30%;float: left;text-align: center\">\n" +
    "            <div>\n" +
    "                <div>\n" +
    "                    <h5 style=\"font-size: 14px\">{{item.username}}</h5>\n" +
    "                </div>\n" +
    "                <div style=\"margin-top:15px;margin-bottom: 75px;\">\n" +
    "                    <div style=\"margin: 0 auto;float:left;\">\n" +
    "                        <img src=\"{{item.avatar}}\" width=\"50px\" height=\"50px\"/>\n" +
    "                    </div>\n" +
    "                    {{#  if(d.data.owner.is_owner){ }}\n" +
    "                    <div style=\"float: right\"><button class=\"layui-btn layui-btn-xs\" type=\"button\" onclick=\"remove(this, '{{item.id}}', '{{d.data.owner.group_id}}')\">删除</button></div>\n" +
    "                    {{#  } }}\n" +
    "                </div>\n" +
    "            </div>\n" +
    "        </div>\n" +
    "        {{#  }); }}\n" +
    "        {{#  if(d.data.list.length === 0){ }}\n" +
    "        <div class=\"col-sm-12\">\n" +
    "            无成员\n" +
    "        </div>\n" +
    "        {{#  } }}";
function createGroup()
{
    if (groupDiv == 1) {
        $('#group_div').show();
        return ;
    }
    var divCover = document.createElement('div');
    var div = document.createElement('div');
    var divTitle = document.createElement('div');
    var iframe = document.createElement('iframe');
    var a = document.createElement('a');
    a.innerHTML = '关闭';
    a.onclick = function(){
        $('#group_div').hide();
    };
    divTitle.append(a);
    divTitle.style = "padding-bottom: 10px;padding-top: 10px;background-color: #5fb878";
    div.append(divTitle);
    div.id = "group_div";
    iframe.width = 300;
    iframe.height = 240;
    iframe.algin = 'middle';
    iframe.style = 'z-index:99999999;position:relative;border:none';
    iframe.src = addgroupmobileApi;     //填自己的js路径
    div.style = 'z-index:99999999;text-align:center;position:relative;margin: 0 auto;top: 250px:background-color: white;width: 300px;top: 250px';
    divCover.style = 'z-index:99999999;opacity:0.9;position: relative;background-color: #e7eaec';
    div.append(iframe);
    divCover.append(div);
    $('body').append(divCover);
    groupDiv = 1;
}
function joinGroup(groupid)
{
    $.getJSON(joinGroupApi, {'gid' : groupid, 'token':token}, function(res){
        if( 1 == res.code ){
            var join_data = res.data;
            // socket.send( join_data );//发送socket
            var join_data_new = JSON.parse(join_data);
            var group_data = join_data_new.data;
            sendMessage(socket,join_data);
            var data = {
                type: 'group' //列表类型，只支持friend和group两种
                ,avatar: group_data.avatar //群组头像
                ,groupname: group_data.groupname //群组名称
                ,id: group_data.id //群组id
            };
            layim.addList(data); //如果是在iframe页，如LayIM设定的add面板，则为 parent.layui.layim.addList(data);
            layer.msg( res.msg);
        }else{
            layer.msg( res.msg);
        }
    })
}
function refuse(id,obj)
{
    $.ajax({
        url : refuseFriendApi,
        type: "post",
        data: {id:id, token:token},
        dataType:"json",
        success:function (res) {
            if (1 == res.code){
                layer.msg(res.msg)
                //如果成功了，发出socket消息，通知被拒绝者
                $(obj).parent().html('<span>已拒绝</span>');
                sendMessage(socket,JSON.stringify({type:"refuseFriend",id:id}))
            }else{
                layer.msg(res.msg)
            }
        },
        error: function () {
            layer.msg("网络繁忙",function(){})
        }
    });
}
function agree(id,uid,obj)
{
    $.ajax({
        url:agreeFriendApi,
        type:"post",
        data:{id:id,groupid:0,token:token},
        dataType:"json",
        success:function (res) {
            console.log(res);
            //执行添加好友操作
            if (1 == res.code){
                fromgroup = 0;
                console.log(uid)
                console.log(fromgroup)
                sendMessage(socket, JSON.stringify({type:"agreeFriend",user_id:uid,fromgroup:fromgroup}))//通知对方，我已同意，把我加入到对方好友列表并添加消息提醒
                layim.addList(res.data); //将刚通过的好友追加到好友列表
                $(obj).parent().html('<span>已同意</span>');
            } else {
                layer.msg(res.msg);
            }
        },
        error:function () {
            layer.msg("网络繁忙");
        }
    });
}
function addFriend(id)
{
    layui.use('layim', function(layim){
        layer.open({
            content: '<textarea class="layui-textarea" placeholder="验证信息" id="friend_memo"></textarea>'
            ,btn: ['确定', '取消']
            ,yes: function(index){
                var remark = $('#friend_memo').val()
                $.getJSON(addFriendApi, {'to_user_id' : id, 'group' : 0, 'remark' : remark,'token':token}, function(res){
                    if( 1 == res.code ){
                        var data = {type:"addFriend",to_user_id:id,to_friend_group_id:0,remark:remark};
                        sendMessage(socket, JSON.stringify(data));
                        layer.msg(res.msg);
                    }else{
                        layer.msg(res.msg);
                    }
                })
            }
        });
    });
}
function friendRequestList(page)
{
    $.getJSON(friendRequestListApi, {'page':page,'token':token}, function(res){
        if (page > 1) {
            var htmlStr = '';
            for (let index in res.data.list) {
                var username = res.data.list[index].username;
                var time = res.data.list[index].time;
                var avatar = res.data.list[index].avatar;
                var id = res.data.list[index].id;
                var user_id = res.data.list[index].user_id;
                var status = res.data.list[index].status;
                var statusStr = "<button style=\"display: block;margin-top:5px\" class=\"layui-btn layui-btn-xs\" type=\"button\" onclick='agree(" + id + "," + user_id + ",this)'>接受</button>\n" +
                    " <button style=\"display: block;margin-top:5px;margin-left:0px\" class=\"layui-btn layui-btn-xs\" type=\"button\" onclick='refuse(\" + id + \",this)'>拒绝</button>\n";
                if (status == 2) {
                    statusStr = "<span>已拒绝</span>"
                }
                if (status == 1) {
                    statusStr = "<span>已同意</span>"
                }

                htmlStr += " <div class=\"friend_item\" style=\"border: 3px solid #f6f6f6;\">\n" +
                    "                        <div>\n" +
                    "                            <h5 style=\"font-size: 14px\">" + username +"</h5>\n" +
                    "                            <h5 style=\"font-size: 14px\">" + time +"</h5>\n" +
                    "                        </div>\n" +
                    "                        <div style=\"margin-top:15px;margin-bottom: 75px;\">\n" +
                    "                            <div style=\"margin: 0 auto;float:left;\">\n" +
                    "                                <img src='" + avatar + "' width=\"50px\" height=\"50px\"/>\n" +
                    "                            </div>\n" +
                    "                            <div style=\"float: right\">\n" + statusStr +
                    "                            </div>\n" +
                    "                        </div>\n" +
                    "                    </div>";
            }
            $('#friend_request_list').html(htmlStr);
            var buttonStr = "<button onclick=\"friendRequestList(" + (page + 1) +")\" style=\"width: 15%;\"class=\"layui-btn layui-btn-normal\" type=\"button\">加载更多...</button>";
            $('#moreFriendRquestList').html(buttonStr);

            if (res.data.page >= res.data.totalPage) {
                $('#moreFriendRquestList').hide();
            }
        } else {
            var getTpl = new_friend_tpl;
            var html_friend = '';
            laytpl(getTpl).render(res, function(html){
                html_friend = html;
            });
            newLayer = layim.panel({
                title: '新的朋友/群' //标题
                ,tpl: html_friend //模版，基于laytpl语法
                ,data: { //数据
                    test: '么么哒'
                }
            });
        }
    });
}

function getChatLog(id, username, type, page)
{
    $.getJSON(chatlogApi, {'id' : id, 'type' : type, 'page':page, 'token':loginToken}, function(res){
        _html = '';
        $.each(res.data, function(k, v){
            var id = v.fromid;
            _html += '<div class="chat-message">\n' +
                '    <div class="avatar"><img src="' + res.chat_users[id]['avatar'] + '"></div>\n' +
                '    <div class="chatright">\n' +
                '        <div class="chattitle">\n' +
                '            <div class="username">' +  v.fromname + '</div>\n' +
                '            <div class="chattime">'+ getLocalTime(v.timeline) + '</div>\n' +
                '        </div>\n' +
                '        <div class="chatcontent">'+ layim.content(v.content) + '</div>\n' +
                '    </div>\n' +
                '</div>' +
                ' <div class="chatclear"></div>';
        });

        if (page > 1) {
            $("#chatlog").html(_html);
            var buttonStr = "<button onclick=\"getChatLog(" + id + ",'" + username + "','" + type + "'," + (page + 1) + ")\" style=\"width: 15%;\"class=\"layui-btn layui-btn-normal\" type=\"button\">加载更多...</button>";
            $('#moreChatLog').html(buttonStr);

            if (res.page >= res.totalPage) {
                $('#moreChatLog').hide();
            }
        } else {
            var html_chatlog =  "<div id='chatlog'>" + _html + "</div>" +
            "<div id=\"moreChatLog\" style=\"text-align:center\"><button onclick=\"getChatLog(" + id + ",'" + username + "','" + type + "'," + (page + 1) + ")\" style=\"width: 15%;\"class=\"layui-btn layui-btn-normal\" type=\"button\">加载更多...</button></div>\n";

            layim.panel({
                title: '与 '+ username +' 的聊天记录' //标题
                ,tpl: html_chatlog //模版，基于laytpl语法
                ,data: { //数据
                    test: 'Hello'
                }
            });
        }
    });
}

function findGroup(page)
{
    groupName = $('#group-wd').val();
    if( '' == groupName ){
        layer.msg('群名称不能为空');
        return;
    }
    $.getJSON(findGroupApi, {'group_name':groupName, 'page':page, 'token':token}, function(res){
        if (page > 1) {
            var htmlStr = '';
            var nextPage = page + 1;
            for (let index in res.data) {
                var groupname = res.data[index].groupname;
                var id = res.data[index].id;
                var avatar = res.data[index].avatar;
                htmlStr += " <div class=\"friend_item\" style=\"border: 3px solid #f6f6f6;\">\n" +
                    "        <div>\n" +
                    "            <h5 style=\"font-size: 14px\">"+ groupname +"</h5>\n" +
                    "        </div>\n" +
                    "        <div style=\"margin-top:15px;margin-bottom: 75px;\">\n" +
                    "            <div style=\"margin: 0 auto;float:left;\">\n" +
                    "                <img src='"+ avatar + "' width=\"50px\" height=\"50px\"/>\n" +
                    "            </div>\n" +
                    "            <div style=\"float: right\"><button class=\"layui-btn layui-btn-bs\" type=\"button\" onclick=\"joinGroup('" + id + "')\">添加</button></div>\n" +
                    "        </div>\n" +
                    "    </div>";
            }
            $('#group_list').html(htmlStr);
            var buttonStr = "<button onclick='findGroup(" + nextPage + ")' style=\"width: 15%;\"class=\"layui-btn layui-btn-normal\" type=\"button\">加载更多...</button>";
            $('#moreGroupList').html(buttonStr);
            if (res.page >= res.totalPage) {
                $('#moreGroupList').hide();
            }
        } else {
            var getTpl = search_group_tpl
                ,view = document.getElementById('search_group');
            laytpl(getTpl).render(res, function(html){
                view.innerHTML = html;
            });
        }
    })
}
function findUser(page)
{
    wd = $('#user-wd').val();
    if( '' == wd ){
        layer.msg('昵称不能为空');
        return;
    }
    $.getJSON(searchUserApi, {'user_name':wd, 'page':page, 'token':token}, function(res){
        if (page > 1) {
            var htmlStr = '';
            var nextPage = page + 1;
            for (let index in res.data) {
                var username = res.data.list[index].username;
                var id = res.data.list[index].id;
                var avatar = res.data.list[index].avatar;

                htmlStr += " <div class=\"friend_item\" style=\"border: 3px solid #f6f6f6;\">\n" +
                    "        <div>\n" +
                    "            <h5 style=\"font-size: 14px\">"+ username +"</h5>\n" +
                    "        </div>\n" +
                    "        <div style=\"margin-top:15px;margin-bottom: 75px;\">\n" +
                    "            <div style=\"margin: 0 auto;float:left;\">\n" +
                    "                <img src='"+ avatar + "' width=\"50px\" height=\"50px\"/>\n" +
                    "            </div>\n" +
                    "            <div style=\"float: right\"><button class=\"layui-btn layui-btn-bs\" type=\"button\" onclick=\"addFriend('" + id + "')\">添加</button></div>\n" +
                    "        </div>\n" +
                    "    </div>";
            }
            $('#user_list').html(htmlStr);
            var buttonStr = "<button onclick='findUser("+ nextPage +")' style=\"width: 15%;\"class=\"layui-btn layui-btn-normal\" type=\"button\">加载更多...</button>";
            $('#user_list').html(buttonStr);
            if (res.page >= res.totalPage) {
                $('#moreUserList').hide();
            }
        } else {
            var getTpl = search_user_tpl
                ,view = document.getElementById('search_user');
            laytpl(getTpl).render(res, function(html){
                view.innerHTML = html;
            });
        }
    })
}
//移除成员
function remove(obj, uid, gid)
{
    $.getJSON(removeMembersApi, {'uid' : uid, 'gid' : gid, 'token':token}, function(res){
        if( 1 == res.code ){
            layer.msg(res.msg);
            $(obj).parent().parent().parent().parent().remove();
            var add_data = '{"type":"removeMember", "data" : {"id" : ' + gid + ', "uid" : ' + uid + '}}';
            sendMessage(socket,add_data);
        } else {
            layer.msg(res.msg);
        }
    })
}
//解散群组
function　removeGroup(gid)
{
    layer.open({
        content: '解散群组？'
        ,btn: ['确定', '取消']
        ,yes: function(index){
            if( '' == gid ){
                layer.msg( '请选择群组');
                return;
            }
            $.getJSON(removegroupApi, {'gid' : gid, 'token':token}, function(res){
                if( 1 == res.code ){
                    var add_data = '{"type":"delGroup", "data" : {"id" : ' + gid + '}}';
                    sendMessage(socket,add_data);
                    layer.msg(res.msg);
                }else{
                    layer.msg(res.msg);
                }
            });
            layer.close(index);
            window.location.reload();
        }
    });
}
function getLocalTime(nS) {
    return new Date(parseInt(nS) * 1000).toLocaleString().replace(/年|月/g, "-").replace(/日/g, "");
}

var socket;
var ping;
var layim;
function sendMessage(socket, data){
    data = JSON.parse(data);
    data['token'] = token;
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
    var data = eval("("+res.data+")");
    switch(data['message_type']){
        // 服务端ping客户端
        case 'ping':
            sendMessage(socket,'{"type":"ping"}');
            break;
        // 登录 更新用户列表
        case 'init':
            //console.log(data['id']+"登录成功");
            //layim.getMessage(res.data); //res.data即你发送消息传递的数据（阅读：监听发送的消息）
            break;
        //好友请求
        case 'friendRequest':
            layim.showNew('List', true); //标注“联系人”新动态
            layim.showNew('Friend', true); //标注“新的朋友”新动态
            break;
        //添加 用户
        case 'addUser':
            //console.log(data.data);
            layim.addList(data.data);
            break;
        //删除 用户
        case 'delUser':
            layim.removeList({
                type: 'friend'
                ,id: data.data.id //好友或者群组ID
            });
            break;
        // 添加 分组信息
        case 'addGroup':
            console.log(data);
            layim.addList(data.data);
            break;
        case 'delGroup':
            console.log('delGroup');
            layim.removeList({
                type: 'group'
                ,id: data.data.id //好友或者群组ID
            });
            break;
        // 检测聊天数据
        case 'chatMessage':
            //console.log(data.data);
            layim.getMessage(data.data);
            break;
        // 离线消息推送
        case 'logMessage':
            setTimeout(function(){layim.getMessage(data.data)}, 1000);
            break;
        // 用户退出 更新用户列表
        case 'logout':
            layim.setFriendStatus(data['id'], 'offline'); //设置指定好友在线，即头像置灰
            break;
        // 用户登录设置好友在线状态
        case 'login':
            layim.setFriendStatus(data['id'], 'online'); //设置指定好友在线，即头像置灰
            break;
    }
}

resourceCount = 0;//已经成功加载完成的资源个数
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
function importResource(baseUrl)
{
    loadJS(baseUrl + '/static/layuinew/layui.js');
    loadJS(baseUrl + '/static/layuinew/lay/modules/layer.mobile.js');
    loadCSS( baseUrl + '/static/layuinew/css/layui.css');
    loadCSS( baseUrl + '/static/layuinew/css/layui.mobile.css');
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
    importResource('http://' + imDomainUrl);
    var t;
    t = setTimeout(function()
        {
            if (resourceCount == 5) {
                clearTimeout(t);
                runAfter(imDomainUrl, socketDomainUrl, loginToken);
            }
        },
        1000);
}

mineGlobal = {};
function runAfter(imDomainUrl, socketDomainUrl, loginToken) {
    imDomainUrl = 'http://' + imDomainUrl + '/chat';
    joinGroupApi = imDomainUrl + '/find/joinGroup';
    refuseFriendApi = imDomainUrl + '/find/refuseFriend';
    agreeFriendApi = imDomainUrl + '/find/agreeFriend';
    friendRequestListApi = imDomainUrl + '/index/friendRequestList';
    addFriendApi = imDomainUrl + '/find/addFriend';
    findGroupApi = imDomainUrl + '/find/search';
    searchUserApi = imDomainUrl + '/find/searchUser';
    removeMembersApi = imDomainUrl + '/find/removeMembers';
    removegroupApi = imDomainUrl + '/find/removegroup';
    socketDomain = socketDomainUrl;
    getListApi = imDomainUrl + '/index/getList';
    uploadFileApi = imDomainUrl + '/upload/uploadFile?token=' + loginToken;
    chatlogApi = imDomainUrl + '/chatlog/detail';
    uploadImgApi = imDomainUrl + '/upload/uploadimg?token=' + loginToken;
    getMembersApi = imDomainUrl + '/index/getMembers?token=' + loginToken;
    addgroupmobileApi = imDomainUrl + '/find/addgroupmobile?token=' + loginToken;
    token = loginToken;


    //注意：选项卡 依赖 element 模块，否则无法进行功能性操作
    layui.use('element', function(){
        var element = layui.element;
    });
    layui.use('laytpl', function(){
        laytpl = layui.laytpl;
    });
    layui.use('mobile', function(){
        var mobile = layui.mobile;
        // layer = mobile.layer;
        layim = mobile.layim;
        $.getJSON(getListApi, {'token':token}, function(res){
            if( 0 == res.code ){
                mineGlobal = res.data.mine;
                layim.config({
                    brief:false
                    ,notice:true
                    ,uploadFile: {
                        url: uploadFileApi
                    }
                    ,uploadImage: {
                        url: uploadImgApi
                    }
                    ,init: {
                        //我的信息
                        mine: res.data.mine
                        //我的好友列表
                        ,friend: res.data.friend
                        ,group: res.data.group
                    }
                    ,isNewFriend: true //是否开启“新的朋友”
                    ,isgroup: true //是否开启群组（默认true，即开启）
                    ,chatTitleColor: '#c00' //顶部Bar颜色
                    ,title: '微聊' //应用名，默认：我的IM
                    ,copyright: true //是否授权，如果通过官网捐赠获得LayIM，此处可填true
                    ,tool: [{
                        alias: 'code' //工具别名
                        ,title: '代码' //工具名称
                        ,icon: '&#xe64e;' //工具图标，参考图标文档
                    }]
                });
                layImAfter();
            }
        });

        function layImAfter() {
            // console.log(layim.cache());
            if (typeof(mineGlobal) != 'object' || typeof(mineGlobal.id) == 'undefined' || typeof(mineGlobal.username) == 'undefined') {
                console.log('webIm启动失败，运行参数错误');
                return;
            }

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

            layim.on('chatlog', function(data, ul){
                //弹出一个更多聊天记录面板
                console.log(data);
                var name = '';
                if (data.type == 'friend') {
                    name = data.username;
                } else {
                    name = data.groupname;
                }
                getChatLog(data.id, name, data.type, 1);
            });
            layim.on('detail', function(data){
                //console.log(data); //获取当前会话对象，包含了很多所需要的信息
                //以查看群组信息（如成员）为例
                $.get(getMembersApi, {id: data.id,'token':token}, function(res){
                    //弹出面板
                    var getTpl = group_members_tpl;
                    var html_members = '';
                    laytpl(getTpl).render(res, function(html){
                        html_members = html;
                    });

                    layim.panel({
                        title: data.name + '群成员' //标题
                        ,tpl: html_members //模版，基于laytpl语法
                        ,data: { //数据
                            rows: res.rows //假设rows为群组成员
                        }
                    });
                });
            });

            layim.on('newFriend', function(){
                layim.showNew('List', false); //标注“联系人”新动态
                layim.showNew('Friend', false); //标注“新的朋友”新动态
                friendRequestList(1);
            });

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

            layim.on('sendMessage', function(res){
                // 发送消息
                var mine = JSON.stringify(res.mine);
                var to = JSON.stringify(res.to);
                var login_data = '{"type":"chatMessage","data":{"mine":'+mine+', "to":'+to+'}}';
                sendMessage(socket,login_data);
            });
        }
    });
}

