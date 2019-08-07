package com.aaa.controller;

import com.aaa.entity.Procurement;
import com.aaa.entity.PurchaseDetail;
import com.aaa.service.PurchaseService;
import com.aaa.utils.NumberUtil;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.*;

@Controller
@RequestMapping("/pur")
public class PurchaseController {
    @Resource
    private PurchaseService purchaseService;

    @RequestMapping("/toPurOrderPay")
    public String toPurOrderPay(){
        return "houtai/purchaseOrderPay";
    }


    //添加采购订单
    @RequestMapping("/purchaseGood")
    @ResponseBody
    public void purchaseGood(@RequestBody JSONObject order){
        Procurement procurement = new Procurement();
        PurchaseDetail pd=new PurchaseDetail();
        procurement.setProcurementNo(order.getString("purNo"));
        procurement.setPurchaseTime(new Date());
        procurement.setPurchaser(order.getString("applyperson"));
        procurement.setP_explain(order.getString("explain"));
        procurement.setPurchasePrice(order.getDouble("purchasePrice"));
        JSONArray goodArr = order.getJSONArray("goods");

        if(purchaseService.addProcurement(procurement)){
            System.out.println("添加采购订单成功");

            for(int i=0;i<goodArr.size();i++){
                JSONObject obj=goodArr.getJSONObject(i);
                pd=(PurchaseDetail)JSONObject.toBean(obj,PurchaseDetail.class);
                pd.setProcurementNo(procurement.getProcurementNo());
                if(purchaseService.addPurDetail(pd)){
                    System.out.println("添加订单明细成功");
                }else{
                    System.out.println("添加订单明细失败");
                }
            }
        }else{
            System.out.println("添加采购订单失败");
        }


    }


    //查询采购订单
    @RequestMapping("/selectPurOrder")
    public String selectPurOrder(){
        return "houtai/procurementOrderMgt";
    }

    @RequestMapping("/selectPurOrderByStatus")
    @ResponseBody
    public List<Procurement> selectPurOrderByStatus(int status,String empNo){
        System.out.println("jjjjjjjjjjj");
        return purchaseService.getProListByStatus(status,empNo);
    }
}
