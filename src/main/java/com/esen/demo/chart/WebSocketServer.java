package com.esen.demo.chart;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;

import com.esen.demo.agora.entity.User;
import com.esen.demo.agora.util.Banned;
import com.esen.demo.agora.util.ChannelPool;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;




/** 
 * @author luog
 * @version 2018年9月14日,下午1:30:15
 * @类说明：
 */
@ServerEndpoint(value = "/websocket")
@Component
public class WebSocketServer {

//public static Map<String, Session> conns = new HashMap<String, Session>();// session的map
public static Map<String, Map<String, Object>> conns = new HashMap<String, Map<String, Object>>();// session的map
public static Map<String, JsonObject> userMap = new HashMap<String, JsonObject>();

    /**
     * 
     * @Title: OnOpen
     * @Desc: 前端打开链接后，将执行此方法
     *
     * @param session
     * @param config
     *            参数
     *
     */
    @OnOpen
    public void OnOpen(Session session, EndpointConfig config) {
        System.out.println("---------open---------" + session.getId());
        Map s = null;
        Session ss = null;
        JsonObject userJson = null;
        String userInfo = session.getQueryString();
        userInfo = URLDecoder.decode(userInfo);
        String id  = "";
        String name = "";
        JsonObject jsonObj = null;
        if(userInfo!=null && !userInfo.equals("")){
        	jsonObj = new JsonParser().parse(userInfo).getAsJsonObject();
        	id = jsonObj.get("id").getAsString();
        	name = jsonObj.get("name").getAsString();
            userMap.put(id, jsonObj);
        }
        Map map = new HashMap();
        map.put("session", session);
        map.put("userJson", jsonObj);
        conns.put(id, map);
        for (String conn : conns.keySet()) {// 遍历已有的session（即已有的连接）
            s = conns.get(conn);
            synchronized (s) {
                try {
                	ss = (Session)s.get("session");
                	userJson = (JsonObject)s.get("userJson");
                    ss.getBasicRemote().sendText(userJson.get("name").getAsString() + "进入了聊天室"+"userList:"+userMap.values().toString());// 根据session发送到对应页面
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        
    }

    /**
     * 
     * @Title: message
     * @Desc: 消息处理，接收前端的send，并将消息返回给各个前端连接的页面
     *
     * @param message
     * @param session
     *            参数
     *
     */
    @OnMessage
    public void message(String message, Session session) {
        // System.out.println("---------message---------" + session.getId());
        Map s = null;
        Session ss = null;
        JsonObject userJson = null;

    	JsonObject jsonObj = new JsonParser().parse(URLDecoder.decode(session.getQueryString())).getAsJsonObject();
        boolean hasBanned = hasBanned(session);
        if("cmd:[uphand]".equals(message)) {
        	uphand(jsonObj);
        	return;
        }else if(message!=null && message.startsWith("cmd:[connect]")){
        	connect(message, jsonObj);
        	return;
        }
        for (String conn : conns.keySet()) {
            s = conns.get(conn);
            synchronized (s) {
                try {
                	ss = (Session)s.get("session");
                	userJson = (JsonObject)s.get("userJson");
                	if(!hasBanned) {
                    ss.getBasicRemote()
                            .sendText((session.getId() == ss.getId() ? "我" : jsonObj.get("name").getAsString()) + " 说:" + message);
                	}else {
                		if(session.getId() == ss.getId()) {
                			ss.getBasicRemote()
                            .sendText("您处于禁言状态,不能发言!");
                		}
                	}
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    

	/**
     * 
     * @Title: close
     * @Desc: 关闭连接，前端close方法时调用
     *
     * @param session
     *            参数
     *
     */
    @OnClose
    public void close(Session session) {
        //System.out.println("---------close---------" + session.getId());
    	Map s = null;
        Session ss = null;
        JsonObject userJson = null;

    	JsonObject jsonObj = new JsonParser().parse(URLDecoder.decode(session.getQueryString())).getAsJsonObject();
    	String id = jsonObj.get("id").getAsString();
        conns.remove(id);
        userMap.remove(id);
        for (String conn : conns.keySet()) {
            s = conns.get(conn);
            if (s != session)
                synchronized (s) {
                    try {
                    	ss = (Session)s.get("session");
                    	userJson = (JsonObject)s.get("userJson");
                        ss.getBasicRemote().sendText(userJson.get("name").getAsString() + "离开了聊天室");
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
        }
        
        ChannelPool cp = ChannelPool.getInstance();
        Map<String, User> cuMap = cp.getCuMap();
        User user = null;
        Integer closeChannelNum = null;
        for (String channelNum : cuMap.keySet()) {
            user = cuMap.get(channelNum);
            if(user!=null) {
            	if(id.equals(user.getId())) {
            		closeChannelNum = Integer.parseInt(channelNum);
            	}
            }
                
        }
        if(closeChannelNum!=null) {
        	cp.removeChannel(closeChannelNum);
        }
    }

    /**
     * 
     * @Title: close
     * @Desc: 系统出错时调用
     *
     * @param session
     *            参数
     *
     */
    @OnError
    public void onError(Session session, Throwable error) {
        System.out.println("error");
        error.printStackTrace();
    }
    
    /**
     * 方法说明:学生举手
     * @param jsonObj
     */
    private void uphand(JsonObject jsonObj) {
    	String channelNum = jsonObj.get("channelnum").getAsString();
    	Map<String, User> cuMap = ChannelPool.getInstance().getCuMap();
    	User user = cuMap.get(channelNum);
    	Session hostSession = (Session)conns.get(user.getId()).get("session");
    	String id = jsonObj.get("id").getAsString();
    	String name = jsonObj.get("name").getAsString();
    	try {
			hostSession.getBasicRemote().sendText("cmd:[uphand]["+id+","+name+"]");
			return;
		} catch (IOException e) {
			e.printStackTrace();
		}
    }
    
    /**
     * 
     * 方法说明:判断用户是否被禁言
     * @param session
     * @return
     */
    private boolean hasBanned(Session session) {
    	Map s = null;
        Session ss = null;
        JsonObject userJson = null;
    	for (String conn : conns.keySet()) {
             s = conns.get(conn);
             synchronized (s) {
                 try {
                 	ss = (Session)s.get("session");
                 	userJson = (JsonObject)s.get("userJson");
                 	JsonObject jsonObj = new JsonParser().parse(URLDecoder.decode(session.getQueryString())).getAsJsonObject();
                 	if(session.getId() == ss.getId()) {//找到发消息的人的userid
                 		String userId = userJson.get("id").getAsString();
                 		return Banned.getInstance().getBannedList().contains(userId);
                 	}
                 } catch (Exception e) {
                     e.printStackTrace();
                 }
             }
         }
    	return false;
    }
    
    /**
     * 方法说明:教师请求连麦
     * @param message
     * @param jsonObj
     */
    private void connect(String message, JsonObject jsonObj) {
    	String userId = message.substring(13);
    	Session connectSession = (Session)conns.get(userId).get("session");
    	String channelNum = jsonObj.get("channelnum").getAsString();
    	Map<String, User> cuMap = ChannelPool.getInstance().getCuMap();
    	User user = cuMap.get(channelNum);
    	try {
			connectSession.getBasicRemote().sendText("cmd:[connect]["+user.getId()+","+user.getName()+"]");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
