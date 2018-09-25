<!DOCTYPE html>
<html>
<head>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  	<title>网络学院直播首页</title>
  	<link rel="stylesheet" href="../layui/css/layui.css">
  	<link rel="stylesheet" href="../home/base.css">
  	<script src="../assets/js/jquery-1.8.2.min.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">中国税务网络大学</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="">首页</a></li>
      <li class="layui-nav-item"><input style="width:300px;display:inline;" type="text" id="keyword" name="keyword" lay-verify="required" placeholder="请输入课堂名称" autocomplete="off" class="layui-input"><button id="search-button" onclick="search_do()" class="layui-btn" style="margin-top:-3px;">搜索</button></li>
    </ul>
    <ul class="layui-nav layui-layout-right" style="padding-right:0px;">
      <li class="layui-nav-item">
        <a href="javascript:;" style="padding-right:0px;">
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
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
   <div class="layui-carousel" id="test1">
  		<div carousel-item style="margin:3px;">
    		<div><img style="width:100%" src="../imgs/1.jpg"/></div>
    		<div><img style="width:100%" src="../imgs/2.jpg"/></div>
    		<div><img style="width:100%" src="../imgs/3.jpg"/></div>
    		<div><img style="width:100%" src="../imgs/4.png"/></div>
    		<div><img style="width:100%" src="../imgs/5.jpg"/></div>
  		</div>
	</div> 

<hr class="layui-bg-gray">

	<ul id="demo">
	  <!--
	  <li class="lilist">
	  	<div class="lidiv">1</div>
	  	<div class="lidiv">2</div>
	  	<div class="lidiv">3</div>
	  </li>
	  <li class="lilist">
	  	<div class="lidiv">4</div>
	  	<div class="lidiv">5</div>
	  	<div class="lidiv">6</div>
	  </li>
	  -->
	</ul>
  
  </div>
  <!--
  <div class="layui-footer">
    © layui.com - 底部固定区域
  </div>
  -->
</div>



<div id="settingPage" style="display:none">
	<form class="layui-form layui-form-pane" action="/anchor" method="post">
  <div class="layui-form-item" style="margin-top:10px;">
    <label class="layui-form-label">课程编号</label>
    <div class="layui-input-block">
      <input type="text" name="number" style="width:200px;" required  lay-verify="required" placeholder="请输入课程编号" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">课程名称</label>
    <div class="layui-input-block">
      <input type="text" name="title" style="width:200px;" required  lay-verify="required" placeholder="请输入课程名称" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
  	<label class="layui-form-label">课程类别</label>
  	<div class="layui-input-block layui-form" lay-filter="typeFilter"  style="width:200px;">
  		<select id="type" name="type" lay-verify="">
  		<option value="1" >信息技术类</option>
  		<option value="2" >通用知识和能力类</option>
  		<option value="3" >行政管理类</option>
  		<option value="4" >领导胜任力类</option>
		</select>  
	</div>
  </div>
  

  <div class="layui-form-item">
  <div class="layui-inline">
    <label class="layui-form-label">直播时间</label>
    <div class="layui-input-inline" style="width: 200px;">
      <input type="text" name="starttime" class="layui-input" placeholder="开始时间" id="starttime">
    </div>
    <span class="layui-input-inline" style="width:10px;">-</span>
    <div class="layui-input-inline" style="width: 200px;">
      <input type="text" name="endtime" class="layui-input" placeholder="结束时间" id="endtime">
    </div>
  </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">课程附件</label>
    <div class="layui-input-inline">
    	<input type="text" id="fileInput" name="fileInput" style="width:200px;" required  lay-verify="required" placeholder="请上传附件" autocomplete="off" class="layui-input">
    	<input type="hidden" id="filepath" name="filepath" />
    </div>
    <div class="layui-input-inline" style="margin-left:12px;"> 
      <button type="button" class="layui-btn" id="uploadFile">
  		<i class="layui-icon">&#xe67c;</i>上传附件
		</button>
    </div>
  </div>
  
  <div class="layui-form-item" style="margin-top:10px;">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="submitButton">确定</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
</div>





<#if Session["loginInfo"]?exists>
    <input type="hidden" id="sessionLoginName" name="sessionLoginName" value='${Session["loginInfo"].name}' />
</#if>

<script src="../layui/layui.js"></script>
<script src="../home/welcome.js"></script>
<script>
layui.use('carousel', function(){
  var carousel = layui.carousel;
  //建造实例
  carousel.render({
    elem: '#test1'
    ,width: '100%' //设置容器宽度
    ,arrow: 'always' //始终显示箭头
    //,anim: 'updown' //切换动画方式
  });
});
</script>
<script>
layui.use('flow', function(){
  var $ = layui.jquery; //不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
  var flow = layui.flow;
  flow.load({
    elem: '#demo' //指定列表容器
    ,scrollElem:'.layui-body'
    ,done: function(page, next){ //到达临界点（默认滚动触发），触发下一页
      var lis = [];
      //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
      $.get('/agora/list/'+page, function(res){
        //假设你的列表返回在data集合中
      	var temp = 0;
        layui.each(res.data, function(index, item){
        	if(index%3==0){
        		temp=0;
          		//lis.push('<li style="height:450px;width:300px;float:left;">'+ item.title +'</li>');
          		lis.push('<li class="lilist">');
        	}
				temp++;
				if(item.type != null && item.type!=''){
					lis.push('<div class="lidiv"><div style="height:215px;"><a href="/watch/'+item.id+'"><img style="width:100%;height:100%;" src="../imgs/default.jpg"/></a></div><div style="height:40px;width:100%;background-color: rgb(230,230,230);"><span style="padding:5px;">'
					+item.title
					+'</span></div></div>');
				}else{
					lis.push('<div class="lidiv"><div style="height:215px;"><a href="#" onclick="roomClosed();"><img style="width:100%;height:100%;" src="../imgs/default.jpg"/></a></div><div style="height:40px;width:100%;background-color: rgb(230,230,230);"><span style="padding:5px;">'
					+'老师不在,请稍后再来~'
					+'</span></div></div>');
				}
        	if(temp%3==0){
          		lis.push('</li>');
          	}
        }); 
        
        //执行下一页渲染，第二参数为：满足“加载更多”的条件，即后面仍有分页
        //pages为Ajax返回的总页数，只有当前页小于总页数的情况下，才会继续出现加载更多
        next(lis.join(''), page < res.pages);    
      });
    }
  });
});
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
	}else{
	}
}
</script>
</body>
</html>