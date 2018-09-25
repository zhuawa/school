package com.esen.demo.test.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import org.springframework.stereotype.Component;

/** 
 * @author luog
 * @version 2018年7月26日,下午4:55:01
 * @类说明：person
 */
//@AllArgsConstructor
//@RequiredArgsConstructor
//@ToString
//@Getter@Setter
@Data
@Component
public class Person {
	private String name;
	private int age = 18;
	private Home home;
	private char type;
}
