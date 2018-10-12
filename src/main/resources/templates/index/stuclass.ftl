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
        


        //GsX = GS._GsX_;
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
</head>
<body><div class="" style="display: none; position: absolute;">


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
                        	<img id="ppt" src="main/img/zzs_1.jpg" width='100%' style="width:100%;height:100%;"/>
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
		                    <div class="function_flot_network function_flot">            <span>优选网络</span>            <b></b>          </div>     <!-- <div class="network_init de">      当前网络不佳，请尝试<a class="choose close_video" href="javascript:;">关闭视频</a>或<a  class="choose choose_net_work" href="javascript:;">优选网络</a>       </div> -->    </li>   </ul>     <ul class="contron_right">    <li class="operation" id="hand">     <a class="ation operation_raise " onclick="uphand()" href="javascript:;">
		                    <img width='35px' src="../main/img/puthand.png"/>      <span class="raise_time de">00</span>     </a>     <div class="function_flot_hand function_flot function_flot_hand_t">            <span>举手</span>            <b></b>          
		                    </div>    
		                    </li>    
		                    <li class="operation" id="question">     <a class="ation operation_QA" href="javascript:;"></a>     
		                    <div class="function_flot_qa function_flot">            
		                    <span></span>            
		                    <b></b>         
		                    </div>    
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


<div id="div_device" class="panel panel-default" style="margin:0px;">
		<div class="select">
			<label for="audioSource">音频设备(Audio source): </label>
			<select id="audioSource"></select>
		</div>
		<div class="select">
			<label for="videoSource">视频设备(Video source): </label><select id="videoSource"></select>
		</div>
	</div>

		<div class="panel-body" style="display:none;">
			<input id="appId" type="hidden" value="737535e73a634ffebc3f794e637736ee" size="36"></input>
			频道: <input id="channel" type="text" value='${channelNum!}' size="4"></input>
			<div style="display:none;">主播: <input id="video" type="checkbox" checked></input></div>
			<button id="join" class="btn btn-primary" onclick="join('0', '${Session.loginInfo.uid}')">加入房间</button>
			<button id="leave" class="btn btn-primary" onclick="leave()">离开</button>
			<button id="publish" class="btn btn-primary" onclick="publish()">开播</button>
			<button id="unpublish" class="btn btn-primary" onclick="unpublish()">停止播放</button>
		</div>
		

<script src="../home/gust.js"></script>
<script src="../home/student.js"></script>
<script>
var stuClass;
window.onload = function(){
	stuClass = new StuClass(this);
	getDevices();
	join();
}
</script>
</body>
</html>