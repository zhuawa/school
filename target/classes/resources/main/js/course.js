/**
 * 课程
 */
function Course(wnd){
	this._wnd = wnd ? wnd : window;
	this._doc = this._wnd.document;
	this.type = TYPE_JRKC;
	
};
var TYPE_JRKC = "jrkc";//今日课程
var TYPE_DSKC = "dskc";//待上课程
var TYPE_YSKC = "yskc";//已上课程
var TYPE_ALL = "all";//已上课程
/**
 * 切换页面
 * @param type
 */
Course.prototype.showview = function(type) {
	this.type = type;
	if (type===TYPE_JRKC) {
		$("#jrkc").addClass("isShow");
		$("#dskc").removeClass("isShow");
		$("#yskc").removeClass("isShow");
		$("#jrkcli").addClass("active");
		$("#dskcli").removeClass("active");
		$("#yskcli").removeClass("active");
	} else if(type===TYPE_DSKC) {
		$("#dskc").addClass("isShow");
		$("#jrkc").removeClass("isShow");
		$("#yskc").removeClass("isShow");
		$("#dskcli").addClass("active");
		$("#jrkcli").removeClass("active");
		$("#yskcli").removeClass("active");
	} else {
		$("#yskc").addClass("isShow");
		$("#jrkc").removeClass("isShow");
		$("#dskc").removeClass("isShow");
		$("#yskcli").addClass("active");
		$("#jrkcli").removeClass("active");
		$("#dskcli").removeClass("active");
	}
}

/**
 * 切换全部课程与我的课程
 * @param type
 */
Course.prototype.changeCource = function(type) {
	 if (type===TYPE_ALL) {
		 $("#all").css("display","block");
		 $("#mycourse").css("display","none");
		 $("#allclass").addClass("course on");
		 $("#allclass").removeClass("index");
		 $("#myclass").addClass("index");
		 $("#myclass").removeClass("course on");
		 
	 } else {
		 $("#mycourse").css("display","block");
		 $("#all").css("display","none");
		 $("#allclass").addClass("index");
		 $("#allclass").removeClass("course on");
		 $("#myclass").addClass("course on");
		 $("#myclass").removeClass("index");
	 }
	}