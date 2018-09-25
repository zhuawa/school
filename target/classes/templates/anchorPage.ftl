<!DOCTYPE html>
<html>
<head>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  	<title>网络学院直播首页</title>
	<link rel="stylesheet" href="../layui/css/layui.css">
  	<link rel="stylesheet" href="../home/base.css">
  	<link rel="stylesheet" href="vendor/bootstrap.min.css">
	<script src="../AgoraRTCSDK-2.4.0.js"></script>
	<script src="../layui/layui.js"></script>
	<script src="../home/host.js"></script>
	<script>
		var channelNum = '${channelNum!}';
	</script>
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
    var userList = [];
    
    var data = {
    	code : 0,
    	msg : '',
    	count : 1000,
    	data : []
    }
    
    //学生列表
    layui.use('table', function(){
  	var table = layui.table;
  	var $ = layui.jquery;
  
  	//第一个实例
  	table.render({
   	 	elem: '#userList'
   	 	,url: '/test/data'
    	,height: 400
    	,cols: [[ //表头
      		{field: 'id', title: 'ID', hide: true}
      		,{field: 'name', title: '用户名', width:160, fixed:'left'}
      		,{field: 'oper', title: '操作', width:115, toolbar: '#toolbar'}
    	]],parseData: function(res){ //res 即为原始返回的数据
    									return {
      										"code": 0, //解析接口状态
      										"msg": '', //解析提示文本
      										"count": 1000, //解析数据长度
      										"data": userList //解析数据列表
    										};
  										}
  	});
  	
  	table.on('tool(userList)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
		var data = obj.data; //获得当前行数据
		var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
		var tr = obj.tr; //获得当前行 tr 的DOM对象
		if(layEvent === 'banned'){ //禁言
			var atag = tr[0].lastChild.children[0].children[0];
			if(atag.style.backgroundColor==''){//禁言
				atag.style.backgroundColor='#999';
				banned(1,$,obj);
				data.banned = 1;
			}else{//取消禁言
				atag.style.backgroundColor='';
				banned(0,$,obj);
				data.banned = 0;
			}
		} else if(layEvent === 'connect'){ //连麦
			var atag = tr[0].lastChild.children[0].children[1];
			if(atag.style.backgroundColor==''){//连麦
				atag.style.backgroundColor='#999';
				connect(1,$,obj);
			}else{//断开连麦
				atag.style.backgroundColor='';
				connect(0,$,obj);
			}
		} 
	});
  	
	});
	
    //接收后台getBasicRemote().sendText()的内容
    ws.onmessage = function(message) {
    	if(message.data!=null){
    		var targ = message.data.indexOf("了聊天室userList:");
    		if(targ > -1){
    			var msg = message.data.substring(0,9)
    			userList = JSON.parse(message.data.substring(targ+13));
    			data.data = userList;
    			layui.use(['table','layer'], function(){
  					var table = layui.table;
  					var layer = layui.layer;
  					//第一个实例
  					table.reload('userList',{
  					
   	 							url: '/test/data',
   	 							parseData: function(res){ //res 即为原始返回的数据
    									return {
      										"code": 0, //解析接口状态
      										"msg": '', //解析提示文本
      										"count": 1000, //解析数据长度
      										"data": userList //解析数据列表
    										};
  										}
  					});
				});
        		writeToScreen(msg);
        	}else if(message.data.startsWith('cmd:[uphand]')){
        		var msg = message.data.substring(12)
        		if(msg){
        			msg = msg.replace('[','').replace(']','');
        			var u = msg.split(",");
        			layer.open({
  						title: '在线调试'
  						,content: u[1]+'举手!'
						,offset: 'rb'
						,time: 3000
					});  
        		}
        	}else{
        		writeToScreen(message.data);
        	}
    	}else{
    		writeToScreen(message.data);
    	}
    };

    //发送按钮监听，点击按钮后，向后台发送信息，由后台OnMessage接收
    function button() {
        message = document.getElementById('in').value;
        document.getElementById('in').value = "";
        var outMsg = document.getElementById('output');
        while(outMsg.children.length>=20){
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
        while(outMsg.children.length>=20){
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
      <li id="loginInfoButton" style="display:none;" class="layui-nav-item"><a href="#" onclick="regPage();" id="logina" style="padding-right:0px;"></a></li>
      <li id="logoutButton" class="layui-nav-item"><a href="" onclick="logout();" >注销</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">所有分类</a>
          <dl class="layui-nav-child">
            <dd><a style="width:100%;" href="javascript:;" onclick="openPage(1);" class="roomtype">信息技术类</a></dd>
            <dd><a style="width:100%;" href="javascript:;" onclick="openPage(2);" class="roomtype">通用知识和能力类</a></dd>
            <dd><a style="width:100%;" href="javascript:;" onclick="openPage(3);" class="roomtype">行政管理类</a></dd>
            <dd><a style="width:100%;" href="javascript:;" onclick="openPage(4);" class="roomtype">领导胜任力类</a></dd>
          </dl>
        </li>
      </ul>
    </div>
  </div>
  
  
  <div class="layui-body layui-bg-gray" style="height:100%;overflow:hidden;">
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
			<button id="join" class="btn btn-primary" onclick="join('1','${Session.loginInfo.uid}')">加入房间</button>
			<button id="leave" class="btn btn-primary" onclick="leave()">离开</button>
			<button id="publish" class="btn btn-primary" onclick="publish()">开播</button>
			<button id="unpublish" class="btn btn-primary" onclick="unpublish()">停止播放</button>
		</div>
	<div id="div_join" class="panel panel-default" style="height:45px;margin:0px;">
		<span style="font-size:25px;padding:10px;">直播间【${channelNum!}】</span>
	</div>

	<div id="video" style="margin:0 auto;width:100%;height:72%;">
    	<div id="agora_local" style="margin-left:5px;float:right;width:860px;height:480px;display:inline-block;position: absolute;"></div>
		<div class="layui-tab layui-tab-brief" lay-filter="chart" style="float:right;width:300px;height:100%;">
			  <ul class="layui-tab-title">
				<li id="tab1" class="layui-this" lay-id="1" onclick="chart()">聊天室</li>
				<li id="tab2" lay-id="2" onclick="gusts()">学生列表</li>
			  </ul>
			  <div class="layui-tab-content">
			  	<span id="content1">
					  <div id="output" style="height:380px;width:100%;overflow:auto;">
					  
					  
					  </div>
					  <div class="layui-input-block" style="width:100%;margin-left:0px;">
						  <form class="layui-form" action="">
						  <textarea id="in" name="message" placeholder="请输入内容" class="layui-textarea" style="min-height:auto;"></textarea>
						  <input onclick="button()" value="发送" type="button" />
						</form>
					  </div>
			  	</span>
			  	<span id="content2" style="display:none;">
			  		<table id="userList" lay-filter="userList" lay-data="{id: 'userList'}" style="width:100%;"></table>
			  	</span>
			  </div>
		</div>   
	</div>

	<div id="ctrlPanel" class="panel panel-default" style="margin:3px;height:80px;">
		<div class="layui-btn-group" style="padding-top:18px;">
		  <button class="layui-btn" onclick="publish()">开播</button>
		  <button class="layui-btn" onclick="unpublish()">暂停</button>
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
	<#if Session["loginInfo"]?exists>
    	var loginInfo = '${Session["loginInfoJson"]}';
    	var login = JSON.parse(loginInfo);
	</#if>
	if(login !=null && login.name!=null && login.name!=''){
		document.getElementById("loginInfoButton").style.display='';
		document.getElementById("logina").innerText = login.name;
		document.getElementById("logoutButton").style.display='';
		join('1', uid);
	}
}
</script>
<script type="text/html" id="toolbar">
  <a class="layui-btn layui-btn-xs" lay-event="banned" >禁言</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="connect" >连麦</a>
</script>
</body>
</html>