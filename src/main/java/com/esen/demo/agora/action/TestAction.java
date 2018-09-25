package com.esen.demo.agora.action;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.esen.demo.agora.entity.Div;
import com.esen.demo.agora.entity.User;
import com.esen.demo.agora.util.ChannelPool;
import com.esen.demo.agora.util.Users;
import com.google.gson.Gson;

/** 
 * @author luog
 * @version 2018年9月6日,下午5:52:46
 * @类说明：
 */
@Controller
public class TestAction extends BaseAction {

	@RequestMapping(value="/home/page")
	@ResponseBody
	public ModelAndView goHomePage(){
		ModelAndView mode = new ModelAndView();
		return mode;
	}
	
	@RequestMapping(value="/home")
	public String index(){
		return "index";
	}
	
	@RequestMapping(value="/welcome")
	public String welcome(){
		return "home";
	}

	@RequestMapping(value="/login")
	public String test(){
		return "login";
	}
	
	@RequestMapping(value="/dologin", method = RequestMethod.POST)
	public String login(){
		ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpServletRequest req= requestAttributes.getRequest();
		String userid = req.getParameter("name");
		String userpw = req.getParameter("password");
		User user = Users.getUserById(userid);
		if(user!=null){
			if(user.getPw().equals(userpw)){
				req.getSession().setAttribute("loginInfo", user);
				Gson gson = new Gson();
				String json = gson.toJson(user);
				req.getSession().setAttribute("loginInfoJson", json);
				return "redirect:/welcome";
			}else{
				return "redirect:/login";
			}
		}

		return null;
	}
	
	@RequestMapping(value="/logout")
	public String logout(){
		ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpServletRequest req= requestAttributes.getRequest();
		HttpSession session = req.getSession();
		session.removeAttribute("loginInfo");
		session.removeAttribute("loginInfoJson");
		return "login";
	}
	
	@RequestMapping(value = "/settingPage/{type}")
	public String toSettingPage(@PathVariable("type") String type) {
		ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpServletRequest req= requestAttributes.getRequest();
		req.setAttribute("type", type);
		return "settingpage";
	}
	
	@RequestMapping(value="/anchor",method= RequestMethod.POST)
	public String anchor(@ModelAttribute("welcome") Div div){
		ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpServletRequest req= requestAttributes.getRequest();
		String fileName = req.getParameter("fileInput");
		File file = new File(div.getFilepath()+File.separator+fileName);
		file.renameTo(new File(div.getFilepath()+File.separator+div.getNumber()+"_"+fileName));
		User user = (User)req.getSession().getAttribute("loginInfo");
		ChannelPool cp = ChannelPool.getInstance();
		int channelNum = cp.getChannelNum(Integer.parseInt(div.getNumber()));
		Map<String, User> cuMap = cp.getCuMap();
		Map<String, Object> prop = user.getProp();
		div.setId(channelNum+"");
		prop.put("div", div);
		user.setIsHost("1");
		user.setProp(prop);
		cuMap.put(channelNum+"", user);
		cp.setCuMap(cuMap);
		req.setAttribute("channelNum", ""+channelNum);
		return "anchorPage";
	}
	
	@RequestMapping(value="/watch/{channelNum}")
	public String watch(@PathVariable("channelNum") int channelNum){
		ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpServletRequest req= requestAttributes.getRequest();
		User user = (User)req.getSession().getAttribute("loginInfo");
		user.setIsHost("0");
		if(ChannelPool.getInstance().getChannels().contains(channelNum)) {
			req.setAttribute("channelNum", ""+channelNum);
			return "watchPage";
		}else {
			return null;
		}
	}
	
}
