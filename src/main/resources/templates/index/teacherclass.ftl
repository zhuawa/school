<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<title>教师课堂</title>
<link rel="stylesheet" type="text/css" href="main/css/teacherclass/teacher.css"
<script src="../assets/js/jquery-1.8.2.min.js"></script>
<script src="../AgoraRTCSDK-2.4.0.js"></script>
<script src="../home/teacher.js"></script>
<script src="../home/host.js"></script>
<script>
</script>
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

<div>
	<div>
	     <div class="zuo" style="background-color:#ffffff">
	      <div id="jiangtai" class="tupian" style="background-color:#f0f4fd">
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
	       <div class="bj" style="background-color:ffffff">
	        <div class="diannao">
	         <img src="main/img/teacherclass/diannao.png">
	        </div>
	        <h2>宿智强</h2>
	       </div>
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
	       <h4>机械波与原子结构.pdf</h4>
	       <div class="quanping">
	        <img src="main/img/teacherclass/quanping.png">
	       </div> 
	       <div class="sanjiao02">
	        <img src="main/img/teacherclass/sanjiao.png">
	       </div>
	       <h6>适合页面</h6> 
	       <div class="sanjiao01">
	        <img src="main/img/teacherclass/sanjiao.png">
	       </div> 
	       <h5>7/12</h5>
	      </div>
	      <div class="tupian00" ><img src="main/img/stuclass/zzs.png" style="width:100%;height:440px;"></div>
	      <div class="biaobj" style="background-color:#F8F8F8">
	       <div class="tu01">
	        <img src="main/img/teacherclass/01.png">
	       </div>
	       <div class="tu02">
	        <img src="main/img/teacherclass/02.png">
	       </div>
	       <div class="tu03">
	        <img src="main/img/teacherclass/03.png">
	       </div>
	       <div class="tu04">
	        <img src="main/img/teacherclass/04.png">
	       </div>
	       <div class="tu05">
	        <img src="main/img/teacherclass/05.png">
	       </div>
	       <div class="tu06">
	        <img src="main/img/teacherclass/06.png">
	       </div>
	       <div class="tu07">
	        <img src="main/img/teacherclass/07.png">
	       </div>
	      </div>
	     </div>
	     <div class="youbian" style="background-color:#ffffff">
	      <div style=" height:30px; background-color:#f7f7f7">
	       <a class="anniu01"><h3>公告</h3></a>
	      </div> 
	      <div class="kongbai" style="background-color:#FFFFFF"></div>
	      <div class="shuru" style="background-color:#F8F8F8">
	       <div class="t">
	       <img src="main/img/teacherclass/T.png">
	       </div>
	       <div class="xiaolian">
	       <img src="main/img/teacherclass/xiaolian.png">
	       </div>
	       <h1 class="kongzhixiang">控制项</h1>
	      </div>
	      <div class="jiantou" style="background-color:#F8F8F8">
	       <div class="jiantou01" style="background-color:#FFFFFF">
	        <div class="jiantou02">
	         <img src="main/img/teacherclass/jiantou.png">
	        </div>
	       
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
	 	<img src="main/img/teacherclass/5.png">
	 	<img src="main/img/teacherclass/8.png">
	 </div> 
</div>
<script>
window.onload = function(){
	join();
}
</script>
</body>
</html>
