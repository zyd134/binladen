package com.aaa.controller;

import com.aaa.service.ProcurementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
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

    @RequestMapping("selectDet")
    @ResponseBody
    public List<Map> selectDet(String procurementNo){
        return procurementService.selectDet(procurementNo);
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


    //通过订单编号修改订单状态
    @RequestMapping("/updPOrderStatusByNo")
    @ResponseBody
    public Map<String,String> updPOrderStatusByNo(Integer status,String pNo){
        Map map = new HashMap();
        if(procurementService.examineById(status,pNo)>0){
            map.put("result","success");
        }else{
            map.put("result","fail");
        }
        return map;
    }

}
