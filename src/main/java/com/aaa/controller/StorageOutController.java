package com.aaa.controller;

import com.aaa.service.StorageOutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("out")
public class StorageOutController {

    @Autowired
    private StorageOutService storageOutService;

    @RequestMapping("/getOutNo")
    @ResponseBody
    public String getOutNo(){
        String depotNo=null;
        int count= storageOutService.getdepotInCount();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
        if(count<10){
            depotNo="No"+sdf.format(new Date())+ "00"+(count+1);
        }else if(count<100){
            depotNo="No"+sdf.format(new Date())+ "0"+(count+1);
        }else{
            depotNo="No"+sdf.format(new Date())+(count+1);
        }
        return  depotNo;
    }

    @RequestMapping("/insertOutDe")
    @ResponseBody
    public String insertOutDe(String outNo,String outGoodNo,int goodAmount,String salePerson,int num){
        int a=storageOutService.insertOutDe(outNo,outGoodNo,goodAmount,salePerson,num);
        if(a>0){
            return "true";
        }else {
            return "fales";
        }
    }
}
