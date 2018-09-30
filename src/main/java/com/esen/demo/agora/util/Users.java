package com.esen.demo.agora.util;

import java.util.HashMap;
import java.util.Map;

import com.esen.demo.agora.entity.User;

/** 
 * @author luog
 * @version 2018年9月13日,下午1:01:10
 * @类说明：
 */
public class Users {
	private static Map<String, User> users;
	private static Map<String, User> hosts;
	private static Map<String, User> gusts;
	static{
		User host1 = new User();
		host1.setId("host1");
		host1.setName("教师1");
		host1.setPw("host1");
		host1.setIsHost("1");
		User host2 = new User();
		host2.setId("host2");
		host2.setName("教师2");
		host2.setPw("host2");
		host2.setIsHost("1");
		hosts = new HashMap<String, User>();
		hosts.put("host1", host1);
		hosts.put("host2", host2);

		User gust1 = new User();
		gust1.setId("gust1");
		gust1.setName("学生1");
		gust1.setPw("gust1");
		gust1.setIsHost("0");
		User gust2 = new User();
		gust2.setId("gust2");
		gust2.setName("学生2");
		gust2.setPw("gust2");
		gust2.setIsHost("0");
		gusts = new HashMap<String, User>();
		users = new HashMap<String, User>();
		gusts.put("gust1", gust1);
		gusts.put("gust2", gust2);
		users.putAll(gusts);
		users.putAll(hosts);
	}

	/**
	 * 方法说明:根据主播id获取主播
	 * @param id
	 * @return
	 */
	public static User getHostById(String id){
		return hosts.get(id);
	}

	/**
	 * 方法说明:根据观众id获取观众
	 * @param id
	 * @return
	 */
	public static User getUserById(String id){
		return users.get(id);
	}

	/**
	 * 方法说明:根据观众id获取观众
	 * @param id
	 * @return
	 */
	public static User getGustById(String id){
		return gusts.get(id);
	}
	
	/**
	 * 方法说明:添加主播
	 * @param user
	 */
	public static void addHost(User user){
		hosts.put(user.getId(), user);
	}
	
	/**
	 * 方法说明:添加观众
	 * @param user
	 */
	public static void addGust(User user){
		gusts.put(user.getId(), user);
	}

}
