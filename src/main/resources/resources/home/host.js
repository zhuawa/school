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
}

function openPage(type){
	layer.open({
		  type: 2, 
		  content: ['/anchor/'+type,'no'] //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
		}); 
}

function banned(oper, $, obj){
	var data = obj.data; //获得当前行数据
	var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
	var tr = obj.tr; //获得当前行 tr 的DOM对象
	$.ajax({
					    	  type: 'POST',
					    	  url: '/host/banned',//发送请求
					    	  data: {oper:oper, userid:data.id},
					    	  dataType : "json",
					    	  success: function(result) {
					    	  }
					    	});
}

function connect(oper, $, obj){
	var data = obj.data; //获得当前行数据
	var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
	var tr = obj.tr; //获得当前行 tr 的DOM对象
	if(data.connecting == 1){
		ws.send("cmd:[cancelconnect]"+data.id);
	}else{
		ws.send("cmd:[connect]"+data.id);
	}
}

function logout(){
	$.post("/logout");
}
