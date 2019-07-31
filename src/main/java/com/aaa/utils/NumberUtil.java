package com.aaa.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class NumberUtil {

    public static String createNum(){
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
        String  formDate =sdf.format(date);
        return formDate;
    }
}
