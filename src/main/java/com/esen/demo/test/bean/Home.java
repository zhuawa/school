package com.esen.demo.test.bean;

import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.NoArgsConstructor;

/** 
 * @author luog
 * @version 2018年7月27日,上午10:34:25
 * @类说明：
 */
public class Home {
	private String location;
	private int size;
	
	public Home(){
		System.out.println("home的无参构造器");
	}
}
