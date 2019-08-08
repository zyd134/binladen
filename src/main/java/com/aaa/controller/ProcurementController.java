package com.aaa.controller;

import com.aaa.dao.GoodsDao;
import com.aaa.entity.Goods;
import com.aaa.entity.PurchaseReturn;
import com.aaa.entity.PurchaseReturnDetail;
import com.aaa.service.ProcurementService;
import com.aaa.service.SupplierService;
import com.aaa.utils.NumberUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("pro")
public class ProcurementController {

    @Autowired
    private ProcurementService procurementService;

    @Resource
    private SupplierService supplierService;

    @Resource
    private GoodsDao goodsDao;

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


    //跳转到采购退货页面
    @RequestMapping("/toPurReturn")
    public String toPurReturn(Model model){
        model.addAttribute("purReturnNo","CGTH"+NumberUtil.createNum());
        model.addAttribute("supplierList",supplierService.getAllSupplierList());
        return "houtai/purchaseReturn";
    }



    /**
     * 采购退货方法
     */
    //添加采购退货订单
    @RequestMapping("/addPurReturnOrder")
    @ResponseBody
    public void addPurReturnOrder(@RequestBody JSONObject order){
        PurchaseReturn pr = new PurchaseReturn();
        PurchaseReturnDetail prd=new PurchaseReturnDetail();
        pr.setReturnNo(order.getString("returnNo"));
        pr.setOperator(order.getString("operator"));
        pr.setSupplier(order.getString("supplier"));
        pr.setReturnDay(new Date());
        pr.setReturnPrice(order.getDouble("returnPrice"));
        JSONArray goodArr = order.getJSONArray("goods");

        if(procurementService.addPurReturnOrder(pr)){
            System.out.println("添加采购退货订单成功");

            for(int i=0;i<goodArr.size();i++){
                JSONObject obj=goodArr.getJSONObject(i);
                prd=(PurchaseReturnDetail) JSONObject.toBean(obj,PurchaseReturnDetail.class);
                if(goodsDao.updGoodAccount(-(prd.getGoodAmount()),prd.getGoodNo())){
                    System.out.println("更新库存成功");
                }
                prd.setPurReturnNo(pr.getReturnNo());
                if(procurementService.addPurReturnOrderDetail(prd)){
                    System.out.println("添加采购退货订单明细成功");
                }else{
                    System.out.println("添加采购退货订单明细失败");
                }
            }
        }else{
            System.out.println("添加采购退货订单失败");
        }


    }

    //根据供应商编号获得客户已买商品
    @RequestMapping("/getGoodListBySupplierNo")
    @ResponseBody
    public List<Goods> getGoodListBySupplierNo(String supplierNo){
        return procurementService.getGoodListBySupplierNo(supplierNo);
    }

}
