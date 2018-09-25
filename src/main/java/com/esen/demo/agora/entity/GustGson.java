package com.esen.demo.agora.entity;

import java.util.List;
import java.util.Map;

import lombok.Data;

/** 
* @author luog
* @version 2018年9月19日,下午5:49:44
* @类说明：
*/
@Data
public class GustGson {
	private int code;
	private String msg;
	private String count;
	private List<Map<String,String>> data;
}
