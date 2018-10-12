if(!AgoraRTC.checkSystemRequirements()) {
  alert("Your browser does not support WebRTC!");
}

/* select Log type */
// AgoraRTC.Logger.setLogLevel(AgoraRTC.Logger.NONE);
// AgoraRTC.Logger.setLogLevel(AgoraRTC.Logger.ERROR);
// AgoraRTC.Logger.setLogLevel(AgoraRTC.Logger.WARNING);
// AgoraRTC.Logger.setLogLevel(AgoraRTC.Logger.INFO);  
// AgoraRTC.Logger.setLogLevel(AgoraRTC.Logger.DEBUG);

/* simulated data to proof setLogLevel() */
AgoraRTC.Logger.error('this is error');
AgoraRTC.Logger.warning('this is warning');
AgoraRTC.Logger.info('this is info');
AgoraRTC.Logger.debug('this is debug');

var client, localStream, camera, microphone;

var audioSelect = document.querySelector('select#audioSource');
var videoSelect = document.querySelector('select#videoSource');

function join() {
  //document.getElementById("join").disabled = true;
  //document.getElementById("video").disabled = true;
  var channel_key = null;

  console.log("Init AgoraRTC client with App ID: " + '737535e73a634ffebc3f794e637736ee');
  client = AgoraRTC.createClient({mode: 'interop'});
  client.init('737535e73a634ffebc3f794e637736ee', function () {
    console.log("AgoraRTC client initialized");
    client.join(channel_key, '1000', null, function(uid) {
      console.log("User " + uid + " join channel successfully");

      if (document.getElementById("video").checked) {
        camera = videoSource.value;
        microphone = audioSource.value;
        localStream = AgoraRTC.createStream({streamID: uid, audio: true, cameraId: camera, microphoneId: microphone, video: document.getElementById("video").checked, screen: false});
        //localStream = AgoraRTC.createStream({streamID: uid, audio: false, cameraId: camera, microphoneId: microphone, video: false, screen: true, extensionId: 'minllpmhdgpndnkomcoccfekfegnlikg'});
        if (document.getElementById("video").checked) {
          localStream.setVideoProfile('720p_3');

        }

        // The user has granted access to the camera and mic.
        localStream.on("accessAllowed", function() {
          console.log("accessAllowed");
        });

        // The user has denied access to the camera and mic.
        localStream.on("accessDenied", function() {
          console.log("accessDenied");
        });

        localStream.init(function() {
          console.log("getUserMedia successfully");
          document.getElementById("defaultjt").style.display = "none";
          localStream.play('zhibo');

          client.publish(localStream, function (err) {
            console.log("Publish local stream error: " + err);
          });

          client.on('stream-published', function (evt) {
            console.log("Publish local stream successfully");
          });
        }, function (err) {
          console.log("getUserMedia failed", err);
        });
      }
    }, function(err) {
      console.log("Join channel failed", err);
    });
  }, function (err) {
    console.log("AgoraRTC client init failed", err);
  });

  channelKey = "";
  client.on('error', function(err) {
    console.log("Got error msg:", err.reason);
    if (err.reason === 'DYNAMIC_KEY_TIMEOUT') {
      client.renewChannelKey(channelKey, function(){
        console.log("Renew channel key successfully");
      }, function(err){
        console.log("Renew channel key failed: ", err);
      });
    }
  });


  client.on('stream-added', function (evt) {
    var stream = evt.stream;
    console.log("New stream added: " + stream.getId());
    console.log("Subscribe ", stream);
    client.subscribe(stream, function (err) {
      console.log("Subscribe stream failed", err);
    });
  });

  client.on('stream-subscribed', function (evt) {
    var stream = evt.stream;
    console.log("Subscribe remote stream successfully: " + stream.getId());
    if ($('div#jiangtai #agora_remote'+stream.getId()).length === 0) {
    	$('div#jiangtai').append('<div id="agora_remote'+ stream.getId()+'" style="float:left; width:150px;height:90px;z-index:999;position:absolute;"></div>');
    }
    stream.play('agora_remote' + stream.getId());
  });

  client.on('stream-removed', function (evt) {
    var stream = evt.stream;
    stream.stop();
    $('#agora_remote' + stream.getId()).remove();
    console.log("Remote stream is removed " + stream.getId());
  });

  client.on('peer-leave', function (evt) {
    var stream = evt.stream;
    if (stream) {
      stream.stop();
      $('#agora_remote' + stream.getId()).remove();
      console.log(evt.uid + " leaved from this channel");
    }
  });
}

function leave() {
  document.getElementById("leave").disabled = true;
  client.leave(function () {
    console.log("Leavel channel successfully");
  }, function (err) {
    console.log("Leave channel failed");
  });
}

function publish() {
  document.getElementById("publish").disabled = true;
  document.getElementById("unpublish").disabled = false;
  client.publish(localStream, function (err) {
    console.log("Publish local stream error: " + err);
  });
}

function unpublish() {
  document.getElementById("publish").disabled = false;
  document.getElementById("unpublish").disabled = true;
  client.unpublish(localStream, function (err) {
    console.log("Unpublish local stream failed" + err);
  });
}

function getDevices() {
  AgoraRTC.getDevices(function (devices) {
	  var audioSelect = document.querySelector('select#audioSource');
	  var videoSelect = document.querySelector('select#videoSource');
    for (var i = 0; i !== devices.length; ++i) {
      var device = devices[i];
      var option = document.createElement('option');
      option.value = device.deviceId;
      if (device.kind === 'audioinput') {
        option.text = device.label || 'microphone ' + (audioSelect.length + 1);
        audioSelect.appendChild(option);
      } else if (device.kind === 'videoinput') {
        option.text = device.label || 'camera ' + (videoSelect.length + 1);
        videoSelect.appendChild(option);
      } else {
        console.log('Some other kind of source/device: ', device);
      }
    }
  });
}

//audioSelect.onchange = getDevices;
//videoSelect.onchange = getDevices;
getDevices();

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
  		,{field: 'name', title: '用户名', width:141, fixed:'left', templet:'<div>{{d.name}} {{#  if(d.tishi == 1){ }}<img width="30px" src="../main/img/puthand1.png"/>{{#  } }}</div>'}
  		,{field: 'oper', title: '操作', width:112, toolbar: '#toolbar'}
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

//websocket聊天室
var TYPE_QUESTION = "q";//问题
var TYPE_CHAT = "c";//聊天
var TYPE_TEACHER = "t"//教师端
var ws;

var jsonobj = {
	id : userId,
	name : userName,
	ishost : isHost,
	channelnum : 1000
}
var wsUri = 'wss://172.17.1.102:8090/websocket?'+encodeURI(JSON.stringify(jsonobj));
ws = new WebSocket(wsUri);
layui.use('layer', function(){
		var layer = layui.layer;
		var	$ = layui.jquery;
//接收后台getBasicRemote().sendText()的内容
ws.onmessage = function(message) {
	if(message.data!=null){
		var targ = message.data.indexOf("了聊天室userList:");
		if(targ > -1){
			var msg = message.data.substring(0,9);
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
    	}else if(message.data.startsWith('cmd:[connect]')){
    		var msg = message.data.substring(12);
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
    	}else if(message.data.startsWith('cmd:[pageindex]')){
    		var msg = message.data.substring(15);
    		if(msg){
    			//var index = parseInt(document.getElementById('ppt').attributes[2].nodeValue);
    			document.getElementById('ppt').attributes[2].nodeValue = msg;
    			var total = document.getElementById('ppt').attributes[3].nodeValue;
    			document.getElementById('pagenumber').innerText = msg+'/'+ total;
    			document.getElementById('ppt').attributes[2].nodeValue = msg;
    			var len = document.getElementById('ppt').src.indexOf('zzs_')+4;
    			document.getElementById('ppt').src = document.getElementById('ppt').src.substring(0,len)+msg+".jpg";
    		}
    	}else if(message.data.startsWith('cmd:[uphand]')){
    		debugger
    		var msg = message.data.substring(12)
    		if(msg){
    			msg = msg.replace('[','').replace(']','');
    			var u = msg.split(",");
    			for(var i=0;i<userList.length;i++){
    				if(userList[i].id == u[0]){
        				userList[i].tishi = 1;
    				}else{
    					userList[i].tishi = 0;
    				}
    			}
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
});

//发送按钮监听，点击按钮后，向后台发送信息，由后台OnMessage接收
function button(type) {
    message = document.getElementById('question').value;
    if(teacherClass.type === TYPE_QUESTION){
    	message = message+"["+TYPE_QUESTION+"]";
    }else{
    	message = message+"["+TYPE_CHAT+"]";
    }
    document.getElementById('question').value = "";
    var outMsg = document.getElementById('qul');
    if (type===TYPE_TEACHER) {
    	outMsg = document.getElementById('qul_t');
    }
    while(outMsg.children.length>=9){
		outMsg.children[0].remove();
    }
    var chartMsg = document.getElementById('cul');
    if (type===TYPE_TEACHER) {
    	chartMsg = document.getElementById('cul_t');
    }
    while(chartMsg.children.length>=9){
    	chartMsg.children[0].remove();
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
	var type = message.substring(message.length-3,message.length)
	if(type === '['+TYPE_QUESTION+']'){
		message = message.replace('['+TYPE_QUESTION+']','');
		$('#qul').append('<li style="color:white;font-size:12px;">'+message+'</li> ');
		$('#qul_t').append('<li style="color:black;font-size:12px;">'+message+'</li> ');
	}else if(type === '['+TYPE_CHAT+']'){
		message = message.replace('['+TYPE_CHAT+']','');
		$('#cul').append('<li style="color:white;font-size:12px;">'+message+'</li> ');
		$('#cul_t').append('<li style="color:black;font-size:12px;">'+message+'</li> ');
	}else{
		$('#cul').append('<li style="color:white;font-size:12px;">'+message+'</li> ');
	}

}

//当关闭页面时执行，调用后台的OnClose方法
window.onbeforeunload = function() {
    ws.close();
};

function last(){
	var index = parseInt(document.getElementById('ppt').attributes[2].nodeValue);
	var total = parseInt(document.getElementById('ppt').attributes[3].nodeValue);
	if(index>1){
		index-=1;
		ws.send('cmd:[pageindex]'+index);
	}
}

function next(){
	var index = parseInt(document.getElementById('ppt').attributes[2].nodeValue);
	var total = parseInt(document.getElementById('ppt').attributes[3].nodeValue);
	if(index<9){
		index+=1;
		ws.send('cmd:[pageindex]'+index);
	}
}

function TeacherClass(wnd){
	this._wnd = wnd ? wnd : window;
	this._doc = this._wnd.document;
	this.type = TYPE_QUESTION;
	
};

/**
 * 切换页面
 * @param type
 */
TeacherClass.prototype.show = function(type) {
	this.type = type;
}