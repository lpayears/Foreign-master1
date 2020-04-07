package com.lpa.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class SubUtils {


    /**
     * 生成YYYY+0001此类流水编号
     * @param maxOrderno
     * @return
     */
    public static String createNumber (String maxOrderno){
        String orderNo = null;
        SimpleDateFormat format = new SimpleDateFormat("YYYY"); // 时间字符串产生方式
        String uid_pfix = format.format(new Date()); // 组合流水号前一部分，时间字符串，如：2020
        if (maxOrderno != null && maxOrderno.contains(uid_pfix)) {
            String uid_end = maxOrderno.substring(5, 8); // 截取字符串最后四位，结果:0001
            int endNum = Integer.parseInt(uid_end); // 把String类型的0001转化为int类型的1
            int tmpNum = 10000 + endNum + 1; // 结果10002
            orderNo = uid_pfix + SubUtils.subStr("" + tmpNum, 1);// 把1002首位的1去掉，再拼成0190710002字符串

        }else{
            //第一位
            orderNo=uid_pfix+"0001";
        }
        return orderNo;

    }
    public static String subStr(String str, int start) {
        if (str == null || str.equals("") || str.length() == 0)
            return "";
        if (start < str.length()) {
            return str.substring(start);
        } else {
            return "";
        }

    }

}