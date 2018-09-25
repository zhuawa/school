package com.esen.demo.test.bean;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;
import lombok.experimental.Builder;
import lombok.experimental.FieldDefaults;


/** 
 * @author luog
 * @version 2018年8月2日,下午3:36:25
 * @类说明：
 */
@Builder
@ToString
//@RequiredArgsConstructor
//@AllArgsConstructor
@Getter
@FieldDefaults(level=AccessLevel.PRIVATE)
public class Build {
	private String id = "9";
	private String pw = "";
}
