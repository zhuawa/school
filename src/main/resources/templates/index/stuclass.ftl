<!DOCTYPE html>
<!-- saved from url=(0114)http://zhixue.gensee.com/training/site/s/31484419?token=989959&nickname=%E8%BE%9B%E9%80%B8&uid=1500000100009212401 -->
<html xmlns:gs="http://www.gensee.com/gsml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="renderer" content="webkit">
    <title>学生课堂</title>
    <link type="text/css" rel="stylesheet" href="../main/css/stuclass/dark.css">
    <link type="text/css" rel="stylesheet" href="../main/css/stuclass/default.css">
    <link type="text/css" rel="stylesheet" href="../main/css/stuclass/jquery-ui.min.css">
    <link type="text/css" rel="stylesheet" href="../main/css/stuclass/main_2015.css">
    <link type="text/css" rel="stylesheet" href="../main/css/stuclass/plugin_2015.css">
 	<script type="text/javascript" src="../js/jquery-2.1.1.min.js"></script>
    <script src="../assets/js/jquery-1.8.2.min.js"></script>
    <script src="../main/js/stuclass.js"></script>
    
    <style type="text/css">
        .qa-show-mine .not-mine{display:none;}
        .not-mine-hide .not-mine{display:none;}
        .survey .gs-inner-container {
            width: 600px;
            height: 450px;
            position: absolute;
            left: 50%;
            top: 150px;
            margin-left: -300px;
        }
        .survey-result .gs-inner-container {
            width: 600px;
            height: 450px;
            position: absolute;
            left: 50%;
            top: 150px;
            margin-left: -300px;
        }
        .gs-titlebar{cursor: move;}
        .lottery-container{
            height:281px;
        }
        
    </style>
<!--
    <script type="text/javascript" src="../main/js/stuclass/jquery-1.9.1.min1.js"></script>
    <script type="text/javascript" src="../main/js/stuclass/gssdk1.js"></script>
    <script type="text/javascript" src="../main/js/stuclass/require.js"></script>

    <script type="text/javascript" src="../main/js/stuclass/gswidgets.js"></script>
    <script type="text/javascript" src="../main/js/stuclass/text-limit.js"></script>
    <script type="text/javascript" src="../main/js/stuclass/jquery.qrcode.min.js"></script>
    <script type="text/javascript" src="../main/js/stuclass/jquery-ui-1.10.3.custom.min.js"></script>

    <script type="text/javascript" src="../main/js/stuclass/json2.js"></script>
    <script type="text/javascript" src="../main/js/stuclass/lang.zh_CN.js"></script>
    <script type="text/javascript" src="../main/js/stuclass/new-player.base.js"></script>
    <script type="text/javascript" src="../main/js/stuclass/new-player.qa.live.js"></script>  

    <script type="text/javascript" src="../main/js/stuclass/new-player.common.live.js"></script>

    <script type="text/javascript" src="../main/js/stuclass/new-player.live.js"></script>

    <script type="text/javascript" src="../main/js/stuclass/jquery.artDialog.source.js"></script>
    <script type="text/javascript" src="../main/js/stuclass/jquery.mousewheel.js"></script>
    <script type="text/javascript" src="../main/js/stuclass/jquery.jscrollpane.min.js"></script>
    <script type="text/javascript" src="../main/js/stuclass/scale3.js" defer="defer"></script>
    <script type="text/javascript" src="../main/js/stuclass/Adaptive3.js"></script>
    <script type="text/javascript" src="../main/js/stuclass/arr3.js"></script>
  -->
  
    <link rel="stylesheet" href="../main/css/stuclass/default1.css">
    <link rel="stylesheet" href="../main/css/stuclass/stuclass.css">
    <script type="text/javascript">
        var licenseNotEnoughNoticeText = "";
        $(function(){
            initParams();
            if("false"=="true"){
                modifyUI(1);
            }else if("false"=="true"){
                modifyUI(10);
            }else{
                if("true"=="false"){//聊天为主
                    modifyUI(11,10);
                }else{
                    modifyUI(11,1);
                }
            }
            //禁止聊天和问答,解绑表情点击事件
            if("false"=="true"){
                $("#chat-area").attr("contenteditable","false");
                $(".phiz-btn").unbind("click");
            }
         //   $("#headlineShade").qrcode({width:132,height:132,text:location.href});
        })
        function initParams(){
        //    User.nickname = Util.trim('\u8F9B\u9038');
         //   User.id = '1500000100009212401';
        }
        function modifyUI(v1, v2){
            var Chat_only='<gs:plugin-chat id="widget-chat" class="widget_chat_hide" ui="classic" ver="v1" visible="true"   ></gs:plugin-chat>';
            var Qa_only='<gs:plugin-qa-live id="widget-qa-live" ui="classic" ver="v1" visible="true"   ></gs:plugin-qa-live>';
            switch(v1){
                case 1:
                    $("#widget-chat").hide();
                    $("#menu-chat").hide();
                <!-- //仅问答 -->
                        $("#widget-chat").remove();
                    $("#widget-qa-live").remove();
                    $(".live3_wrap .spaced_two").append(Qa_only);
                    $("#QA_num").css({"text-align":"left","width":"100%"});
                    $("#QA_num .spaced_padleft").css({"padding-left":"10px"});
                    $(".spaced_li").removeClass("spaced_btn").css({"cursor": "initial"});
                    $(".spaced_li").unbind();
                    $("#bottom-menu").addClass("four-shortcuts");
                    $("#leftRightWidgetSwitchBtn").remove();
                    $("#dsAnimationModule").addClass("dsAnimation_Module");
                    break;
                case 10:
                    $("#widget-qa-live").hide();
                    $("#menu-qa").hide();
                    $("#bottom-menu").addClass("four-shortcuts");
                    $("#leftRightWidgetSwitchBtn").remove();
                <!-- //仅聊天 -->
                        $("#widget-chat").remove();
                    $("#widget-qa-live").remove();
                    $(".live3_wrap .spaced_two").append(Chat_only);
                    $("#chat_num").css({"text-align":"left","width":"100%"});
                    $("#chat_num .spaced_padleft").css({"padding-left":"10px"});
                    $(".spaced_li").removeClass("spaced_btn").css({"cursor": "initial"});
                    $(".spaced_li").unbind();
                    // webplayer.config.chatIsMain = true;
                    //webplayer.leftRightChange();
                    break;
                case 11:
                    if(v2==10){
                    <!-- // $(webplayer).bind("inited", function(){
                        // webplayer.config.chatIsMain = true;
                        //webplayer.leftRightChange(true);
                        //});  -->
                    }
                    break;
                default:;
            }
        }
        if("false"=="false"){
            window.webPriChat = false;
        }
        //系统是否信息拦
        if("false"=="false"){
            window.ZshowInfo = false;
        }
        //boss设置的聊天时间间隔
        window.ZsubmitMinInterval="3";
        


        GsX = GS._GsX_;
    </script>
    
<!--
<script charset="UTF-8" src="../main/js/stuclass/video"></script>
<script charset="UTF-8" src="../main/js/stuclass/audio"></script>
<script charset="UTF-8" src="../main/js/stuclass/doc"></script>
<script charset="UTF-8" src="../main/js/stuclass/barrage"></script>
<link type="text/css" rel="stylesheet" href="../main/css/stuclasscommon.css">
<link type="text/css" rel="stylesheet" href="../main/css/stuclasscommon(1).css">-->
<!--
<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="gs_annex_classic_v1" src="../main/js/stuclass/annex.js"></script>
<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="gs_lang" src="../main/js/stuclass/lang.cn.js"></script>
<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="gs_chat_classic_v1" src="../main/js/stuclass/chat.js"></script>
<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="gs_ctrl-live_classic_v1" src="../main/js/stuclass/ctrl-live.js"></script>
<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="gs_infobox_classic_v1" src="../main/js/stuclass/infobox.js"></script>
<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="gs_literal_classic_v1" src="../main/js/stuclass/literal.js"></script>
<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="gs_lottery_classic_v1" src="../main/js/stuclass/lottery.js"></script>
<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="gs_qa-live_classic_v1" src="../main/js/stuclass/qa-live.js"></script>
<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="gs_qalive-popup_classic_v1" src="../main/js/stuclass/qalive-popup.js"></script>
<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="gs_rollcall_classic_v1" src="../main/js/stuclass/rollcall.js"></script>
<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="gs_userlist_classic_v1" src="../main/js/stuclass/userlist.js"></script>
<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="gs_vote_classic_v1" src="../main/js/stuclass/vote.js"></script>
<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="gs_vote-result_classic_v1" src="../main/js/stuclass/vote-result.js"></script>
<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="gs_publish-card_popular_v1" src="../main/js/stuclass/publish-card.js"></script>
<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="gs_red-packet_classic_v1" src="../main/js/stuclass/red-packet.js"></script>
<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="gs_ds-animation_classic_v1" src="../main/js/stuclass/ds-animation.js"></script>
<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="gs_jqueryui" src="../main/js/stuclass/jquery-ui-1.10.3.custom.min1.js"></script>
<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="gs_tmpl" src="../main/js/stuclass/micro-templating.resig.gs.js"></script>

-->
<link type="text/css" rel="stylesheet" href="../main/css/stuclass/annex.css">
<link type="text/css" rel="stylesheet" href="../main/css/stuclass/ctrl-live.css">
<link type="text/css" rel="stylesheet" href="../main/css/stuclass/chat.css">
<link type="text/css" rel="stylesheet" href="../main/css/stuclass/infobox.css">
<link type="text/css" rel="stylesheet" href="../main/css/stuclass/literal.css">
<link type="text/css" rel="stylesheet" href="../main/css/stuclass/lottery.css">
<link type="text/css" rel="stylesheet" href="../main/css/stuclass/qa-live.css">
<link type="text/css" rel="stylesheet" href="../main/css/stuclass/qalive-popup.css">
<link type="text/css" rel="stylesheet" href="../main/css/stuclass/rollcall.css">
<link type="text/css" rel="stylesheet" href="../main/css/stuclass/userlist.css">
<link type="text/css" rel="stylesheet" href="../main/css/stuclass/vote.css">
<link type="text/css" rel="stylesheet" href="../main/css/stuclass/vote-result.css">
<link type="text/css" rel="stylesheet" href="../main/css/stuclass/publish-card.css">
<link type="text/css" rel="stylesheet" href="../main/css/stuclass/red-packet.css">
<link type="text/css" rel="stylesheet" href="../main/css/stuclass/ds-animation.css">
<script src="../assets/js/jquery-1.8.2.min.js"></script>
<script src="../AgoraRTCSDK-2.4.0.js"></script>
<script>
var userId = '${Session.loginInfo.id}';
var uid = '${Session.loginInfo.uid}';
var userName = '${Session.loginInfo.name}';
var isHost = '${Session.loginInfo.isHost}';
</script>
<script src="../layui/layui.js"></script>
<script src="../home/student.js"></script>
<script src="../home/gust.js"></script>
</head>
<body><div class="" style="display: none; position: absolute;">
<!-- 设备 -->
<div id="div_device" class="panel panel-default" style="display:none;margin:0px;">
		<div class="select">
			<label for="audioSource">音频设备(Audio source): </label>
			<select id="audioSource"></select>
		</div>
		<div class="select">
			<label for="videoSource">视频设备(Video source): </label><select id="videoSource"></select>
		</div>
</div>
<div style="display:none;">主播: <input id="video" type="checkbox" checked></input></div>


<div class="aui_outer">
<table class="aui_border">
<tbody>
<tr>
<td class="aui_nw"></td>
<td class="aui_n"></td>
<td class="aui_ne"></td>
</tr>
<tr><td class="aui_w"></td>
<td class="aui_c">
<div class="aui_inner">
<table class="aui_dialog">
<tbody>
<tr>
<td colspan="2" class="aui_header">
<div class="aui_titleBar">
<div class="aui_title" style="cursor: move;"></div>
<a class="aui_close" href="javascript:/*artDialog*/;">×</a>
</div></td></tr><tr><td class="aui_icon" style="display: none;"><div class="aui_iconBg" style="background: none;"></div></td><td class="aui_main" style="width: auto; height: auto;"><div class="aui_content" style="padding: 20px 25px;"></div></td></tr><tr><td colspan="2" class="aui_footer"><div class="aui_buttons" style="display: none;"></div></td></tr></tbody></table></div></td><td class="aui_e"></td></tr><tr><td class="aui_sw"></td><td class="aui_s"></td><td class="aui_se" style="cursor: se-resize;"></td></tr></tbody></table></div></div>
<div id="web" class="web">
	<!-- flash(升级/安装)提示 -->
	<div class="flash_box">	
		<div class="flash_outer">
			<div class="aui_title">温馨提示</div>
			<a class="aui_close draw_close"></a>
		</div>
        <div class="possible_cause">
            <div>
                <i></i>
                <h5>网页FLASH插件加载不成功，您可以尝试以下操作：</h5>
            </div>
            <div class="item_left"><span>1、</span><em>点击</em><a href="http://www.adobe.com/go/getflashplayer">
            <img src="../main/img/stuclass/icon_flash.png" alt="下载安装" adobe="" flash="" player="" border="0/">
            <em>启用flash</em></a>并在提示上选择“允许”</div>
            <div class="item_left"><span>2、</span>
            <em>点击</em>
            <a href="https://get2.adobe.com/cn/flashplayer/" target="_blank">
            <img src="../main/img/stuclass/icon_flash.png">
            <em>下载flash</em>
            </a>并安装</div>
        </div>
	</div>
    <!-- 系统提醒 -->
    <div id="sys_info" class="system_info de" style="display: block; top: -100%;">
        <div class="system_smallwp">
            <div class="system_title">
                <b class="system_bg"></b>
                <span class="system_ti system_ti_t">系统消息</span>
                <b class="system_close system_close_t gs-icon-close"></b>
            </div>
            <div class="system_main"></div>
        </div>
    </div>
    <!-- 语音回复 -->
    <div id="todoQa" class="system_info answer de" style="top: -100%;">
        <div class="system_smallwp">
            <div class="system_title">
                <b class="system_bg"></b>
                <!--  当前正在解答问题-->
				<span class="system_ti">
					<span class="sys_info_left">当前正在解答</span>
					<em id="system_name"></em>
					<span class="sys_info_left">的问题</span>
				</span>
                <b class="system_close"></b>
            </div>
            <div class="system_main">
                <span class="answer_ti"></span>
                <!-- <div class="answer_ap">
                    <span class="answer_name"> </span>
                    <span class="answer_time"></span>
                </div> -->
            </div>
        </div>
    </div>
    
            <!-- 拉伸加载img元素-->
            <img id="bgImg" class="web_bg" src="../main/img/stuclass/43542-newbg-1482976555272.jpg" height="100%" width="100%" alt="视频直播">
    
    
    <div></div>
    <div class="live_web live3_web" style="width: 978px; height: 616px; position: absolute; left: 50%; top: 50%; margin-left: -489px; margin-top: -305px;">
        <div class="header">
            <div class="gs-plugin gs-menubar">
                <div class="gs-menubar-main">
                    <div class="gs-title">
                        <div id="live_in" class="gs-live-in">播放中...</div>
                        <div class="gs-live-in-fo">第一讲 增值税</div>
                        
                    </div>

                    <div class="gs-tools">
                        <div class="gs-voice-setting">
                            <div class="gs-voice-btn">
                                <div class="voice_user_left">欢迎您,</div>
                                <!-- <div class="voice_user_left">访客</div> -->
                                <div class="voice_user_left visitor_id">${Session.loginInfo.name}</div>
                            </div>
                            <!-- 访客 -->
                            <gs:plugin-userlist id="widget-userList" ui="classic" ver="v1" class="gs-sdk-plugin-widget gs-classic-v1"><!--Userlist-->  <div class="gs-voice-ctrl" id="uselist_number" style="display: none;">   <div class="ctr_add ctrl_phone">    <b class="phon_bg"></b>    <span id="people_list" class="number_people gs-userlist-num"></span>    <span>人观看</span>   </div>   <div class="numper_wrap de">    <b class="phon_arr"></b>    <div id="number_gen" class="number_phon">      <ul id="number_id" class="gs-userlist-cnt">      </ul>    </div>   </div>  </div></gs:plugin-userlist>
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <div id="mainModule" class="main" style="height:25.7%;">
            <div id="leftContainer" class="left left_Main" style="width: 256px;height: 100%;">
                <div id="subscreen" class="video-item-a live3_video_a maximize_wp bord cen" style="width: 99%; height: 100%;">
                    
                        <div id="videoBgwpHandle" class="" style="display: none;"></div>
                    
                    
                    <!-- 视频-->
                    <div class="voice_icon_set"></div>
                    <div id="videoscreen" class="video_max_wrp vi_max video_opacity video_opshow" style="height: 100%;">
                        
                     </div>
                    <!-- 最大化图标 -->
                    <a href="javascript:;" class="maximum_bg" style="">
                    </a>
                </div>
                <div class="hei live3_hei"></div>
                <div class="userlist-box live3_box" style="height: 387px;">
                    <!-- 直播聊天 -->
                    <div class="spaced_wrap live3_wrap dsAnimationLocation">
                        <div class="spaced spaced_two bord">
                                <ul>
                                    <li id="QA_num" class="spaced_li die_show spaced_btn spa_hide" onClick="stuClass.show('q')">
                                    	<span class="spaced_padleft">问答</span>
                                    </li>
                                    <li id="chat_num" class="spaced_li not_hide spa_width" onClick="stuClass.show('c')">
                                    	<span class="spaced_padleft">聊天</span>
                                    </li>
                                </ul>
                                <gs:plugin-qa-live id="widget-qa-live" ui="classic" ver="v1" class="End_show gs-sdk-plugin-widget gs-classic-v1" visible="true"><!-- 问答内容 -->

<script class="gs-qa-live-item-template" type="text/template">
<li class="spaced_fe qa_tiwen only gs-qa-<%=data.id%> <%=(data.qaownerId==wg.user.id?'':'gs-qa-notmine')%>">
  <% if(GsX.Util.isEmpty(data.answer)&&GsX.Util.isEmpty(data.tip)){ %>
  	<div class="spaced_issue"> 
	    <div class="spaced_issue_info">
		      <div class="spaced_issue_p">
		        <span class="spaced_answer_name spac_ans_me">
		        	<div class="quto_name">
		        		<%=data.submitor%></div>
		        	<span class="name_white">
		        		<%=(GsX.i18n("qa.msg.ask"))%></span>
		        </span>
		        <span class="spaced_time">
		        	<%=GsX.Util.formatTime(Number(data.submitTime)*1000)%></span>
		      </div>
		      <div class="spac_container"><span class="auto_spac"><%=data.question%></span><span class="gs-qa-voice-re"></span></div>
	    </div>
    </div>
  <% } %>
  <% if(GsX.Util.isEmpty(data.answer)&&GsX.Util.isNotEmpty(data.tip)){ %>
  	<div class="spaced_issue"> 
	    <div class="spaced_issue_info">
		      <div class="spaced_issue_p">
		        <span class="spaced_answer_name spac_ans_me">
		        	<div class="quto_name">
		        		<%=data.submitor%></div>
		        	<span class="name_white">
		        		<%=(GsX.i18n("qa.msg.ask"))%></span>
		        </span>
		        <span class="spaced_time"><%=GsX.Util.formatTime(Number(data.submitTime)*1000)%></span>
		      </div>
		      <div class="spac_container"><span class="auto_spac"><%=data.question%></span><span class="gs-qa-voice-re"><%=data.tip%></span></div>
	    </div>
    </div>
  <% } %>
  <% if(GsX.Util.isNotEmpty(data.answer)){ %>
    <div class="spaced_answer anson">
    	<div class="spaced_answer_ul">
	        <div class="spaced_answer_li">
		        <div class="spaced_answer_name">
		        	<div class="answer_hidden">
		        		<div class="organizer_text_set"><%=data.answerBy%></div>
			        	<span class="tec_ans"> <%=(GsX.i18n("qa.msg.answer"))%> </span>
			        	<div class="student_text_set"><%=data.submitor%></div>
		        	</div>
			        <span class="spaced_time"><%=GsX.Util.formatTime(Number(data.answerTime)*1000) %></span>
		        </div>
		        <span class="ans_LS"><%=data.answer%></span>
		        <div class="spaced_two_hf">
		        	<div class="spaced_two_ellip hf_container"><%=data.submitor%> : <%=data.question%></div>

					   <!-- //<span class="hf_name"><span class="hf_container"> <div class="hf_none">
					    // 	<%=GsX.Util.formatTime(Number(data.submitTime)*1000)%>
					    // </span></div></span>-->
				    
				    
				    <div class="qa_hf_arrowhide"></div> 
		        </div>
		         
	        </div>
      	</div>
    </div>
  <% } %>
</li>
</script>
<script class="gs-qa-live-msg-template" type="text/template">
<li class="gs-qa-warning">
	<div class="gs-qa-type-q">
		<span class="gs-msg-time"><%=(data.time?GsX.Util.formatTime(data.time*1000):GsX.Util.currentTime())%></span> <%=data.content%> <%=GsX.i18n("qa.submit.fail.frequently")%>
	</div>
</li>
</script>
 <div class="live3_QA">  
 	<div class="chat_bg  live3_chat live3_qa gs-qa-live-list" id="qa_width" style="overflow: hidden; padding: 0px; width: 256px;">     
	 	<div class="jspContainer" id="qlist" style="width: 256px; height: 239px;" >
		 	<div class="jspPane" style="padding: 0px; top: 0px; left: 0px; width: 256px;">
			 	<ul class="spaced_ul tab_ul gs-msg-list" id="qul">    
			 	</ul>
		 	</div>
	 	</div>
	 	<div class="jspContainer" id="chatlist" style="width: 256px; height: 239px;display:none;">
		 	<div class="jspPane" style="padding: 0px; top: 0px; left: 0px; width: 256px;">
			 	<ul class="spaced_ul tab_ul gs-msg-list" id="cul">       
			 	</ul>
		 	</div>
	 	</div>
 	</div>  
 	
 <div class="spaced_foot live3_chatfoot ">   
 <div class="spaced_chat foot_show ">    
 <div class="quiz-gs-ask-hd live3foot_ti">     
 <span class="live3_left">      专家为您答疑解惑          </span>     
 <div class="number_location">      
 <span class="position_set" style="display:none;">       
 <span id="qaNum">0</span>/      
  <span>255</span>      </span>      
 <div class="cek lie3_cek">       <div class="cek_bg">       </div>       
 <label class="cek_right"></label>      </div>     </div>    
 </div>    <div class="quiz-gs-ask-input">                      
 <div class="banned_speak_qa de">      当前已被禁言，请稍等     </div>     
 <div class="quiz-gs-ask-textarea gs-ask-textarea">                           
 <textarea id="question"></textarea>                      
 </div>                      
 <div class="quiz-gs-ask-btn-wrap">       
 <input class="quiz-gs-ask-btn gs-ask-btn" type="submit" onClick="button()" value="提问">     
 </div>                 
 </div>   
 </div>  </div> </div>  </gs:plugin-qa-live>
 <gs:plugin-chat id="widget-chat" ui="classic" ver="v1" class="not_End gs-sdk-plugin-widget gs-classic-v1" style="display:none" visible="true"><!-- 右侧聊天 -->

<script class="gs-chat-sysmsg-template" type="text/template">

<li class="gs-msgtype-sys"><span class="gs-msg-time">
<%=(data.time?GsX.Util.formatTime(data.time*1000):GsX.Util.currentTime())%></span> <%=data.content%></li>
</script>
<script class="gs-chat-warning-template" type="text/template">
	<li class="gs-warning-msg"><i class="gs-msg-time">
	<%=(data.time?GsX.Util.formatTime(data.time*1000):GsX.Util.currentTime())%></i> "<%=data.content%>" <%=GsX.i18n("common.system.sendfail")%> (<%=GsX.i18n("chat.system.submittoooften")%>)</li>
</script>
<script class="gs-chat-chattoitem-template" type="text/template">
	<li><a href="javascript:;"></a></li>
</script>
  <div class="chat_bg live3_chat right_pan live3_two two_scroll on" style="overflow: hidden; padding: 0px; height: 239px; width: 100px;">     
  <div class="jspContainer" style="width: 100px; height: 239px;">
  <div class="jspPane" style="padding: 0px; top: 0px; left: 0px; width: 100px;">
  <ul class=" gs-msg-list case_ul_two tab_ul">      
  <li class="gs_sys"><b class="line_bg_wrap">
  <b class="gs_bg"></b>
  <div class="left_line"></div></b>
  <div class="gs_time">
  <div id="gs_left_title" class="gs_span_left gs_color">系统消息</div>
  <span class="gs_span_right">20:18:26</span>
  </div><div class="gs_cont"><p>正在加入直播互动</p></div></li>
  <li class="gs_sys"><b class="line_bg_wrap"><b class="gs_bg"></b>
  <div class="left_line"></div></b><div class="gs_time">
  <div class="gs_span_left gs_color">系统消息</div>
  <span class="gs_span_right">20:18:26</span></div>
  <div class="gs_cont"><p>现在禁止聊天</p></div></li></ul></div></div></div>  
  <div class="gs-chat-editor live3_editor  live3_two ">   
  <div class="gs-chat-widget">    <div class="gs-chat-font">     
  <a class="gs-btn gs-font-btn" href="javascript:;">      
  <i class="gs-icon gs-icon-font"></i>     
  </a>     
  <ul class="gs-phiz-list de" style="display: none;">      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.smile.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.goodbye.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.laugh.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.cry.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.angerly.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.nod.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.lh.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.question.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.bs.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.kb.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.xu.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.se.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.kl.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.jk.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.yun.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.ll.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.gg.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.fd.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.bz.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.gz.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.qq.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.hx.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.tx.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.jy.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.qd.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.qh.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/emotion.rb.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/feedback.agreed.png"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/feedback.against.gif"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/feedback.applaud.png"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/rose.up.png"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/rose.down.png"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/chat.gift.png"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/feedback.quickly.png"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/feedback.slowly.png"></a></li>      
  <li><a href="javascript:;"><img src="../main/img/stuclass/feedback.think.png"></a></li>      
  <div class="icon_arr"></div>              </ul>    </div>        <!--// <div class="gs-chat-phiz">    //  <a class="gs-btn gs-phiz-btn gs-fo-size" href="javascript:;">    //   <i class="gs-icon gs-icon-phiz "></i>    //  </a>    // </div>    // <div class="font_two de">    //  <div class="icon_arr"></div>    //  <div class="ft_size">    //   <div class="ft_size_arr"></div>    //   <span class="fs_gray fs_mor"><a>10px</a></span>    //   <ul class="ft_si_ul de">    //   <li><a href="javascript:;">10px</a></li>    //   <li><a href="javascript:;">12px</a></li>    //   <li><a href="javascript:;">14px</a></li>    //   <li><a href="javascript:;">16px</a></li>    //   <li><a href="javascript:;">18px</a></li>    //   <li><a href="javascript:;">20px</a></li>    //   </ul>     //  </div>    //  <div class="ft_B"><a class="fs_gray" href="javascript:;">B</a></div>    //  <div class="ft_I"><a class="fs_gray" href="javascript:;">I</a></div>    //  <ul class="ft_color">          //   <li class="fouc_co">    //    <div class="co_wh1"></div>    //   </li>    //   <li>    //    <div class="co_wh2"></div>    //   </li>    //   <li>    //    <div class="co_wh3"></div>    //   </li>    //   <li>    //    <div class="co_wh4"></div>    //   </li>    //   <li>    //    <div class="co_wh5"></div>    //   </li>    //   <li>    //    <div class="co_wh6"></div>    //   </li>    //  </ul>    // </div>-->    <div class="number_location">     <div class="character_input" style="display:none;">      <span id="inputNum">0</span>/      <span>255</span>     </div>     <div class=" lie3_cek_chat">      <div class="cek_bg">      </div>      <label class="cek_right"></label>     </div>    </div>   </div>   <div class="gs-chat-edit-wrap">    <div class="gs-chat-edit-box">     <div class="gain_list" style="display: none;">      <ul>      </ul>     </div>     <div id="chat-area" class="gs-chat-edit" contenteditable="true" maxlength="5"></div>     <div class="banned_speak de">      当前已被禁言，请稍等     </div>    </div>   </div>   <div class="chat-submit" style="display: none;">    <div class="select-obj">     <span class="d ">对</span>     <div id="chatto-box" class="select-box ">      <div id="selectedUser" class="name gs-select-name">所有人</div>      <div class="arrow gs-select-arrow"></div>      <div id="chatto-list" class="select-option gs-select-option">       <ul class="gs-selcet-list">        <li><a href="javascript:;">所有人</a></li>       </ul>      </div>     </div>    </div>    <input id="chat-submit" class="chat-send-btn" type="submit" value="发送">   </div>  </div>  </gs:plugin-chat>
                                
                            
                        </div>
                        <!-- 打赏动画 -->
                        <gs:plugin-ds-animation id="widget-ds-animation" ui="classic" ver="v1" class="gs-sdk-plugin-widget gs-classic-v1"><div id="dsAnimationPosition"></div><div id="dsAnimationModule"></div></gs:plugin-ds-animation>
                    </div>

                </div>
            </div>
            <div id="centerContainer" class="center live3_centMain" style="width: 716px; height: 540px;">
                <!-- WEB语音头部 -->
                <div class="voice_setting  de">
                    <div class="voice_set_ti live3_setting">
                        <ul>
                            <li class="voice_btn_ok_s">
                                <a class="voice_btn_ok" href="javascript:;"></a>
                                <div class="gs_voice_s">
                                    <span>语音通话中</span>
                                    <b></b>
                                </div>
                            </li>
                            <li class="voice_btn_set_s">
                                <a class="voice_btn_set" href="javascript:;"></a>
                                <div class="gs_set_s">
                                    <span>设置</span>
                                    <b></b>
                                </div>
                            </li>
                            <li class="voice_btn_no_s">
                                <div class="voice_btn_no">
                                    <a class="btn_no_refuse" href="javascript:;"></a>
                                </div>
                                <div class="gs_no_refuse">
                                    <span>挂断</span>
                                    <b></b>
                                </div>
                            </li>
                        </ul>
                        <div class="microphone_wrap de">
                            <b class="microphone_arrow"></b>
                            <div class="microphone_smllwp">
                                <span class="microphone_fp">麦克风</span>
                                <select class="microphone_ect">
                                </select>
                                <!-- <input class="microphone_btn" type="submit" value="测试"> -->
                                <div class="microphone_line">
                                    <b class="microphone_bg"></b>
                                    <div id="slider" class="microphone_volume ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" aria-disabled="false">
                                        <!--  <div class="microphone_volume_blue"></div>
                                         <a class="microphone_volume_btn" href="javascript:;"></a> -->
                                    <div class="ui-slider-range ui-widget-header ui-corner-all ui-slider-range-min" style="width: 60%;"></div><a class="ui-slider-handle ui-state-default ui-corner-all" href="http://zhixue.gensee.com/training/site/s/31484419?token=989959&amp;nickname=%E8%BE%9B%E9%80%B8&amp;uid=1500000100009212401#" style="left: 60%;"></a></div>
                                </div>
                                <div class="microphone_time"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--文档 -->
                <div class="doc-wrap live3_docwrap maximize_wp bord maxdoc cen" style="height: 90%;">
                    
                        <div class="doc_wrap_img" style="display: none;">
                            <div class="doc_font"></div>
                        </div>
                    
                    
                    <div id="mainscreen" class="video_max_wrp vi_max do_max" style="height: 100%;">
                        <div class="doc_hide doc_show">
                        	<img src="main/img/stuclass/zzs.png" style="width:100%;height:100%;"/>
                        <!--
                            <gs:doc site="zhixue.gensee.com:80" ctx="gensee_tra" ownerid="O8xsjSAUf2" code="O8xsjSAUf2__653e97c3e49248ffa9ecbe972f45c4a3 " uid="1500000100009212401" uname="辛逸" lang="zh_CN" icon="false" bgcolor="#000000" trans="0.5" style="height: 100%;" class="gs-sdk-widget">
	                            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="_GS_FLASH_ID__GS_WIDGET_4_1537964302005" width="100%" height="100%" codebase="https://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab#version=10.1.0.0">
	                            	<param name="movie" value="http://static.gensee.com/webcast/static/sdk/flash/GenseePD.swf?201805v476">	
	                            	<param name="wmode" value="transparent">	
	                            	<param name="quality" value="high">	
	                            	<param name="bgcolor" value="#ffffff">	
	                            	<param name="allowScriptAccess" value="always">	
	                            	<param name="allowFullScreen" value="true">	
	                            	<param name="flashvars" value="code=O8xsjSAUf2&amp;group=&amp;widgetid=_GS_WIDGET_4_1537964302005&amp;isSupportFull=false&amp;backgroundColor=#000000&amp;trans=0.5&amp;icon=false&amp;backURI=">	        
	                            	<embed src="http://static.gensee.com/webcast/static/sdk/flash/GenseePD.swf?201805v476" quality="high" bgcolor="#ffffff" wmode="transparent" width="100%" height="100%" name="_GS_FLASH_ID__GS_WIDGET_4_1537964302005" align="middle" play="true" loop="false" allowscriptaccess="always" allowfullscreen="true" type="application/x-shockwave-flash" flashvars="code=O8xsjSAUf2&amp;group=&amp;widgetid=_GS_WIDGET_4_1537964302005&amp;isSupportFull=false&amp;backgroundColor=#000000&amp;trans=0.5&amp;icon=false&amp;backURI=" pluginspage="http://www.adobe.com/go/getflashplayer">	
	                            </object>
                            </gs:doc>
                            -->
                        </div>
                    </div>
                    <!-- 最大化图标 -->
                    <a href="javascript:;" class="maximum_bg maxinum_show" style="">
                    </a>
                    <!-- 加载中 -->
                    <div class="upload de">
                        <img src="../main/img/stuclass/upload.gif" height="150" width="150" alt="视频加载">
                    </div>

                    <!-- 提示框 时间 -->
                    <div class="hint_time de">
                        05:20
                    </div>
                </div>
                <div class="hei"></div>

                <div class="contron bord">
                    <!-- 文字直播 -->
                    <gs:plugin-literal id="widegt-literal" ui="classic" ver="v1" class="gs-sdk-plugin-widget gs-classic-v1"><!-- 文字直播 -->  <div class="liter_wrap">   <div class="liter_icon liter_icon_location"></div>   <div class="liter_icon_border liter_icon_unfold">    <div class="liter_icon_bg">     <div class="liter_icon_show"></div>    </div>   </div>   <div class="font_live de gs-textlive-cnt" style="overflow: hidden; padding: 0px; width: 716px;">       <div class="jspContainer" style="width: 716px; height: 70px;"><div class="jspPane" style="padding: 0px; top: 0px; left: 0px; width: 716px;"><ul class="gs-textlive-list gs-cur-lang-ch">     </ul></div></div></div>  </div></gs:plugin-literal>
                    <!-- control -->
                    <gs:plugin-ctrl-live id="widegt-ctrl-live" ctx="gensee_tra" ui="classic" excludeicon="desc,daShang_pay,cn_report" ver="v1" class="gs-sdk-plugin-widget gs-classic-v1"><!-- 控制条 -->     
                    <ul class="contron_left">    
	                    <li class="volume_wp" id="volume">     
		                    <a class="volume volume_voice " href="javascript:;"></a>     
		                    <div id="slider" class="line_bg live_slid ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" aria-disabled="false">           
		                    <div class="ui-slider-range ui-widget-header ui-corner-all ui-slider-range-min" style="width: 75%;"></div>
		                    <a class="ui-slider-handle ui-state-default ui-corner-all" href="http://zhixue.gensee.com/training/site/s/31484419?token=989959&amp;nickname=%E8%BE%9B%E9%80%B8&amp;uid=1500000100009212401#" style="left: 75%;"></a></div>    
	                    </li>        
	                    <li class="volume_li" id="video" style="display: block;">     
		                    <a class="volume volume_cut volume_cut_Websocket " href="javascript:;"></a>     
		                    <div class="function_flot_video function_flot">            
			                    <span>视频</span>            
			                    <b></b>          
		                    </div>    
	                    </li>    
	                    <li class="volume_li" id="switch">     
		                 <!--   <a class="volume volume_cut volume_cut_Rtmp" href="javascript:;"></a>     -->
		                 	<img class='cut' src="main/img/stuclass/bg_smaall.png" onClick="stuClass.cut()"/>
		                    <div class="function_flot_switch function_flot">            
			                    <span>切换</span>            
			                    <b></b>          
		                    </div>    
	                    </li>    
	                    <li class="volume_li vol_net" id="network" style="display: block;">     
		                    <a class="volume volume_vol" href="javascript:;"></a>     
		                    <div></div>     
		                    <div class="network_conditions" style="display: none;">当前网络不佳，请尝试 <span>关闭视频</span> 或 <span>优选网络 </span></div>     
		                    <div class="vol_network de">      
		                    <b class="vol_network_arrow"></b>      
		                    <ul class="network_ul">             </ul>     </div>     <div></div>     
		                    <div class="function_flot_network function_flot">            <span>优选网络</span>            <b></b>          </div>     <!-- <div class="network_init de">      当前网络不佳，请尝试<a class="choose close_video" href="javascript:;">关闭视频</a>或<a  class="choose choose_net_work" href="javascript:;">优选网络</a>       </div> -->    </li>   </ul>     <ul class="contron_right">    <li class="operation" id="hand">     <a class="ation operation_raise " href="javascript:;">      <span class="raise_time de">00</span>     </a>     <div class="function_flot_hand function_flot function_flot_hand_t">            <span>举手</span>            <b></b>          </div>    </li>    <li class="operation" id="question">     <a class="ation operation_QA" href="javascript:;"></a>     
		                    <div class="function_flot_qa function_flot">            
		                    <span>问答列表</span>            
		                    <b></b>         
		                    </div>    
	                    </li>    
	                    <li class="operation" id="redpacket">     
		                    <a class="ation operation_redPacket" href="javascript:;"></a>     
		                    <div class="function_flot_red function_flot function_flot_red_t">      
		                    <span>红包</span>      <b></b>     
		                    </div>    
	                    </li>    
	                    <li class="operation" id="desc" style="display: none;">     
		                    <a class="ation operation_I" href="javascript:;"></a>     
		                    <div class="function_flot_intro function_flot">            
		                    <span>简介</span>            <b></b>         
		                     </div>    
	                    </li>    
	                    <li class="operation" id="gsShare">     
		                     <a class="ation share_icon"></a>     
		                     <div class="function_flot share_icon_hint">      
		                     <span>分享</span>     </div>     
		                     <div class="share_list" id="shareList">      
		                     <a id="gsWeChat"></a>      
		                     <a id="gsSina" href="javascript:;" target="_blank"></a>      
		                     <a id="gsQQ" href="javascript:;" target="_blank"></a>     
		                     </div>     <div class="qrcode_box" id="qrcodeBox">      
		                     <div class="qrcode_title">       
		                     <div>分享到朋友圈</div>       <a id="qrcodeClear"></a>      </div>      
		                     <div id="gsQrcode"></div>      
		                     <p>打开微信，使用“扫一扫”，点击右上角更多分享到我的朋友圈</p>     </div>     
		                     <div id="qrcodeShade"></div>    
	                     </li>    
	                     <li class="operation operation_right" id="download" style="display: none;">     
		                     <a class="ation operation_down" href="javascript:;"></a>     
		                     <div class="function_flot_download function_flot">            
		                     <span>文件下载</span>            <b></b>          </div>    
	                     </li>    
	                     <li class="operation whistle_blowing_on" id="cn_report" style="display: none;">     
		                     <a class="ation whistle_blowing_icon" id="cn_report_url" href="javascript:;"></a>     
		                     <div class="function_flot_report function_flot">      <span>举报</span>     </div>    
	                     </li>    
	                     <li class="operation daShang_pay_on" id="daShang_pay" style="display: none;">     
		                     <a class="ation daShang_pay_icon" href="javascript:;"></a>     
		                     <div class="function_flot_pay function_flot">      
		                     <span>打赏</span>      <b></b>     </div>     
		                     <div class="daShang_hint">      
		                     <span>莫急呦，直播中才能打赏噢~</span>     </div>    
	                     </li>   
                     </ul>  
                     </gs:plugin-ctrl-live>
                </div>

            </div>
            <!-- 放大后图标 -->
            <div class="full_ct full_ct_show de" style="right: 20px;"></div>
            <div class="hideCopy" style="height: 610px;"></div>
            <!-- 聊天 --><!-- 点名 -->
            <!-- <div id="rightContainer" class="right bord">
                <gs:plugin-chat id="widget-chat" ui="popular" ver="v1"></gs:plugin-chat>
            </div> -->
        </div>
        <!-- 抽奖 -->
        <gs:plugin-lottery id="widget-lottery" ui="classic" ver="v1" class="gs-sdk-plugin-widget gs-classic-v1"><!-- 抽奖 -->  <div class="draw_wrap Cj de">   <div class="draw">    <div class="draw_fin">     <div class="draw_fin_spn">抽奖</div>     <div class="draw_close"></div>    </div>          <div class="draw_wid">       <div class="draw_bg">     <div class="draw_info">                  <div class="CJ_wp">                     <div class="Cj_bg"></div>                   </div>              </div>              <!--batch-->              <div class="gs-plugin-main gs-lottery-bat-main" style="display: none;">                  <div class="gs-lottery-bat-hd">中奖名单</div>                  <div class="lottery_main">                      <div class="gs-lottery-bat-bd">                        </div>                  </div>              </div>              <!--batch End-->    </div>          </div>   </div>     </div>    <!-- 中奖名单   <div class="draw_wrap Zj de">      <div class="draw">          <div class="draw_fin">              <div class="draw_fin_spn">中奖名单</div>              <div class="draw_close"></div>          </div>          <div class="draw_list " id="draw_rt">              <ul class="gs-lottery-bat-bd">                                </ul>          </div>      </div>      batch-->      <!-- <div class="gs-plugin-main gs-lottery-bat-main"  style="display: none;">          <div class="gs-lottery-bat-hd">中奖名单</div>          <div class="gs-lottery-bat-bd">          </div>      </div> -->      <!--batch End  </div>  --></gs:plugin-lottery>


        <!-- 点名 -->
        <div class="sign_wrap Qd de">
            <gs:plugin-rollcall id="widget-rollcall" ui="classic" ver="v1" class="gs-sdk-plugin-widget gs-classic-v1" style="display: none;">
            <!-- 签到点名 -->        <div class="sign">          <div class="sign_fin gs-titlebar">              <div class="sign_fin_spn">点名开始咯</div>              <div class="draw_close gs-icon-close"></div>          </div>          <div class="sign_bg">              <div class="confirm_the_hidden">                  <div class="sign_time gs-callname-time"><span class="sign_font"></span></div>                  <!-- <input type="submit" class="sign_btn"  value="签到"> -->                  <div class="gs-callname-resp"><a class="gs-green-btn sign_btn" href="javascript:;">签到</a></div>              </div>              <div class="ign_in_successfully" style="display: none;">                  <a><i></i></a>                  <span>签到成功</span>              </div>              <div class="win_miss_call" style="display: none;">                  <span>您错过了当次点名</span>                  <div><a class="win_not_sign_in">知道了</a></div>              </div>          </div>      </div>  </gs:plugin-rollcall>
        </div>





        <!-- 问答 -->
        <gs:plugin-qalive-popup id="widget-qalive-popup" ui="classic" ver="v1" class="gs-sdk-plugin-widget gs-classic-v1"><!--QA 弹窗-->


<script class="gs-qa-vod-item-template" type="text/template">
	<li class="only  <%=(data.qaownerId==wg.user.id?'popup_live':'gs-qa-notmine')%>">
	<b class="li_bg "></b>
	<p class="answer_containr"><%=data.question%></p>
	<span><%=data.submitor%><span ><%=GsX.Util.formatTime(Number(data.submitTime)*1000) %></span></span>
	<% if(GsX.Util.isNotEmpty(data.answer)){ %>
	<li class="only gs-qa-<%=data.id%>">
		<b class="li_bg"></b>
		<p class="answer_containr"><%=data.question%></p>
		<div class="ans_itor">
			<span class="itor_name"><%=data.submitor%></span>
			<span class="pop_sublit">
			<%=GsX.Util.formatTime(Number(data.answerTime)*1000) %>
			</span>
		</div>
		<b class="arrow arrow_hide"></b>
		<div  class="arr_hi">
			<div class="question_reply">
			<span><%=data.answerBy%></span>
			<span class="replya_timer timr_padding"><%=GsX.Util.formatTime(Number(data.answerTime)*1000) %></span>
			<p class="replya_timer"><%=data.answer%></p>
			</div>	
		</div>
	</li>
	<% } %>
	</li>
</script>
<!--QA 弹窗 End-->  <div class="vote_wrap question Wd de">   <div class="vote_small_bor">    <div class="vote_title ">     <h3 class="vote_h3">问答</h3>     <div class="draw_close"></div>    </div>    <div id="question_lsit" class="question_main que_scroll gs-qa-vod-list">     <div class="question_icon">      <i></i>      <span>当前无问答记录</span>     </div>     <ul class="gs-userlist-cnt-two">           </ul>    </div>   </div>  </div> </gs:plugin-qalive-popup>
        <!-- 信息 -->
        <gs:plugin-infobox id="widget-infobox" ui="classic" ver="v1" data-desc="" data-plan="眼科医生亲临——拥抱光明未来，青少年用眼健康指导" data-speaker="刘贺婷" data-starttime="2018-09-26 20:00:00" class="gs-sdk-plugin-widget gs-classic-v1"><div id="raiset" class="vote_wrap information de">   <div class="vote_small_bor">    <div class="vote_title">     <h3 id="info_title" class="vote_h3">❤眼科医生亲临——拥抱光明未来，青少年用眼健康指导</h3>     <div class="draw_close"></div>    </div>    <div class="question_main infoma_scroll">     <div class="information_info">      <div class="info_time">       <span class="info_time_title">直播时间 :</span>       <span class="info_start">2018年09月26日20:00:00</span>      </div>           </div>     <div class="brief_main">      <div class="brief_line">       <h3 class="brief_title">简介</h3>      </div>      <p></p>     </div>     <div id="arrange_ti" class="brief_main">      <div class="brief_line">       <h3 class="brief_title">议程</h3>      </div>      <div>       <p class="arrange_time"></p>       <p class="arrange_time"></p>       <p class="arrange_time">眼科医生亲临——拥抱光明未来，青少年用眼健康指导</p>      </div>     </div>     <div class="brief_main">      <div class="brief_line">       <h3 class="brief_title">主讲人</h3>      </div>      <div>       <p class="arrange_time"></p>       <p class="arrange_time"></p>       <p class="arrange_time">刘贺婷</p>      </div>     </div>    </div>   </div>  </div></gs:plugin-infobox>
        <!-- 下载 -->
        <!--  id="widget-annex" -->
        <gs:plugin-annex id="attachment-list" class="accessory-container gs-sdk-plugin-widget gs-classic-v1" ui="classic" ver="v1"><!-- 下载 -->  <div class="vote_wrap download de">   <div class="vote_small_bor">    <div class="vote_title">     <h3 class="vote_h3">文件下载</h3>     <div class="draw_close gs-icon-close"></div>    </div>    <div class="question_main down_main">     <div class="annex_icon">      <i></i>      <span>当前无下载文档</span>     </div>     <ul class="gs-attachment-list">            </ul>    </div>    <div class="vote_foot">    </div>   </div>  </div>  
        <iframe class="gs-download-iframe" style="display:none" src="saved_resource.ftl">     </iframe>
        </gs:plugin-annex>
        <gs:plugin-publish-card id="publish-card-list" class="accessory-container gs-sdk-plugin-widget gs-popular-v1" ui="popular" ver="v1">
<script class="gs-publishcard-template" type="text/template">
<!--答题卡-->
<div class="answer_title">
	<div class="answer_name"><%=(GsX.i18n("publish.card.card"))%></div>
</div>
<div class="topic_answer">
	<a class="topic_left topic_answer_img" href="javascript:;">1<%=(GsX.i18n("publish.card.input"))%></a>
	<a class="answer_right topic_answer_img" href="javascript:;">2<%=(GsX.i18n("publish.card.publish"))%></a>
</div>
<div class="topic_title">
	<div class="topic_text">
		<div class="answer_describe" style="display:block;"><%=(GsX.i18n("publish.card.content"))%></div>
	</div>
</div>
<div class="option_periphery">
	<!-- 判断题/选择题 -->
	<div class="judge_select gs-pubc-<%=data.id%>" >
		<!-- 单项选择题 -->
		<%var question = data.questions[0].items;%>
		<% if(question.length > 2 && data.questions[0].type =="single"){ %>
		<div class="single_option_list">
			<table>
				<tr>
				    <% for(var i=0; i<question.length; i++ ){ %>
					<td>
						<div class="topic_option">
							<label for="" class="item_option_border" cardid="<%=question[i].id%>" cardoption="<%=question[i].option%>"><%=question[i].option%></label>
						</div></td>
					<% } %>
				</tr>
			</table>
		</div>
		<% } %>
		<%if(question.length > 2 && data.questions[0].type =="multi"){ %>
		<!-- 多项选择题 -->
		<div class="multiterm_option_list" style="display:block;">
			<table>
				<tr>
				    <% for(var i=0; i<question.length; i++ ){ %>
					<td>
						<div class="multiterm_option multiterm_option_border">
							<label for="" class="multiterm_img" cardid="<%=question[i].id%>" cardoption="<%=question[i].option%>"></label>
							<span><%=question[i].option%></span>
						</div></td>
					<% } %>
				</tr>
			</table>
		</div>
		<% } %>
		<!-- 判断题 -->
		<%if(question.length == 2){ %>
		<div class="judge_option_list" style="display:block;">
			<table>
				<tr>
					<td>
						<div class="judge_option_border" cardid="<%=question[0].id%>" cardoption="<%=question[0].option%>">
							 <label for="" class="judge_img judge_img_true"></label>
						</div></td>
					<td>
						<div class="judge_option_border" cardid="<%=question[1].id%>" cardoption="<%=question[1].option%>">
							 <label for="" class="judge_img judge_img_false"></label>
						</div></td>
				</tr>
			</table>
		</div>
		<% } %>
		<!-- 提交按钮 -->
		<div class="foot_submit_i">
			<input class="submit_input_style" type="submit" value="<%=(GsX.i18n("publish.card.submit"))%>">
		</div>
	</div>
</div>
</script>

<script class="gs-publishcard-result-template" type="text/template">
<!--结果-->
<div class="answer_title">
	<div class="answer_name"><%=(GsX.i18n("publish.card.card"))%></div>
	<a class="answer_close answer_close_img" href="javascript:;"></a>
</div>
<%var question = data.questions[0].items;%>
<div class="topic_answer">
	<a class="topic_left topic_answer_img  topic_left_leave" href="javascript:;">1<%=(GsX.i18n("publish.card.input"))%></a>
	<a class="answer_right topic_answer_img answer_right_on" href="javascript:;">2<%=(GsX.i18n("publish.card.publish"))%></a>
	<span class="respondence"><%=(GsX.i18n("publish.card.all1"))%><span><%=data.questions[0].total%></span><%=(GsX.i18n("publish.card.all2"))%></span>
</div>
<div class="topic_title">
	<div class="topic_text">
		<div class="answer_review">
		    <% if(question.length > 2){ %>
		    <div class="teacher_answer">
				<span style="float: left;"><%=(GsX.i18n("publish.card.tearesult"))%> </span> <span
					class="select_answer" style="display:block;float: left;"><%=data.tearesult%></span>
			</div>
			<div class="my_answer">
				<span style="float: left;"><%=(GsX.i18n("publish.card.myresult"))%> </span> <span
					class="select_answer" style="display:block;"><%=data.myresult%></span>
			</div>
			
			<% }else{ %>
			<div class="teacher_answer">
				<span style="float: left;"><%=(GsX.i18n("publish.card.tearesult"))%> </span> 
				<div>
				    <% if(data.tearesult == "A"){ %>
					<em class="answer_options"></em>
					<% }else if(data.tearesult == "B"){ %>
					<em class="answer_judge"></em>
					<% } %>
				</div>
			</div>
			<div class="my_answer">
				<span style="float: left;"><%=(GsX.i18n("publish.card.myresult"))%> </span>
				<div>
					<% if(data.myresult == "A"){ %>
					<em class="answer_options"></em>
					<% }else if(data.myresult == "B"){ %>
					<em class="answer_judge"></em>
					<% } %>
				</div>
			</div>
			<% } %>
		</div>
	</div>
</div>
<div class="option_periphery">
	<!-- 老师公布答案 -->
	<div class="answer_area" style="display:block">
		<!-- 选择题答案 -->
		<div class="uniterming">
		     <% if(question.length > 2){ %>
		     <% for(var i=0; i<question.length; i++ ){ %>
			<div class="option_item">
				<div class="option_content">
				    <% if(question[i].correct == "true" ){ %>
					<em class="right_img"></em> 
					<% } else{%>
					<span class="placeholder"></span>
					<% } %>
					<span class="option_letter"><%=question[i].option%></span>
					<div class="gs_title_background">
						<span style="width: <%=(GsX.Util.calcPercent(question[i].total, data.questions[0].total))%>%"></span>
					</div>
				</div>
				<div class="population">
					<%=question[i].total%><%=(GsX.i18n("publish.card.man"))%> <span>( <%=(GsX.Util.calcPercent(question[i].total, data.questions[0].total))%>% )</span>
				</div>
			</div>
			<% } %>
			<% }else{ %>
			<div class="option_item">
			   <div class="option_content">
				    <% if(question[0].correct == "true" ){ %>
					<em class="right_img"></em> 
					<% } else{%>
					<span class="placeholder"></span>
					<% } %>
					<span class="option_img_true"></span>
					<div class="gs_title_background">
						<span style="width: <%=(GsX.Util.calcPercent(question[0].total, data.questions[0].total))%>%"></span>
					</div>
				</div>
				<div class="population">
					<%=question[0].total%><%=(GsX.i18n("publish.card.man"))%> <span>( <%=(GsX.Util.calcPercent(question[0].total, data.questions[0].total))%>% )</span>
				</div>
			</div>
			<div class="option_item">
			   <div class="option_content">
				    <% if(question[1].correct == "true" ){ %>
					<em class="right_img"></em> 
					<% } else{%>
					<span class="placeholder"></span>
					<% } %>
					<span class="option_img_false"></span>
					<div class="gs_title_background">
						<span style="width: <%=(GsX.Util.calcPercent(question[1].total, data.questions[0].total))%>%"></span>
					</div>
				</div>
				<div class="population">
					<%=question[1].total%><%=(GsX.i18n("publish.card.man"))%> <span>( <%=(GsX.Util.calcPercent(question[1].total, data.questions[0].total))%>% )</span>
				</div>
			</div>
			<% } %>
		</div>
	</div>
</div>
<!-- 答题(对/错)表情提示框 -->
<div class="end_result">
	<div class="end_outer_frame">
		<div class="end_inner_frame">
			<!-- 错误表情提示 -->
			<div class="false_icon">
				<em></em> <span><%=(GsX.i18n("publish.card.correct"))%></span>
			</div>
			<!-- 正确表情提示 -->
			<div class="true_icon" style="display:none">
				<em></em> <span><%=(GsX.i18n("publish.card.error"))%></span>
			</div>
		</div>
	</div>
</div>
</script> <!--容器--> <div class="answer_sheet" style="display:none;">  <div class="answer_sheet_popup">  </div> </div> </gs:plugin-publish-card>

    </div>


    <!-- WEB语音 -->
    <div class="voice_smawrap Yn" tabindex="-1">
        <div class="voice_smabor">
            <div class="voice_fin">
                <div class="sign_fin_spn">Web语音</div>
                <div class="draw_close"></div>
            </div>
            <div class="voice_bg">

                <div class="audio-live">
                    <gs:audio-live site="zhixue.gensee.com:80" ctx="training" ownerid="O8xsjSAUf2" controls="false" completed="webaudiocallback" class="gs-sdk-widget"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="_GS_FLASH_ID__GS_WIDGET_3_1537964302004" width="100%" height="100%" codebase="https://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab#version=10.0.12.36">	<param name="movie" value="http://static.gensee.com/webcast/static/sdk/flash/GenseeAudio.swf?201805v476">	<param name="wmode" value="transparent">	<param name="quality" value="high">	<param name="bgcolor" value="#ffffff">	<param name="allowScriptAccess" value="always">	<param name="allowFullScreen" value="true">	<param name="flashvars" value="code=O8xsjSAUf2&amp;group=&amp;widgetid=_GS_WIDGET_3_1537964302004&amp;controls=false&amp;init=webaudiocallback">	<embed src="http://static.gensee.com/webcast/static/sdk/flash/GenseeAudio.swf?201805v476" quality="high" bgcolor="#ffffff" wmode="transparent" width="100%" height="100%" name="_GS_FLASH_ID__GS_WIDGET_3_1537964302004" align="middle" play="true" loop="false" allowscriptaccess="always" allowfullscreen="true" type="application/x-shockwave-flash" flashvars="code=O8xsjSAUf2&amp;group=&amp;widgetid=_GS_WIDGET_3_1537964302004&amp;controls=false&amp;init=webaudiocallback" pluginspage="http://www.adobe.com/go/getflashplayer">	</object></gs:audio-live></div>

                <div class="voice_main">
                    <div class="voice_img">
                        <img src="../main/img/stuclass/voice_img.jpg" alt="Web语音">
                    </div>
                    <p class="voice_info"></p>
                    <div class="voice_btn">
                        <input class="voice_ok" type="submit" value="接受">
                        <input class="voice_no" type="submit" value="拒绝">
                    </div>
                </div>
                <img class="voice_bg_flash" src="../main/img/stuclass/voice_flash.png">
            </div>
        </div>
    </div>

    <!-- 投票 -->
    <gs:plugin-vote id="widget-vote" ui="classic" ver="v1" class="gs-sdk-plugin-widget gs-classic-v1"></gs:plugin-vote>
    <gs:plugin-vote-result id="widget-vote-result" class="survey-result gs-sdk-plugin-widget gs-classic-v1" ui="classic" ver="v1"></gs:plugin-vote-result>
    
    <gs:plugin-red-packet id="widget-red-packet" ui="classic" ver="v1" class="gs-sdk-plugin-widget gs-classic-v1">
    
    

    <!-- 并发数 -->
    <div class="alert-container">
        <div class="comm-title">
            <span class="alert_title">提示</span>
            <!-- <div class="s-btn"> -->
            <a class="close-icon draw_close" href="javascript:;" onclick="$(this).parents(&#39;.alert-container&#39;).hide()"></a>
            <!-- </div> -->
        </div>
        <div class="alert-main">
            <div class="alert_main_tp alert_main_text"></div>
            <a class="alert_now" href="javascript:;" onclick="$(this).parents(&#39;.alert-container&#39;).hide()">知道了</a>
        </div>
    </div>
    <!-- 抽奖废弃提示弹窗 -->
    <div class="alert_discard">
        <div class="alert_main_tp"></div>   
    </div>
    
    <!-- 弹幕 -->
    
    <div class="bulletScreen" id="bulletScreenBox">
        <span>弹幕</span>
        <div class="bulletScreen_switch">
            <a><i class="startSwitch"></i></a>
            <div class="banChatText de" id="banChatText">当前全员禁止聊天</div>
            <!-- <div class="bulletScreen_input" contenteditable="true"></div> -->
            <input type="text" name="bulletScreenInput" class="bulletScreen_input" id="bulletScreenInput" value="">
            <button type="button" class="barrage_send" id="danMu_text_send">发送</button>
            <div class="danMu_banned_speak de">您输入的字数已超出</div>
        </div>
    </div>
    <!-- (视频/文档)层 -->
    <div class="barrage_tier" style="width: 1248px;">
        <!-- 最大化图标 -->
        <a href="javascript:;" class="maximum_too_img" style="right: 0px;"></a>
        <gs:gs-barrage site="zhixue.gensee.com:80" ctx="training" ownerid="O8xsjSAUf2" code="O8xsjSAUf2__653e97c3e49248ffa9ecbe972f45c4a3" class="gs-sdk-widget"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" id="_GS_FLASH_ID__GS_WIDGET_5_1537964302006" width="100%" height="100%" codebase="https://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab#version=10.1.0.0">	<param name="movie" value="http://static.gensee.com/webcast/static/sdk/flash/Barrage.swf?201805v476">	<param name="wmode" value="transparent">	<param name="quality" value="high">	<param name="bgcolor" value="#ffffff">	<param name="allowScriptAccess" value="always">	<param name="allowFullScreen" value="true">	<param name="flashvars" value="code=O8xsjSAUf2&amp;group=&amp;widgetid=_GS_WIDGET_5_1537964302006">	        <embed src="http://static.gensee.com/webcast/static/sdk/flash/Barrage.swf?201805v476" quality="high" bgcolor="#ffffff" wmode="transparent" width="100%" height="100%" name="_GS_FLASH_ID__GS_WIDGET_5_1537964302006" align="middle" play="true" loop="false" allowscriptaccess="always" allowfullscreen="true" type="application/x-shockwave-flash" flashvars="code=O8xsjSAUf2&amp;group=&amp;widgetid=_GS_WIDGET_5_1537964302006" pluginspage="http://www.adobe.com/go/getflashplayer">	</object></gs:gs-barrage></div>
    
    <!-- 私聊 -->
    <div id="privateChat">
        <div class="direct_message" id="directMessage">
            <div class="direct_message_top">
                <div class="gs_span_left">
                </div>
                <a class="privateChatHint_close" id="privateChatHintClose"><span></span></a>
            </div>
            <div class="direct_message_cont"></div>
            <div class="privateChat_reply" id="privateChatReply">回复</div>
        </div>
        <div id="privateChatBg"></div>
        <div class="private_chat_messages" id="privateChatMessages">
            <div class="private_chat_title">
                <div class="private_chat_object" id="privateChatObject">
                    <em>正在和</em><span></span>私聊
                </div>
                <a class="private_chat_close" id="privateChatClose"></a>
            </div>
            <div class="private_chat_cont">
                <ul class="private_chat_window_list" id="privateChatWindowList">
                </ul>
            </div>
            <div class="private_chat_input_box">
                <div id="privateChatErrorHint"></div>
                <input type="text" name="" class="private_chat_input" id="privateChatInput">
                <button type="button" class="private_chat_button" id="privateChatButton">发送</button>
            </div>
        </div>
    </div>
    
    
<!--red packet container-->


<!--grab public red packet info-->
<script class="gs-grab-pubrp-template" type="text/template">
	<!-- 抢红包 -->
	<div class="red_packet_bg">
		<div class="grab" udata="<%=data.hbid%>">
			<span><%=(GsX.i18n("redpacket.item.grab"))%></span>
			<em id="red_packet_load" style="display:none"></em>
		</div>
		<div class="red_packet_title">
			<div class="whom">
				<a><%=data.username%></a> <span><%=(GsX.i18n("redpacket.item.one"))%></span>
			</div>
			<div class="describe">
			<%=data.comment%>
			</div>
		</div>
	</div>
</script>

<!--show private red packet info-->
<script class="gs-show-prirp-template" type="text/template">
	<div class="public_bg">
		<div class="inner_box">
			<!-- 抢到红包/定向红包 -->
			<div class="snag_packet">
				<span class="money"><%=data.sum%></span> <a class="shift_to"><%=(GsX.i18n("redpacket.hb.into"))%></a> <i></i>
				<div class="addresser">
					<span><%=(GsX.i18n("redpacket.hb.from"))%></span> <a><%=data.username%></a> <span><%=(GsX.i18n("redpacket.hb.whos"))%></span>
				</div>
			</div>
		</div>
	</div>
</script>

<!--my red packet result-->
<script class="gs-result-myrp-template" type="text/template">
	<!-- 红包反馈  -->
	<div class="public_bg">
		<div class="inner_box">
		    <% if(data.code=="0"){ %>
			<!-- 抢到红包/定向红包 -->
			<div class="snag_packet">
				<span class="money"><%=data.amount%></span> <a class="shift_to"><%=(GsX.i18n("redpacket.hb.intoall"))%></a> <i></i>
			</div>
			<% } else if(data.code=="10105"){ %>
			<!-- 红包已抢完 -->
			<div class="red_finish">
				<span><%=(GsX.i18n("redpacket.hb.over"))%></span>
				<div><%=(GsX.i18n("redpacket.hb.short"))%></div>
				<i></i>
			</div>
			<% } else if(data.code=="10106"){%>
			<!-- 红包已过期 -->
			<div class="past_due">
				<span><%=(GsX.i18n("redpacket.hb.out"))%></span>
				<div><%=(GsX.i18n("redpacket.hb.next"))%></div>
				<i></i>
			</div>
			<% } else if(data.code=="10104"){%>
			<!-- 其他提示 -->
			<div class="past_due">
				<span><%=(GsX.i18n("redpacket.hb.repeat"))%></span>
				<div><%=(GsX.i18n("redpacket.hb.next"))%></div>
				<i></i>
			</div>
			<% } else if(data.code=="10107"){%>
			<!-- 其他提示 -->
			<div class="past_due">
				<span><%=(GsX.i18n("redpacket.hb.point"))%></span>
				<div><%=(GsX.i18n("redpacket.hb.next"))%></div>
				<i></i>
			</div>
			<% } %>
		</div>
		<div class="look_over" udata="<%=data.hbid%>">
			<span><%=(GsX.i18n("redpacket.hb.lookall"))%> </span>
		</div>
	</div>
</script>


<!--network error-->
<script class="gs-result-rperror-template" type="text/template">
    <div class="alert_container" id="repack_neterror_container" style="display:none">
        <div class="comm_title">
            <span class="alert_title"><%=(GsX.i18n("redpacket.hb.tip"))%></span>
                <a class="close_icon draw_close" href="javascript:;" id="repack_neterror_close"></a>
        </div>
        <div class="alert_main">
            <div class="alert_main_tp alert_main_text"><%=(GsX.i18n("redpacket.hb.error"))%></div>
            <a class="alert_now" id="repack_neterror_btn" href="javascript:;"><%=(GsX.i18n("common.button.sure"))%></a>
        </div>
    </div>
</script>

<!--all people red packet result-->
<script class="gs-result-allrp-template" type="text/template">
	<!-- 红包详情 -->
	<div class="red_details">
		<div class="head_detail">
		    <% if(data.code == "0") {%>
			<span class="total_money"><%=data.amount%></span>
			<% } else if(data.code=="10105"){ %>
			<span class="hint_size"><%=(GsX.i18n("redpacket.hb.over"))%></span>
			<% } else if(data.code=="10106"){%>
			<span class="hint_size"><%=(GsX.i18n("redpacket.hb.out"))%></span>
			<% } else{ %>
			<span class="total_money"></span>
			<% } %>
			<div class="name_red">
				<a><%=data.uname%></a><span><%=(GsX.i18n("redpacket.hb.whos"))%></span>
			</div>
			<a class="felicitate">
			<%=data.comment%>
			</a>
		</div>
		<div class="roll_call">
			<ul>
			    <% for(var i = 0; i < data.userlist.length; i++) {%>
			    <li>
					<div class="gs_time_left"><%=GsX.Util.formatTime(Number(data.userlist[i].time*1000))%></div> 
					<span class="optimum">
					<% if(data.userlist[i].best){ %>
						<i></i>
					<% } %>
					</span>
					<div class="gs_name_centre"><%=data.userlist[i].username%></div>
					<div class="gs_money_right"><%=data.userlist[i].amount%></div></li>
			    <% } %>
			</ul>
		</div>
	</div>
</script>

<!--my history red packet container-->


<!--my history red packet-->
<script class="gs-history-myrp-template" type="text/template">
    <% if(data.list.length == 0){ %>
	<div class="not_received">
		<i></i> <span><%=(GsX.i18n("redpacket.hb.no"))%></span>
	</div>
	<% } else{%>
	<div class="who_condition">
		<span><%=data.name%></span> <a><%=(GsX.i18n("redpacket.hb.allreceive"))%></a>
		<div><%=data.sum%></div>
	</div>
	<div class="total_money_bt">
		<div class="money_number">
			<span><%=data.count%></span>
			<div><%=(GsX.i18n("redpacket.hb.receive"))%></div>
		</div>
		<div class="fortune">
			<span><%=data.bests%></span>
			<div><%=(GsX.i18n("redpacket.hb.best"))%></div>
		</div>
	</div>
	<div class="friends">
		<ul>
		    <% for(var i = 0; i < data.list.length; i++) {%>
			<li>
				<div class="redPacket_time">
					<h5><%=data.list[i].susername%></span></h5>
					<div class="time_line">
						<span><%=GsX.Util.formatYMD(Number(data.list[i].time*1000))%></span> <a><%=GsX.Util.formatTime(Number(data.list[i].time*1000))%></a>
						<div><%=data.list[i].amount%></div>
					</div>
				</div>
			</li>
			<% } %>
		</ul>
	</div>
	<% } %>
</script>
     <div class="red_packet" style="display: none;">         
     <div class="aui_titleBar">             
     <div class="aui_title">红包</div>             
     <a class="aui_close draw_close" id="packet_mian_close" href="javascript:;">×</a>         
     </div>         
     <div class="red_packet_content">         
     </div>
              </div>     
              <div class="red_packet_shade_in"></div>      
              <!-- 我的红包 -->  <div class="redPacket_details" style="display: none;">   
              <div class="aui_titleBar">    <div class="me_redPacket">我的红包</div>    
              <a class="aui_close draw_close" id="packet_his_close" href="javascript:;">×</a>   
              </div>   <div class="details_content">   
              </div>  
              </div>  
              <div class="red_packet_shade"></div> 
              </gs:plugin-red-packet></div>

<script>
var stuClass;
window.onload = function(){
	stuClass = new StuClass(this);
	join();
}
</script>
</body>
</html>