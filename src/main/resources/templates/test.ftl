<!DOCTYPE html>
<html>
<head>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  	<title>网络学院直播首页</title>
  	<link rel="stylesheet" href="../layui/css/layui.css">
  	<link rel="stylesheet" href="../home/base.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">网络学院</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="">控制台</a></li>
      <li class="layui-nav-item"><a href="">商品管理</a></li>
      <li class="layui-nav-item"><a href="/home">用户</a></li>
      <li class="layui-nav-item"><a href="#" onclick="zhubo();">我是主播</a></li>
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
	</ul>
  
  </div>
  <!--
  <div class="layui-footer">
    © layui.com - 底部固定区域
  </div>
  -->
</div>
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
				lis.push('<div class="lidiv">'+item.title+'</div>');
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
</body>
</html>