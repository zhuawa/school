<!DOCTYPE html>
<html>
<head>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  	<title>网络学院直播首页</title>
  	<link rel="stylesheet" href="../layui/css/layui.css">
  	<link rel="stylesheet" href="vendor/bootstrap.min.css">
	<script src="../AgoraRTCSDK-2.4.0.js"></script>
	<script src="../vendor/jquery.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">网络学院</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="">控制台</a></li>
      <li class="layui-nav-item"><a href="">商品管理</a></li>
      <li class="layui-nav-item"><a href="">用户</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">其它系统</a>
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          贤心
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="">退了</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item layui-nav-itemed">
          <a class="" href="javascript:;">所有商品</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">列表一</a></dd>
            <dd><a href="javascript:;">列表二</a></dd>
            <dd><a href="javascript:;">列表三</a></dd>
            <dd><a href="">超链接</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">解决方案</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">列表一</a></dd>
            <dd><a href="javascript:;">列表二</a></dd>
            <dd><a href="">超链接</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="">云市场</a></li>
        <li class="layui-nav-item"><a href="">发布商品</a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
    <div id="div_device" class="panel panel-default">
		<div class="select">
			<label for="audioSource">Audio source: </label><select id="audioSource"></select>
		</div>
		<div class="select">
			<label for="videoSource">Video source: </label><select id="videoSource"></select>
		</div>
	</div>

	<div id="div_join" class="panel panel-default">
		<div class="panel-body">
		App ID: <input id="appId" type="text" value="" size="36"></input>
		Channel: <input id="channel" type="text" value="1000" size="4"></input>
		Host: <input id="video" type="checkbox" checked></input>
		<button id="join" class="btn btn-primary" onclick="join()">Join</button>
		<button id="leave" class="btn btn-primary" onclick="leave()">Leave</button>
		<button id="publish" class="btn btn-primary" onclick="publish()">Publish</button>
		<button id="unpublish" class="btn btn-primary" onclick="unpublish()">Unpublish</button>
		</div>
	</div>
    
    
    <div id="video" style="margin:0 auto;">
    <div id="agora_local" style="float:right;width:210px;height:147px;display:inline-block;"></div>
</div>
  </div>
  
  <!--
  <div class="layui-footer">
    © layui.com - 底部固定区域
  </div>
  -->
</div>
<script src="../layui/layui.js"></script>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
  
});
</script>
<script language="javascript" src="../home/home.js"></script>
</body>
</html>