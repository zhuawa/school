package com.esen.demo.test.bean;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

/** 
 * @author luog
 * @version 2018年7月31日,下午1:53:30
 * @类说明：Data
 */
@Data
public class Student {
	private String name1;
	
	private final String name2 = "name2";
	
	public static String name3;

}
