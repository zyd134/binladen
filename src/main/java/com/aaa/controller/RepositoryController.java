package com.aaa.controller;

import com.aaa.service.RepositoryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/repository")
public class RepositoryController {
    @Resource
    private RepositoryService repositoryService;
     @RequestMapping("/getDepotOrderNo")
     @ResponseBody
    public String getDepotOrderNo(){
         String depotNo=null;
        int count= repositoryService.getdepotInCount();
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
}
