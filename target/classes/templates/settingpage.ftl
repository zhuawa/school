<!DOCTYPE html>
<html>
<head>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  	<link rel="stylesheet" href="../layui/css/layui.css">
  	<link rel="stylesheet" href="../home/base.css">
  	<script src="../assets/js/jquery-1.8.2.min.js"></script>
	<script src="../layui/layui.js"></script>
<style>
.layui-input{
	width:200px;
}
form{
	margin:20px;
}
</style>
</head>
<body>
<div class="layui-container">  
<form class="layui-form layui-form-pane" action="/anchor">
  <div class="layui-form-item" style="margin-top:10px;">
    <label class="layui-form-label">课程编号</label>
    <div class="layui-input-block">
      <input type="text" name="title" required  lay-verify="required" placeholder="请输入课程编号" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">课程名称</label>
    <div class="layui-input-block">
      <input type="text" name="title" required  lay-verify="required" placeholder="请输入课程名称" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
  	<label class="layui-form-label">课程类别</label>
  	<div class="layui-input-block" style="width:200px;">
  		<select name="city" lay-verify="">
  		<option value="1" selected>信息技术类</option>
  		<option value="2" disabled>通用知识和能力类</option>
  		<option value="3" selected>行政管理类</option>
  		<option value="4" disabled>领导胜任力类</option>
		</select>  
	</div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">课程附件</label>
    <div class="layui-input-block">
      <button type="button" class="layui-btn" id="test1">
  		<i class="layui-icon">&#xe67c;</i>上传图片
		</button>
    </div>
  </div>
  
  <div class="layui-inline">
    <label class="layui-form-label">直播时间</label>
    <div class="layui-input-inline" style="width: 200px;">
      <input type="text" class="layui-input" placeholder="开始时间" id="starttime">
    </div>
    <span>-</span>
    <div class="layui-input-inline" style="width: 200px;">
      <input type="text" class="layui-input" placeholder="结束时间" id="endtime">
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
<script>
layui.use('laydate', function(){
  var laydate = layui.laydate;
  
  laydate.render({ 
  	elem: '#starttime'
  	,type: 'datetime'
	});
	laydate.render({ 
  	elem: '#endtime'
  	,type: 'datetime'
	});
});

layui.use('form', function(){
  var form = layui.form;
  
  //各种基于事件的操作，下面会有进一步介绍
});
</script>
</body>
</html>