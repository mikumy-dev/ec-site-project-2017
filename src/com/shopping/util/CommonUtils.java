package com.shopping.util;

import java.security.MessageDigest;

public class CommonUtils {
	
	/**
	 * 产生一个随机的字符串，作为订单的编号 长都为15
	 * @return
	 */
	public static String generatorOrderNum(){
		int r1=(int)(Math.random()*(10));//产生2个0-9的随机数
		int r2=(int)(Math.random()*(10));
		long now = System.currentTimeMillis();//一个13位的时间戳
		return  String.valueOf(r1)+String.valueOf(r2)+String.valueOf(now);// 订单ID
	}
	
	/*
	 * MD5 加密
	 */
	public static String toMD5(String str){  
		StringBuffer hexValue = new StringBuffer();  
        MessageDigest md5 = null;  
        try{  
            md5 = MessageDigest.getInstance("MD5");  
        }catch (Exception e){  
            System.out.println(e.toString());  
            e.printStackTrace();  
            return "";  
        }  
        byte[] md5Bytes = md5.digest(str.getBytes());  
        for (int i = 0; i < md5Bytes.length; i++){  
            int val = ((int) md5Bytes[i]) & 0xff;  
            if (val < 16)  {
                hexValue.append("0");
            }
            hexValue.append(Integer.toHexString(val));  
        }  
        return hexValue.toString();  
    }  
}
