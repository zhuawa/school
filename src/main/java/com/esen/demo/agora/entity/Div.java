package com.esen.demo.agora.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Builder;

/** 
 * @author luog
 * @version 2018年9月12日,上午10:20:56
 * @类说明：
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Div {
	private String id;
	private String number;
	private String title;
	private String type;
	private String starttime;
	private String endtime;
	private String teacherid;
	private String url;
	private String filepath;
}
