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
<a data-v-b9939cda="" href="http://www.zhixue.com/container/index/" class="tea_logo fl">
<span data-v-b9939cda="" id="head_logo">
<img data-v-b9939cda="" src="../main/img/logo1.png" class="head_logo_tea"></span></a> 
<ul data-v-b9939cda="" id="head_menuList" class="tea_head_nav fl">
	<li data-v-b9939cda="">
		<a data-v-b9939cda="" menumodule="" menuname="homepage" appname="container" linkurl="/container/parent/unbindIndex/" class="rel">
        首页
        <i data-v-b9939cda="" class="hot" style="z-index: 2; display: none;"></i></a></li><li data-v-b9939cda=""><a data-v-b9939cda="" menumodule="" menuname="online" appname="paperfresh" linkurl="/course/#/home/index" class="rel on">
        实时课堂
        <i data-v-b9939cda="" class="hot" style="z-index: 2;">开课啦</i></a></li><li data-v-b9939cda=""><a data-v-b9939cda="" menumodule="" menuname="feesReport" appname="container" linkurl="/container/parent/unbindIndex/" class="rel">
        成绩报告
        <i data-v-b9939cda="" class="hot" style="z-index: 2; display: none;"></i></a></li><li data-v-b9939cda=""><a data-v-b9939cda="" menumodule="" menuname="errorbook" appname="addon" linkurl="/errorbook/index/" class="rel">
       互动交流
        <i data-v-b9939cda="" class="hot" style="z-index: 2; display: none;"></i></a></li><li data-v-b9939cda=""><a data-v-b9939cda="" menumodule="" menuname="automarkingStuEssay" appname="automarkingstudent" linkurl="/index" class="rel">
</ul> 
<div data-v-b9939cda="" id="head_userInfo" class="tea_head_info"><a data-v-b9939cda="" href="javascript:void(0);"><div data-v-b9939cda="" class="clearfix"></div> <span data-v-b9939cda="" id="head_teaAvartar"><img data-v-b9939cda="" alt="头像" src="../main/img/stuclass/admin01.jpg"></span> <span data-v-b9939cda=""><span data-v-b9939cda="" class="head_username" title="辛逸">辛逸</span><i data-v-b9939cda="" class="drop_arrow down"></i></span></a><a data-v-b9939cda="" id="head_sysMsgNew" class="msg_tip" style="display: none;"><i data-v-b9939cda=""></i></a> <dl data-v-b9939cda="" id="head_avatarMenuList" class="tea_drop_more"><dt data-v-b9939cda="" style="display: none;"><a data-v-b9939cda="" href="javascript:void(0);" data-role="parent" class="on">家长</a></dt> <dd data-v-b9939cda="" class="rel" style="display: none;"><a data-v-b9939cda="" href="http://ucenter.changyan.com/?app-key=zx-container-client?from=web-container_top" class="account">账号设置</a></dd> <dd data-v-b9939cda="" class="rel" style="display: none;"><a data-v-b9939cda="" href="http://www.zhixue.com/portalcenter/home/index/?from=web-container_top" class="more">更多设置</a></dd> <dd data-v-b9939cda="" class="rel" style=""><a data-v-b9939cda="" href="http://www.zhixue.com/portalcenter/home/index/?from=web-container_top" class="center">个人中心</a></dd> <dd data-v-b9939cda="" class="rel"><a data-v-b9939cda="" appname="container" linkurl="/container/systemMsg/index/?from=web-container_top" class="system">系统消息<i data-v-b9939cda="" id="head_sysMsgNew_drop" style="display: none;"></i></a></dd> <dd data-v-b9939cda="" class="rel"><a data-v-b9939cda="" id="userLogOut" href="javascript:void(0);" class="out">退出登录</a></dd></dl></div> <div data-v-b9939cda="" class="clearfix"></div></div></div>


<div>
	
	<table class="layui-hide" id="LAY_table_user" lay-filter="user"></table> 
</div>
<script>
layui.use('table', function(){
  var table = layui.table;
  
  //方法级渲染
  table.render({
    elem: '#LAY_table_user'
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
    ]]
    ,id: 'testReload'
    ,page: true
    ,height: 315
  });
  
  var $ = layui.$, active = {
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
  <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
</body>
</html>