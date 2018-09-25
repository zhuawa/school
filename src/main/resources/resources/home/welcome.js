function roomClosed(){
	layer.open({
		  title: '消息'
		  ,content: '主播不在,请稍后再来'
		});    
}
function loginPage(){
	var tishi = document.getElementById("tishi");
	tishi.style.display = "none";
	layui.use('layer', function(){
		  var layer = layui.layer;
		  var $ = layui.jquery;
		  $("#userid").val("");
		  $("#userpw").val("");
		  
		  layer.open({
			  type: 1,
			  title: '&nbsp;登录',
			  content: $('#loginPage') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
		  }); 
	});   
}
layui.use('form', function(){
	var form = layui.form;
	var $ = layui.jquery;
	  
	  //监听提交
	form.on('submit(loginFormDemo)', function(data){
		
		$.post("/login", data.field, function(data) {
			if(data=='success'){
				window.location.href = "/welcome";
			}else{
				var tishi = document.getElementById("tishi");
				tishi.style.display = "";
			}
		});
		return false;
	});
});
function loginSuccess(data){
}
function logout(){
	$.post("/logout", null, function(data) {
		
	});
}

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

function openPage(type){
	layer.open({
		  type: 1,
		  shade: false,
		  area: ['620px', '380px'],
		  maxmin: true,
		  content: $('#settingPage'),
		  zIndex: layer.zIndex, //重点1
		  success: function(layero){
		    layer.setTop(layero); //重点2
		  }
		});   
	layui.use(['form','upload'], function(){
		var form = layui.form;
		var upload = layui.upload;
		var $ = layui.jquery;
		$("#type").val(type);
		form.render('select', 'typeFilter'); 
		   
		  //执行实例
		  var uploadInst = upload.render({
		    elem: '#uploadFile' //绑定元素
		    ,url: '/upload' //上传接口
		    , accept: 'file'
		    ,before: function(obj){ //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
		    	layer.load(); //上传loading
		    }
		    ,done: function(res){
		      var fileName = res.data[0].fileName;
		      var filePath = res.data[0].filePath;
		      $("#fileInput").val(fileName);
		      debugger;
		      $("#filepath").val(filePath);
		    }
		    ,error: function(){
		      debugger;
		    }
		  });
	});
}

function search_do(){
	var content = $('#demo').html('');
	var keyWord = $('#keyword').val();
	if(keyWord==null || keyWord.length<1){
		return;
	}
	
	layui.use('flow', function(){
		  var $ = layui.jquery; //不用额外加载jQuery，flow模块本身是有依赖jQuery的，直接用即可。
		  var flow = layui.flow;
		  flow.load({
		    elem: '#demo' //指定列表容器
		    ,scrollElem:'.layui-body'
		    ,done: function(page, next){ //到达临界点（默认滚动触发），触发下一页
		      var lis = [];
		      //以jQuery的Ajax请求为例，请求下一页数据（注意：page是从2开始返回）
		      $.get('/agora/list/'+page+'/'+keyWord, function(res){
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
}
