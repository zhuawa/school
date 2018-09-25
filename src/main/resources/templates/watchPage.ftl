<!DOCTYPE html>
<html>
<head>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  	<title>网络学院直播首页</title>
	<link rel="stylesheet" href="../layui/css/layui.css">
  	<link rel="stylesheet" href="../home/base.css">
	<script src="../AgoraRTCSDK-2.4.0.js"></script>
	<script src="../layui/layui.js"></script>
	<script>
		var channelNum = '${channelNum!}';
	</script>
	<script src="../home/gust.js"></script>
<script type="text/javascript">
    var ws;
    var userId = '${Session.loginInfo.id}';
    var uid = '${Session.loginInfo.uid}';
    var userName = '${Session.loginInfo.name}';
    var isHost = '${Session.loginInfo.isHost}';
    var jsonobj = {
    	id : userId,
    	name : userName,
    	ishost : isHost,
    	channelnum : '${channelNum!}'
    }
    var wsUri = 'ws://localhost:8090/websocket?'+encodeURI(JSON.stringify(jsonobj));
    ws = new WebSocket(wsUri);
    layui.use('layer', function(){
  			var layer = layui.layer;
			var	$ = layui.jquery;
    //接收后台getBasicRemote().sendText()的内容
    ws.onmessage = function(message) {
    	if(message.data!=null){
    		var targ = message.data.indexOf("了聊天室userList:");
    		if(targ > -1){
    			var msg = message.data.substring(0,9)
        		writeToScreen(msg);
        	}else if(message.data.startsWith('cmd:[connect]')){
        		var msg = message.data.substring(12)
        		if(msg){
        			msg = msg.replace('[','').replace(']','');
        			var u = msg.split(",");
        			layer.confirm('是否接受连麦邀请?', {icon: 3, title:'提示', offset: 'rb'}, function(index){
        				var timestamp=new Date().getTime();
        				var stamp = (""+timestamp).substring(6);
  						connection('1',stamp-uid);
  						//join('1',parseInt(stamp+uid));
  						layer.close(index);
					});
				}
        	}else{
        		writeToScreen(message.data);
        	}
    	}else{
    		writeToScreen(message.data);
    	}
    };
    });

    //发送按钮监听，点击按钮后，向后台发送信息，由后台OnMessage接收
    function button() {
        message = document.getElementById('in').value;
        document.getElementById('in').value = "";
        var outMsg = document.getElementById('output');
        while(outMsg.children.length>=9){
			outMsg.children[0].remove();
        }
        ws.send(message);
    }

    //发生错误时
    ws.onerror = function(msg) {
        writeToScreen('<span style="color:red;">系统出错啦</span>' + msg.data);
        ws.close();
    };

    //聊天信息写入窗口中
    function writeToScreen(message) {
        var outMsg = document.getElementById('output');
        while(outMsg.children.length>=9){
			outMsg.children[0].remove();
        }
        var pre = document.createElement("p");
        pre.style.wordWrap = "break-word";
        pre.innerHTML = message;
        output.appendChild(pre);
    }

    //当关闭页面时执行，调用后台的OnClose方法
    window.onbeforeunload = function() {
        ws.close();
    };
</script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">网络学院</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="/welcome">首页</a></li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li id="loginButton" class="layui-nav-item"><a href="#" onclick="loginPage();" style="padding-right:0px;">登录</a></li>
      <li id="regButton" class="layui-nav-item"><a href="#" onclick="regPage();">注册</a></li>
      <li id="loginInfoButton" style="display:none;" class="layui-nav-item"><a href="#" onclick="regPage();" id="logina"></a></li>
    </ul>
  </div>
  
  <div class="layui-card layui-bg-blue" style="width:180px;float:left;margin-top:250px;border:1px;">
	  <div class="layui-card-header">消息栏</div>
	  <div class="layui-card-body" style="height:200px;">
	  balabala~~~
	  </div>
  </div>
  
  <div class="layui-body layui-bg-gray" style="left:0px; height:100%;overflow:hidden;">
    <!-- 内容主体区域 -->
	<div id="div_device" class="panel panel-default" style="display:none;margin:0px;">
		<div class="select">
			<label for="audioSource">音频设备(Audio source): </label>
			<select id="audioSource"></select>
		</div>
		<div class="select">
			<label for="videoSource">视频设备(Video source): </label><select id="videoSource"></select>
		</div>
	</div>

		<div class="panel-body" style="display:none;">
			<input id="appId" type="hidden" value="737535e73a634ffebc3f794e637736ee" size="36"></input>
			频道: <input id="channel" type="text" value='${channelNum!}' size="4"></input>
			<div style="display:none;">主播: <input id="video" type="checkbox" checked></input></div>
			<button id="join" class="btn btn-primary" onclick="join('0', '${Session.loginInfo.uid}')">加入房间</button>
			<button id="leave" class="btn btn-primary" onclick="leave()">离开</button>
			<button id="publish" class="btn btn-primary" onclick="publish()">开播</button>
			<button id="unpublish" class="btn btn-primary" onclick="unpublish()">停止播放</button>
		</div>
	<div id="div_join" class="panel panel-default" style="height:45px;margin:0px;">
		<span style="font-size:25px;padding:10px;">直播间【${channelNum!}】</span>
	</div>

	<div id="video" style="margin:0 auto;margin-left:10px;">
    	<div id="agora_local" style="float:right;width:300px;height:167px;display:inline-block;z-index:999;position: absolute;"></div>
		<div class="layui-tab layui-tab-brief" lay-filter="chart" style="float:right;width:468px;height:500px;">
			  <ul class="layui-tab-title">
				<li id="tab1" class="layui-this" lay-id="1" onclick="chart()">聊天室</li>
				<li id="tab2" lay-id="2" onclick="gusts()">课件资料</li>
			  </ul>
			  <div class="layui-tab-content">
			  	<span id="content1">
					  <div id="output" style="height:280px;width:100%;overflow:hidden;">
					  
					  
					  </div>
					  <div class="layui-input-block" style="width:100%;margin-left:0px;margin-top:80px;">
						  <form class="layui-form" action="">
						  <textarea id="in" name="message" placeholder="请输入内容" class="layui-textarea" style="min-height:auto;"></textarea>
						  <input onclick="button()" value="发送" type="button" />
						</form>
					  </div>
			  	</span>
			  	<span id="content2" style="display:none;">
			  	
			  	</span>
			  </div>
		</div>   
	</div>

	<div id="ctrlPanel" class="panel panel-default" style="margin:0px;margin-top:489px;height:80px;">
		<div class="layui-btn-group" style="padding-top:18px;margin-left:10px;">
		  <button class="layui-btn" onclick="uphand()">举手</button>
		</div>
	</div>
	
	
	
	
  
  </div>
  <!--
  <div class="layui-footer">
    © layui.com - 底部固定区域
  </div>
  -->
</div>



<#if Session["loginInfo"]?exists>
    <input type="hidden" id="sessionLoginName" name="sessionLoginName" value='${Session["loginInfo"].name}' />
</#if>

<script>
layui.use('element', function () {
		var element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
	  //一些事件监听
	  element.on('tab(chart)', function(data){
		console.log(data);
	  });
});
</script>

<script src="../home/agora.js"></script>
<script>  
        var mouseX, mouseY;  
        var objX, objY;  
        var isDowm = false; 
        function mouseDown(obj, e) {  
        	var div = document.getElementById("agora_local");  
            obj.style.cursor = "move";  
			objX = div.offsetLeft;
			objY = div.offsetTop;
            mouseX = e.clientX;  
            mouseY = e.clientY;  
            isDowm = true;  
        }  
        function mouseMove(e) {  
            var div = document.getElementById("agora_local");  
            var x = e.clientX;  
            var y = e.clientY;  
            if (isDowm) {  
                div.style.left = parseInt(objX) + parseInt(x) - parseInt(mouseX) + "px";  
                div.style.top = parseInt(objY) + parseInt(y) - parseInt(mouseY) + "px";  
            }  
        }  
        function mouseUp(e) {  
            if (isDowm) {  
                var x = e.clientX;  
                var y = e.clientY;  
                var div = document.getElementById("agora_local");  
                div.style.left = parseInt(objX) + parseInt(x) - parseInt(mouseX) + "px";  
                div.style.top = parseInt(objY) + parseInt(y) - parseInt(mouseY) + "px";  
                div.style.cursor = "default";  
                isDowm = false;  
            }  
        }  
    </script>
<script>
window.onload = function(){
	var sessionLoginName = document.getElementById("sessionLoginName");
	if(sessionLoginName !=null && sessionLoginName.value!=null && sessionLoginName.value!=''){
		document.getElementById("loginInfoButton").style.display='';
		document.getElementById("logina").innerText = sessionLoginName.value;
		document.getElementById("loginButton").style.display='none';
		document.getElementById("regButton").style.display='none';
		join('0', '${Session.loginInfo.uid}');
		client.on('stream-published', function (evt) {
            console.log("Publish local stream successfully");
			var videos = document.getElementsByTagName("video");
			debugger;
			layui.each(videos, function(index, item){
				item.setAttribute("controls", "controls");
				item.style.transform='none';
			})
        });

	}
}
</script>
<script>
layui.use('form', function(){
	var form = layui.form;
	var	$ = layui.jquery;
	  //监听提交
	form.on('submit(loginFormDemo)', function(data){
		
		$.post("/login", data.field, function(data) {
			if(data=='success'){
				window.location.href = "/welcome";
			}else{
				var tishi = document.getElementById("tishi");
				tishi.style.display = "";
			}
		});
		return false;
	});
});
</script>

</body>
</html>