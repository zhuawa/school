package com.esen.demo.agora.util;

import java.util.ArrayList;
import java.util.List;

/** 
* @author luog
* @version 2018年9月19日,下午8:54:10
* @类说明：
*/
public class Banned {
	private static final Banned banned = new Banned();
	private List<String> bannedList = new ArrayList<String>();
	private Banned() {};
	
	public static Banned getInstance() {
		synchronized(banned){
			return banned;
		}
	}
	
	public void addBanned(String userId) {
		if(!bannedList.contains(userId)) {
			bannedList.add(userId);
		}
	}
	
	public List<String> getBannedList(){
		return bannedList;
	}

	public void removeBanned(String userid) {
		bannedList.remove(userid);
	}
	
}
