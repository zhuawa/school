package com.esen.demo.agora.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.esen.demo.agora.entity.Div;
import com.esen.demo.agora.entity.GustGson;
import com.esen.demo.agora.entity.User;
import com.esen.demo.agora.util.Banned;
import com.esen.demo.agora.util.ChannelPool;
import com.esen.demo.agora.util.FileUtil;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

/** 
 * @author luog
 * @version 2018年9月7日,上午10:42:34
 * @类说明：
 */
@RestController
public class DataAction {
	
	@RequestMapping(value="/agora/list/{pageNum}")
	public Map<String, Object> list(@PathVariable("pageNum") int pageNum) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			List<Div> list = new ArrayList<Div>();
			for(int i=((pageNum-1)*12+1);i<=(pageNum*12);i++){
				Div div = null;
				List<Integer> channels = ChannelPool.getInstance().getChannels();
				if(channels.size()>i-1) {
					int channelNum = channels.get(i-1);
					Map<String, User> cuMap = ChannelPool.getInstance().getCuMap();
					User user = cuMap.get(channelNum+"");
					if(user!=null) {
						div = (Div)user.getProp().get("div");
					}else {
						div = new Div(i+"", i+"", i+"", "","","","","","");
					}
				}else {
					div = new Div(i+"", i+"", i+"", "","","","","","");
				}
				list.add(div);
			}
			map.put("data", list);
			map.put("pages", 5);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value="/agora/list/{pageNum}/{keyword}")
	public Map<String, Object> doSearchList(@PathVariable("pageNum") int pageNum, @PathVariable("keyword") String keyword) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			List<Div> list = new ArrayList<Div>();
			Div div = null;
			List<Integer> channels = ChannelPool.getInstance().getChannels();
			for(int j=0;j<channels.size();j++) {
					int channelNum = channels.get(j);
					Map<String, User> cuMap = ChannelPool.getInstance().getCuMap();
					User user = cuMap.get(channelNum+"");
					if(user!=null) {
						div = (Div)user.getProp().get("div");
						String title = div.getTitle();
						if(title!=null && title.indexOf(keyword)>-1) {
							list.add(div);
						}
					}
			}
			map.put("data", list);
			map.put("pages", 1);
			return map;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping(value="/test/data")
	public String list() {
		Gson gson = new Gson();
		GustGson gg = new GustGson();
		return gson.toJson(gg);
	}
	
	@RequestMapping(value="/host/banned", method=RequestMethod.POST)
	public String banned(@RequestParam int oper, @RequestParam String userid) {//禁言
		if(oper==1) {//禁言
			Banned.getInstance().addBanned(userid);
		}else if(oper == 0) {//取消禁言
			Banned.getInstance().removeBanned(userid);
		}
		
		return "success";
	}
	
	@RequestMapping(value="/filelist/{channelNum}", method=RequestMethod.GET)
	public String fileList(@PathVariable String channelNum) {//禁言
		JsonObject obj = new JsonObject();
		JsonArray fileArray = new JsonArray();
		JsonObject fileItem = new JsonObject();
		String filePath = "D:\\uploadfile\\";
		fileItem.addProperty("fileName", "");
		fileItem.addProperty("filePath", filePath);
		fileArray.add(fileItem);
		obj.addProperty("code", 0);
		obj.addProperty("mgs", "");
		obj.add("data", fileArray);
		return obj.toString();
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String upload(@RequestParam("file") MultipartFile file, HttpServletRequest req, HttpServletResponse res) {//禁言
		JsonObject obj = new JsonObject();
		JsonArray fileArray = new JsonArray();
		JsonObject fileItem = new JsonObject();
		String fileName = file.getOriginalFilename();
		String filePath = "D:\\uploadfile\\";
		fileItem.addProperty("fileName", fileName);
		fileItem.addProperty("filePath", filePath);
		fileArray.add(fileItem);
		obj.addProperty("code", 0);
		obj.addProperty("mgs", "");
		obj.add("data", fileArray);
		try {
			FileUtil.uploadFile(file.getBytes(), filePath, fileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj.toString();
	}
	
}
