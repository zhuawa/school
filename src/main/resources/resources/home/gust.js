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


if(!AgoraRTC.checkSystemRequirements()) {
	  alert("Your browser does not support WebRTC!");
	}

	/* simulated data to proof setLogLevel() */
AgoraRTC.Logger.error('this is error');
AgoraRTC.Logger.warning('this is warning');
AgoraRTC.Logger.info('this is info');
AgoraRTC.Logger.debug('this is debug');

var client1, localStream1, camera1, microphone1;

//var audioSelect = document.querySelector('select#audioSource');
//var videoSelect = document.querySelector('select#videoSource');
var audioSelect = document.getElementById('audioSource');
var videoSelect = document.getElementById('videoSource');

function connection(isHost, uid) {
	uid = parseInt(uid);
//  document.getElementById("join").disabled = true;
//  document.getElementById("video").disabled = true;
  var channel_key = null;

  console.log("Init AgoraRTC client1 with App ID: " + appId.value);
  //选择互通模式
  client1 = AgoraRTC.createClient({mode: 'interop'});
  client1.init(appId.value, function () {
    console.log("AgoraRTC client1 initialized");
    client1.join(channel_key, "1000", uid, function(uid) {
      console.log("User " + uid + " join channel successfully");

//      if (document.getElementById("video").checked) {
      if (true) {
        camera1 = videoSource.value;
        microphone1 = audioSource.value;
        localStream1 = AgoraRTC.createStream({streamID: uid, audio: true, camera1Id: camera1, microphone1Id: microphone1, video: true, screen: false});
        //localStream1 = AgoraRTC.createStream({streamID: uid, audio: false, camera1Id: camera1, microphone1Id: microphone1, video: false, screen: true, extensionId: 'minllpmhdgpndnkomcoccfekfegnlikg'});
        if (true) {
          localStream1.setVideoProfile('720p_3');
        }

        // The user has granted access to the camera1 and mic.
        localStream1.on("accessAllowed", function() {
          console.log("accessAllowed");
        });

        // The user has denied access to the camera1 and mic.
        localStream1.on("accessDenied", function() {
          console.log("accessDenied");
        });

        if(isHost=='1'){
        localStream1.init(function() {
          console.log("getUserMedia successfully");
          //localStream1.play('agora_local');

          client1.publish(localStream1, function (err) {
            console.log("Publish local stream error: " + err);
          });

          client1.on('stream-published', function (evt) {
        	  debugger;
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
    console.log("AgoraRTC client1 init failed", err);
  });

}

function leave() {
	  document.getElementById("leave").disabled = true;
	  client1.leave(function () {
	    console.log("Leavel channel successfully");
	  }, function (err) {
	    console.log("Leave channel failed");
	  });
	}

	function publish() {
	  document.getElementById("publish").disabled = true;
	  document.getElementById("unpublish").disabled = false;
	  client1.publish(localStream1, function (err) {
	    console.log("Publish local stream error: " + err);
	  });
	}

	function unpublish() {
	  document.getElementById("publish").disabled = false;
	  document.getElementById("unpublish").disabled = true;
	  client1.unpublish(localStream1, function (err) {
	    console.log("Unpublish local stream failed" + err);
	  });
	}

	function getDevices() {
		var audioSelect = document.getElementById('audioSource');
		var videoSelect = document.getElementById('videoSource');
	  AgoraRTC.getDevices(function (devices) {
	    for (var i = 0; i !== devices.length; ++i) {
	      var device = devices[i];
	      var option = document.createElement('option');
	      option.value = device.deviceId;
	      if (device.kind === 'audioinput') {
	        option.text = device.label;// || 'microphone1 ' + (audioSelect.length + 1);
	        audioSelect.appendChild(option);
	      } else if (device.kind === 'videoinput') {
	        option.text = device.label;// || 'camera1 ' + (videoSelect.length + 1);
	        videoSelect.appendChild(option);
	      } else {
	        console.log('Some other kind of source/device: ', device);
	      }
	    }
	  });
	}

	//audioSelect.onchange = getDevices;
	//videoSelect.onchange = getDevices;
	//getDevices();

function logout(){
	$.post("/logout", null, function(data) {
		
	});
}