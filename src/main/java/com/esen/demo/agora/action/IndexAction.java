package com.esen.demo.agora.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.boot.autoconfigure.web.WebMvcProperties.View;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.esen.demo.agora.entity.User;
import com.esen.demo.agora.util.ChannelPool;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

/**
 * 主页面控制类
 * @author xinln
 *
 */
@Controller
public class IndexAction extends BaseAction {
	@RequestMapping(value="/main")
	public String main(){
		return "index/stulist";
	}
	@RequestMapping(value="/stuclass")
	public String stuclass(){
		return "index/stuclass";
	}
	@RequestMapping(value="/teacherlist")
	public String teacherlist(){
		return "index/teacherlist";
	}
	
	@RequestMapping(value="/teacherclass")
	public String teacherclass(){
		ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpServletRequest req= requestAttributes.getRequest();
		User user = (User)req.getSession().getAttribute("loginInfo");
		ChannelPool cp = ChannelPool.getInstance();
		Map<String, User> cuMap = cp.getCuMap();
		cuMap.put("1000", user);
		cp.setCuMap(cuMap);
		return "index/teacherclass";
	}
	
	@RequestMapping(value="/getTeacherClassList", method=RequestMethod.GET)
	@ResponseBody
	public String getTeacherClassList(){
		JsonArray array = new JsonArray();
		JsonObject dataObj = null;
		for (int i=0;i<1;i++) {
			dataObj = new JsonObject();
			dataObj.addProperty("id", i);
			dataObj.addProperty("username", "姜涛");
			dataObj.addProperty("org", "教育中心");
			dataObj.addProperty("sex", "女");
			dataObj.addProperty("courseid", i);
			dataObj.addProperty("coursename", "增值税");
			dataObj.addProperty("time", "2018/9/28 20:00");
			dataObj.addProperty("place", "总局202会议室");
			dataObj.addProperty("count", 50);
			array.add(dataObj);
		}
		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("code", 0);
		jsonObj.addProperty("msg", "");
		jsonObj.addProperty("count", 100);
		jsonObj.addProperty("data",array.toString());
		
		return jsonObj.toString();
	}
}
