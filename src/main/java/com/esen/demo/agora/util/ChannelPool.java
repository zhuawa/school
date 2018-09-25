package com.esen.demo.agora.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.esen.demo.agora.entity.User;

/** 
 * @author luog
 * @version 2018年9月13日,上午10:04:22
 * @类说明：
 */
public class ChannelPool {
	private ParameterObject paraObj;//该对象池的属性参数对象
	private static List<Integer> channels = new ArrayList<Integer>();
	private static Map<String, User> cuMap = new HashMap<String, User>();//用来保存主播与频道的对应关系
	private static int minCount = 0;
	private static int maxCount = 1000000000;
	private static ChannelPool cp = new ChannelPool();
	
	private ChannelPool(){};
	
	public static ChannelPool getInstance(){
		synchronized(cp){
			if(cp==null){
				cp = new ChannelPool();
			}
			return cp;
		}
	}
	
	public int getChannelNum() {
		synchronized(channels){
			int value = createNewRandomKey(paraObj.getMinCount(), paraObj.getMaxCount());
			channels.add(value);
			return value;
		}
	}

	public int getChannelNum(int hopeNum) {
		synchronized(channels){
			channels.add(hopeNum);
			return hopeNum;
		}
	}
	
	public void removeChannel(int channelNum) {
		channels.remove(Integer.valueOf(channelNum));
		cuMap.remove(channelNum+"");
	}
	
	 /**  
     *  创建一个不重复的随机数
     * @author ztd  
     * @param keys
     * @param minVal
     * @param maxVal
     * @return  
     */
    public static Integer createNewRandomKey(Integer minVal, Integer maxVal) {
        Integer v = createRandomKey(minVal, maxVal);
        while(channels.contains(v)) {
            v = createRandomKey(minVal, maxVal);
        }
        return v;
    }

    /**  
     *  创建一个在范围内的随机数
     * @author ztd  
     * @param minVal
     * @param maxVal
     * @return  
     */
    private static Integer createRandomKey(Integer minVal, Integer maxVal) {
        Integer v  = new Random().nextInt(maxVal);
        if(v <= minVal) {
            v = v +minVal;
        }
        return v;
    }

	public static int getMinCount() {
		return minCount;
	}

	public static void setMinCount(int minCount) {
		ChannelPool.minCount = minCount;
	}

	public static int getMaxCount() {
		return maxCount;
	}

	public static void setMaxCount(int maxCount) {
		ChannelPool.maxCount = maxCount;
	}

	public static List<Integer> getChannels() {
		return channels;
	}

	public static void setChannels(List<Integer> channels) {
		ChannelPool.channels = channels;
	}

	public static Map<String, User> getCuMap() {
		return cuMap;
	}

	public static void setCuMap(Map<String, User> cuMap) {
		ChannelPool.cuMap = cuMap;
	}

}
