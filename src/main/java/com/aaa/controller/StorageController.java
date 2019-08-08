package com.aaa.controller;

import com.aaa.service.StorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("sto")
public class StorageController {

    @Autowired
    private StorageService storageService;
    /**
     * 获取所有仓库
     * @return
     */
    @RequestMapping("selectNo")
    @ResponseBody()
    public List<Map> selectNo(){
        return storageService.selectNo();
    }

    /**
     * 入库
     * @param map
     * @return
     */
    @RequestMapping("/insertSto")
    @ResponseBody//向客户端响应一个json数据
    public String insertSto(@RequestBody Map map) {//从客户端接收一个数据
        boolean flag=storageService.insertSto(map);
        if(flag)
            return "true";
        else
            return "false";
    }

    @RequestMapping("updateAndInsert")
    @ResponseBody
    public String updateAndInsert(String orderid,String goodNo,int size,String inNo,int goodAmount,String applyperson,String storageNo){
        boolean bn=storageService.updateAndInsert(orderid,goodNo,size,inNo,goodAmount,applyperson,storageNo);
        if (bn){
            return "true";
        }else{
            return "false";
        }
    }

}
