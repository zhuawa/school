<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<link rel="stylesheet" type="text/css" href="main/css/teacherclass/teacher.css"/>
<link rel="stylesheet" href="../layui/css/layui.css">
<link type="text/css" rel="stylesheet" href="../main/css/stuclass/qa-live.css">
<title>教师课堂</title>
<link rel="stylesheet" type="text/css" href="main/css/teacherclass/teacher.css">
<script type="text/javascript" src="../js/jquery-2.1.1.min.js"></script>
<script src="../assets/js/jquery-1.8.2.min.js"></script>
<script src="../AgoraRTCSDK-2.4.0.js"></script>
<script>
var userId = '${Session.loginInfo.id}';
var uid = '${Session.loginInfo.uid}';
var userName = '${Session.loginInfo.name}';
var isHost = '${Session.loginInfo.isHost}';
</script>
<script src="../layui/layui.js"></script>
<script src="../home/teacher.js"></script>
<script src="../home/host.js"></script>


</head>

<body style="background-color:#F8F8F8">
<!-- 设备 -->
<div id="div_device" class="panel panel-default" style="display:none;margin:0px;">
		<div class="select">
			<label for="audioSource">音频设备(Audio source): </label>
			<select id="audioSource"></select>
		</div>
		<div class="select">
			<label for="videoSource">视频设备(Video source): </label><select id="videoSource"></select>
		</div>
</div>
<div style="display:none;">主播: <input id="video" type="checkbox" checked></input></div>

<div id="maindiv">
	<div style="height: 95%;">
	     <div class="zuo" style="background-color:#ffffff">
	      <div id="jiangtai" class="tupian" style="background-color:#f0f4fd">
	      	<div id="zhibo" style="float:left; width:256px;height:160px;position:absolute;"></div>
	      	<div id="defaultjt" style="width:141px; height:128px; padding-top:10px; margin:auto;">
	        <img src="main/img/teacherclass/jiantai0.png">
	        </div>
	      </div>
	      <div class="canke" style="background-color:#f3f9fd">
	       <h1>参课人员（1）</h1>
	       <div class="liebiao">
	        <img src="main/img/teacherclass/liebiao.png">
	       </div>
	       <div class="sanjiao">
	        <img src="main/img/teacherclass/sanjiao.png">
	       </div>
	       <div class="xiaoshou">
	        <img src="main/img/teacherclass/xiaohsou.png">
	       </div>
	       <div class="yuyin">
	        <img src="main/img/teacherclass/yuyin.png">
	       </div>
	      </div>
	      <div class="xin" style="background-color:#ffffff"></div>
	      <div class="kuang" style="background-color:#ffffff">
	        <table id="userList" lay-filter="userList" lay-data="{id: 'userList'}" style="width:100%;"></table>
	      </div>
	      <div class="sou" style="background-color:#e9eaee"> 
	       <div class="sou01" style="background-color:#ffffff">
	        <div class="sousuo">
	         <img src="main/img/teacherclass/sousuo.png">
	        </div>
	       </div>
	      </div>
	      <!--
	      <div class="dibu" style="background-color:#f7f8fc"></div>
	      -->
	     </div>
	     
	     
	     <div class="datupian" style="background-color:#ffffff">
	      <div class="ye" style="background-color:#ffffff">
	       <h4>增值税基础知识培训.pdf</h4>
	       <div class="quanping">
	        <img src="main/img/teacherclass/quanping.png">
	       </div> 
	       <h5 id="pagenumber">1/9</h5>
	      </div>
	      <div class="tupian00" >
	      	<div style="width:5%;height:440px;display:inline;">
	      		<img src="main/img/last.png" onclick="last()" style="width:30px;height:50px;padding-bottom:200px;">
	      	</div>
	      	<img id="ppt" src="main/img/zzs_1.jpg" index=1 total=9 style="width:90%;height:440px;">
	      	<div style="width:5%;height:440px;display:inline;">
	      		<img src="main/img/next.png" onclick="next()" style="width:30px;height:50px;padding-bottom:200px;">
	      	</div>
	      </div>
	      <div class="biaobj" style="background-color:#F8F8F8">
	       <div class="tu04">
	        <img src="main/img/teacherclass/04.png">
	       </div>
	      </div>
	     </div>
	     <div class="youbian" style="background-color:#ffffff">
	      <div class="layui-tab" style="margin:0;height: 75%;">
			  <ul class="layui-tab-title">
			    <li class="layui-this" onClick="teacherClass.show('q')">问答</li>
			    <li onClick="teacherClass.show('c')">聊天</li>
			  </ul>
			  <div class="layui-tab-content">
			    <div class="layui-tab-item layui-show">
			      	<ul class="spaced_ul tab_ul gs-msg-list" id="qul_t">
			      	</ul>
			    </div>
			    <div class="layui-tab-item">
					<ul class="spaced_ul tab_ul gs-msg-list" id="cul_t">
			      	</ul>
				</div>
			  </div>
			</div>
	      <div class="jiantou" style="background-color:#F8F8F8">
	       <div class="jiantou01" style="background-color:#FFFFFF;margin-left:0;">
	       <textarea rows="7" cols="31" placeholder="请输入..." style="border:solid 1px #ececec;" id="question"></textarea>
	         <button class="layui-btn layui-btn-xs" style="float:right;" onClick="button('t')">发送</button>
	        
	       
	       </div>
	      </div>    
	     </div>
	 </div>   
	 <div class="bottombar">
	 	<img src="main/img/teacherclass/00.png">
	 	<img src="main/img/teacherclass/0.png">
	 	<img src="main/img/teacherclass/1.png">
	 	<img src="main/img/teacherclass/2.png">
	 	<img src="main/img/teacherclass/3.png">
	 	<img src="main/img/teacherclass/5.png" title="新增讲义">
	 	<img src="main/img/teacherclass/8.png" title="桌面共享">
	 </div> 
</div>
<script>
var teacherClass;
window.onload = function(){
	var height = window.screen.height ;
    if (height===720) {
    	$("#maindiv").css({ "height": (window.screen.height*0.83)+"px"}); 
    } else if (height===768) {
    	$("#maindiv").css({ "height": (window.screen.height*0.85)+"px"}); 
    }
	teacherClass = new TeacherClass(this);
	join();
}
layui.use('element', function(){
  var $ = layui.jquery
  ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
  
  //触发事件
  var active = {
    tabAdd: function(){
      //新增一个Tab项
      element.tabAdd('demo', {
        title: '新选项'+ (Math.random()*1000|0) //用于演示
        ,content: '内容'+ (Math.random()*1000|0)
        ,id: new Date().getTime() //实际使用一般是规定好的id，这里以时间戳模拟下
      })
    }
    ,tabDelete: function(othis){
      //删除指定Tab项
      element.tabDelete('demo', '44'); //删除：“商品管理”
      
      
      othis.addClass('layui-btn-disabled');
    }
    ,tabChange: function(){
      //切换到指定Tab项
      element.tabChange('demo', '22'); //切换到：用户管理
    }
  };
  
  $('.site-demo-active').on('click', function(){
    var othis = $(this), type = othis.data('type');
    active[type] ? active[type].call(this, othis) : '';
  });
  
  //Hash地址的定位
  var layid = location.hash.replace(/^#test=/, '');
  element.tabChange('test', layid);
  
  element.on('tab(test)', function(elem){
    location.hash = 'test='+ $(this).attr('lay-id');
  });
  
});
</script>
<script type="text/html" id="toolbar">
  <a class="layui-btn layui-btn-xs" lay-event="banned" >禁言</ a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="connect" >连麦</ a>
</script>
</body>
</html>
