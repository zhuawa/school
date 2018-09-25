package com.esen.demo.agora.entity;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import com.esen.demo.agora.util.ChannelPool;

import lombok.Data;

/** 
 * @author luog
 * @version 2018年9月13日,下午1:01:39
 * @类说明：
 */
@Data
public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	private String id;//用户id
	private String uid = ChannelPool.createNewRandomKey(1, 9999)+"";
	private String name;//用户昵称
	private String pw;//用户密码
	private String unit;//工作单位
	private String isHost;//是否拥有主播权限
	
	public  Map<String, Object> prop = new HashMap<String, Object>();//扩展属性
}
