<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link type="image/x-icon" href="../main/img/logo2.png" rel="shortcut icon">
<link href="../main/css/app.923c101a47464d7e39a23053f3bbad18.css" rel="stylesheet">
<title>中国税务网络大学</title>
<script type="text/javascript" src="../js/jquery-2.1.1.min.js"></script>
<script src="../assets/js/jquery-1.8.2.min.js"></script>
<script src="../main/js/course.js"></script>
<script src="../layui/layui.js"></script>
<link rel="stylesheet" href="../layui/css/layui.css">
</head>
<body>
<div id="liveCommonHead">
<link href="../main/css/header.943a74c855571f9079d9f28f2c6788b2.css" rel="stylesheet">
<div data-v-92ffd944="" id="head_teaHead" class="tea_head" style="min-height: 60px;">
<div data-v-b9939cda="" data-v-92ffd944="" id="head_teaHead" class="tea_logo_info clearfix" headdata="[object Object]">
<a data-v-b9939cda="" href="" class="tea_logo fl">
<span data-v-b9939cda="" id="head_logo">
<img data-v-b9939cda="" src="../main/img/logo1.png" class="head_logo_tea"></span></a> 
<ul data-v-b9939cda="" id="head_menuList" class="tea_head_nav fl">
	<li data-v-b9939cda="">
		<a data-v-b9939cda="" menumodule="" menuname="homepage" appname="container" linkurl="/container/parent/unbindIndex/" class="rel">
        实时课堂
        <i data-v-b9939cda="" class="hot" style="z-index: 2;">开课啦</i></a></li><li data-v-b9939cda=""><a data-v-b9939cda="" menumodule="" menuname="feesReport" appname="container" linkurl="/container/parent/unbindIndex/" class="rel">
</ul> 
<div data-v-b9939cda="" id="head_userInfo" class="tea_head_info"><a data-v-b9939cda="" href="javascript:void(0);"><div data-v-b9939cda="" class="clearfix"></div> <span data-v-b9939cda="" id="head_teaAvartar"><img data-v-b9939cda="" alt="头像" src="../main/img/stuclass/admin01.jpg"></span> <span data-v-b9939cda=""><span data-v-b9939cda="" class="head_username" title="${Session.loginInfo.name}">${Session.loginInfo.name}</span></span></a><a data-v-b9939cda="" id="head_sysMsgNew" class="msg_tip" style="display: none;"><i data-v-b9939cda=""></i></a> <dl data-v-b9939cda="" id="head_avatarMenuList" class="tea_drop_more"><dt data-v-b9939cda="" style="display: none;"><a data-v-b9939cda="" href="javascript:void(0);" data-role="parent" class="on">家长</a></dt> <dd data-v-b9939cda="" class="rel" style="display: none;"><a data-v-b9939cda="" href="http://ucenter.changyan.com/?app-key=zx-container-client?from=web-container_top" class="account">账号设置</a></dd> <dd data-v-b9939cda="" class="rel" style="display: none;"><a data-v-b9939cda="" href="" class="more">更多设置</a></dd> </dl></div> <div data-v-b9939cda="" class="clearfix"></div></div></div>


<div>
	
	<table id="teacherList" lay-filter="teacherList" lay-data="{id: 'teacherList'}"  class="layui-hide" ></table> 
</div>
<script>
layui.use('table', function(){
  var table = layui.table;
  var $ = layui.$;
  
  //方法级渲染
  table.render({
    elem: '#teacherList'
    ,url: '/getTeacherClassList'
    ,cols: [[
      {checkbox: true, fixed: true}
      ,{field:'id', title: '教师ID', width:80, sort: true, fixed: true}
      ,{field:'username', title: '教师', width:120}
      ,{field:'org', title: '所属税务机构', width:150, sort: true}
      ,{field:'sex', title: '性别', width:80, sort: true}
      ,{field:'courseid', title: '课程ID', sort: true, width:100}
      ,{field:'coursename', title: '课程名称', width:150}
      ,{field:'time', title: '上课时间'}
      ,{field:'place', title: '上课地点', sort: true, width:135}
      ,{field:'count', title: '班级人数', sort: true, width:120}
      ,{fixed: 'right', width:178, align:'center', toolbar: '#barDemo'}
    ]],parseData: function(res){ //res 即为原始返回的数据
    									return {
      										"code": 0, //解析接口状态
      										"msg": '', //解析提示文本
      										"count": 1000, //解析数据长度
      										"data": JSON.parse(res.data) //解析数据列表
    										};
  										}
    ,height: 575
    ,page: true
  });
  
  table.on('tool(teacherList)', function(obj){ //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
		var data = obj.data; //获得当前行数据
		var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
		var tr = obj.tr; //获得当前行 tr 的DOM对象
		if(layEvent === 'enterclass'){ //进入课堂
			window.location.href = "/teacherclass";
		}
	});
  
  active = {
    reload: function(){
      var demoReload = $('#demoReload');
      
      //执行重载
      table.reload('testReload', {
        page: {
          curr: 1 //重新从第 1 页开始
        }
        ,where: {
          key: {
            id: demoReload.val()
          }
        }
      });
    }
  };
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
});
</script>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="enterclass">进入课堂</a>
</script>
</body>
</html>