package com.aaa.controller;

import com.aaa.service.ProcurementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("pro")
public class ProcurementController {

    @Autowired
    private ProcurementService procurementService;

    @RequestMapping("selectPro")
    @ResponseBody
    public List<Map> selectPro(){
        return procurementService.selectPro();
    }

    @RequestMapping("selectDic")
    @ResponseBody
    public List<Map> selectDic(){
        return procurementService.selectDic();
    }

    @RequestMapping("examineById")
    @ResponseBody
    public String examineById(Integer status,String procurementNo){
        System.out.println("+++++++"+status);
        int a=procurementService.examineById(status,procurementNo);
        if(a>0){
            return "true";
        }else{
            return "false";
        }
    }
}
