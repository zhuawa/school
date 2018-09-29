function StuClass(wnd){
	this._wnd = wnd ? wnd : window;
	this._doc = this._wnd.document;
	this.type = TYPE_QUESTION;
	
};
var TYPE_QUESTION = "q";//问题
var TYPE_CHAT = "c";//聊天
/**
 * 提问
 */
StuClass.prototype.ask = function() {
	var q = $('#question').val();
	if (this.type===TYPE_QUESTION) {
		$('#qul').append('<li style="color:white;font-size:12px;">辛逸：'+q+'</li> ');
	} else {
		$('#cul').append('<li style="color:white;font-size:12px;">辛逸：'+q+'</li> ');
	}
	
	$('#question').val(""); 
}

/**
 * 切换页面
 * @param type
 */
StuClass.prototype.show = function(type) {
	this.type = type;
	if (type===TYPE_QUESTION) {
		$('#qlist').css("display","block");
		$('#chatlist').css("display","none");
		$("#chat_num").removeClass("spaced_btn");
		$("#QA_num").addClass("spaced_btn");
	} else {
		$('#qlist').css("display","none");
		$('#chatlist').css("display","block");
		$("#QA_num").removeClass("spaced_btn");
		$("#chat_num").addClass("spaced_btn");
	}
	
}

/**
 * 切换课件和视频
 * @param type
 */
StuClass.prototype.cut = function() {
	/*$("#subscreen").after($("#mainscreen"));
	$("#mainscreen").after($("#subscreen"));*/
	var el1 = $("#subscreen");
	var el2 = $("#mainscreen");
	exchange(el1, el2);
}


/**
 * 交换两个dom元素的位置
 * @param a
 * @param b
 */
function exchange(a,b){
    var n = a.next(), p = b.prev();
    if (p.length==0) {//人物视频在main区域要切换到sub区域
    	n=b.next();
    	p=a.prev();
    	a.insertBefore(n);
        b.insertAfter(p);
        document.getElementById('agora_remote').style.height='160px';
        document.getElementById('agora_remote').style.width='256px';
    } else {
    	 b.insertBefore(n);
    	    a.insertAfter(p);
            document.getElementById('agora_remote').style.height='486px';
            document.getElementById('agora_remote').style.width='815px';
    }
    
};