package com.aaa.controller;

import com.aaa.entity.*;
import com.aaa.service.CustomerService;
import com.aaa.service.GoodsService;
import com.aaa.service.SaleService;
import com.aaa.utils.NumberUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
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
@RequestMapping("/sale")
public class SaleController {
    @Resource
    private SaleService saleService;

    @Resource
    private CustomerService customerService;

    @Resource
    private GoodsService goodsService;

    //获得销售订单列表
    @RequestMapping("/getSaleOrderList")
    public String getSaleOrderList(){
        return "houtai/saleOrderMgt";
    }

    //通过订单状态获得列表
    @RequestMapping("/selectSaleOrderByStatus")
    @ResponseBody
    public List<Sale> selectSaleOrderByStatus(int status,String empNo){
//        System.out.println("jjjjjjjjjjj");
        return saleService.getSaleListByStatus(status,empNo);
    }

    //通过订单编号修改订单状态
    @RequestMapping("/updSaleStatusByNo")
    @ResponseBody
    public Map<String,String> updSaleStatusByNo(int status, String saleNo){
        Map map = new HashMap();
        if(saleService.updSaleStatusByNo(status,saleNo)){
            map.put("result","success");
        }else{
            map.put("result","fail");
        }
        return map;
    }

    //跳转到收款界面
    @RequestMapping("/toSaleOrderGetPay")
    public String toSaleOrderGetPay(int status,String empNo,Model model){
        model.addAttribute("saleList",saleService.getSaleListByStatus(status,empNo));
        return "houtai/saleOrderGetPay";
    }

    //跳转到签单界面
    @RequestMapping("/toCreateSaleOrder")
    public String toCreateSaleOrder(Model model){
        model.addAttribute("saleNo","XSDD"+NumberUtil.createNum());
        model.addAttribute("customerList",customerService.query());
        return "houtai/createSaleOrder";
    }


    //添加采购订单
    @RequestMapping("/addSaleOrder")
    @ResponseBody
    public void addSaleOrder(@RequestBody JSONObject order){
        Sale sale = new Sale();
        SaleDetail sd=new SaleDetail();
        sale.setSaleNo(order.getString("saleNo"));
        sale.setSaleTime(new Date());
        sale.setSalePerson(order.getString("applyperson"));
        sale.setApplyDepartment(order.getString("applydept"));
        sale.setS_explain(order.getString("explain"));
        sale.setSalePrice(order.getDouble("salePrice"));
        sale.setCustomer(order.getString("customer"));
        JSONArray goodArr = order.getJSONArray("goods");

        if(saleService.addSale(sale)){
            System.out.println("添加销售订单成功");

            for(int i=0;i<goodArr.size();i++){
                JSONObject obj=goodArr.getJSONObject(i);
                sd=(SaleDetail) JSONObject.toBean(obj,SaleDetail.class);
                sd.setSaleNo(sale.getSaleNo());
                if(saleService.addSaleDetail(sd)){
                    System.out.println("添加订单明细成功");
                }else{
                    System.out.println("添加订单明细失败");
                }
            }
        }else{
            System.out.println("添加销售订单失败");
        }


    }

    //跳转到销售退货界面
    @RequestMapping("/toSaleReturn")
    public String toSaleReturn(Model model){
        model.addAttribute("saleReturnNo","XSTH"+NumberUtil.createNum());
        model.addAttribute("customerList",customerService.query());
        return "houtai/saleReturn";
    }

    //根据客户编号获得客户已买商品
    @RequestMapping("/getGoodListByCustomerNo")
    @ResponseBody
    public List<Goods> getGoodListByCustomerNo(String customerNo){
        return saleService.getGoodListByCustomerNo(customerNo);
    }


    /**
     * 销售退货方法
     */
    //添加销售退货订单
    @RequestMapping("/addSaleReturnOrder")
    @ResponseBody
    public void addSaleReturnOrder(@RequestBody JSONObject order){
        SaleReturn sr = new SaleReturn();
        SaleReturnDetail srd=new SaleReturnDetail();
        sr.setReturnNo(order.getString("returnNo"));
        sr.setOperator(order.getString("operator"));
        sr.setCustomer(order.getString("customer"));
        sr.setReturnDay(new Date());
        sr.setReturnPrice(order.getDouble("returnPrice"));
        JSONArray goodArr = order.getJSONArray("goods");

        if(saleService.addSaleReturnOrder(sr)){
            System.out.println("添加销售退货订单成功");

            for(int i=0;i<goodArr.size();i++){
                JSONObject obj=goodArr.getJSONObject(i);
                srd=(SaleReturnDetail) JSONObject.toBean(obj,SaleReturnDetail.class);
                if(goodsService.updGoodAccount(-(srd.getGoodAmount()),srd.getGoodNo())){
                    System.out.println("更新库存成功");
                }
                srd.setSaleReturnNo(sr.getReturnNo());
                if(saleService.addSaleReturnOrderDetail(srd)){
                    System.out.println("添加销售退货订单明细成功");
                }else{
                    System.out.println("添加销售退货订单明细失败");
                }
            }
        }else{
            System.out.println("添加销售退货订单失败");
        }


    }


    /**
     * 销售审核
     */
    @RequestMapping("/toSaleCheck")
    public String toSaleCheck(int currentPage,Model model){
        int count= saleService.getCountOfNotPassSale();
        int pageSize = 5;
        int totalPage= count%pageSize==0?count/pageSize:count/pageSize+1;
        model.addAttribute("count",count);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("currentPage",currentPage);
        model.addAttribute("checkList",saleService.getNotPassSaleList(pageSize*(currentPage-1),pageSize));
        return "houtai/saleCheck";
    }

}
