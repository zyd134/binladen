package com.aaa.controller;

import com.aaa.entity.Goods;
import com.aaa.service.GoodsService;
import com.aaa.utils.NumberUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/goods")
public class GoodsController {

    @Resource
    private GoodsService goodsService;

    @RequestMapping("/selectGoods")
    @ResponseBody
    public List<Map> selectGoods(){
        return goodsService.queryGoods();
    }

    //跳转到采购页面
    @RequestMapping("/toBuyIn")
    public String toRe(){
        return "houtai/buyIn";

    }


    @RequestMapping("/getGoodList")
    public String getGoodList(int currentPage, Model model){
        int count= goodsService.getCountOfGood();
        int pageSize = 5;
        int totalPage= count%pageSize==0?count/pageSize:count/pageSize+1;
        model.addAttribute("count",count);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("currentPage",currentPage);
        model.addAttribute("goodList",goodsService.getGoodList(pageSize*(currentPage-1),pageSize));
        model.addAttribute("goodTypeList",goodsService.getGoodTypeList());
        return "houtai/goodsMgt";
    }

    //删除商品
    @RequestMapping("/delGoodById")
    @ResponseBody
    public Map<String,String> delGoodById(String goodNo){
        Map map = new HashMap();
        if(goodsService.delGoodsByGoodNo(goodNo)){
            map.put("result","success");
        }else{
            map.put("result","fail");
        }
        return map;
    }


    //修改商品
    @RequestMapping("/updGoodByNo")
    @ResponseBody
    public Map<String,String> updGoodByNo(Goods goods){
        Map map = new HashMap();
        if(goodsService.updGoods(goods)){
            map.put("result","success");
        }else{
            map.put("result","fail");
        }
        return map;
    }

    //通过商品编号获得商品
    @RequestMapping("/getGoodByNo")
    @ResponseBody
    public Goods getGoodByNo(String goodNo){
        return goodsService.getGoodByNo(goodNo);
    }

    //添加商品
    @RequestMapping("/addGood")
    @ResponseBody
    public Map<String,String> addGood(Goods goods){
        System.out.println("进来了");
        Map map = new HashMap();
        goods.setGoodNo("SP"+NumberUtil.createNum());
        if(goodsService.addGood(goods)){
            map.put("result","success");
        }else{
            map.put("result","fail");
        }
        return map;
    }
}
