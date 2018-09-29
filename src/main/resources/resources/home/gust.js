function chart(){
	var content1 = document.getElementById("content1");
	var content2 = document.getElementById("content2");
	var tab1 = document.getElementById("tab1");
	var tab2 = document.getElementById("tab2");
	content1.style.display = '';
	content2.style.display = 'none';
	tab1.setAttribute("class", "layui-this");
	tab2.removeAttribute("class", "layui-this");
}
function gusts(){
	var content1 = document.getElementById("content1");
	var content2 = document.getElementById("content2");
	var tab1 = document.getElementById("tab1");
	var tab2 = document.getElementById("tab2");
	tab2.setAttribute("class", "layui-this");
	tab1.removeAttribute("class", "layui-this");
	content1.style.display = 'none';
	content2.style.display = '';
	layui.use('layer', function(){
		var	$ = layui.jquery;
		$.get("/filelist/"+channelNum, null, function(data) {
			debugger;
			var json = JSON.parse(data);
		});
	});
}

/**
 * 举手
 * @returns
 */
function uphand(){
	ws.send("cmd:[uphand]");
}

function connection(isHost, uid) {
	uid = parseInt(uid);
  document.getElementById("join").disabled = true;
  document.getElementById("video").disabled = true;
  var channel_key = null;

  console.log("Init AgoraRTC client with App ID: " + appId.value);
  //选择互通模式
  client = AgoraRTC.createClient({mode: 'interop'});
  client.init(appId.value, function () {
    console.log("AgoraRTC client initialized");
    client.join(channel_key, channel.value, uid, function(uid) {
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

        if(isHost=='1'){
        localStream.init(function() {
          console.log("getUserMedia successfully");
          localStream.play('agora_local');

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
		  layui.use('layer', function(){
	  			var layer = layui.layer;
				var	$ = layui.jquery;
				var stream = evt.stream;
		  if(isHost==1){
			  console.log("Subscribe remote stream successfully: " + stream.getId());
			  if ($('div#video #agora_remote').length === 0) {
				  $('div#video').append('<div id="agora_remote" onmousedown="mouseDown(this,event)" onmousemove="mouseMove(event)" onmouseup="mouseUp(event)" style="float:left; width:300px;height:167px;display:inline-block; z-index:999;position: absolute;"></div>');
				  stream.play('agora_remote');
			  }
		  }else{ 
			  var stream = evt.stream;
			    console.log("Subscribe remote stream successfully: " + stream.getId());
			    if ($('div#video #agora_remote').length === 0) {
			  	      $('div#video').append('<div id="agora_remote" style="float:left; width:638px;height:427px;display:inline-block; z-index:999;position: absolute;"></div>');
			    }
			    stream.play('agora_remote');
			    var videos = document.getElementsByTagName("video");
				layui.each(videos, function(index, item){
					item.setAttribute("controls", "controls");
					item.style.transform='none';
				})
		  }
		  });
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

function logout(){
	$.post("/logout", null, function(data) {
		
	});
}