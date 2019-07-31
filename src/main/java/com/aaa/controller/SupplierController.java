package com.aaa.controller;

import com.aaa.entity.Supplier;
import com.aaa.service.SupplierService;
import com.aaa.utils.NumberUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/sup")
public class SupplierController {
    @Resource
    private SupplierService supplierService;

    @RequestMapping("/getSupplierList")
    public String getSupplierList(int currentPage, Model model){
        int count=supplierService.getCountOfSupplier();
        int pageSize = 5;
        int totalPage= count%pageSize==0?count/pageSize:count/pageSize+1;
        if(totalPage==0){
            totalPage=1;
        }
        model.addAttribute("count",count);
        model.addAttribute("currentPage",currentPage);
        model.addAttribute("totalPage",totalPage);
        model.addAttribute("supplierList",supplierService.getSupplierList(pageSize*(currentPage-1),pageSize));
        return "houtai/supplierMgt";
    }

    //删除供应商
    @RequestMapping("/deleteSupById")
    @ResponseBody
    public Map<String,String> deleteSupById(Integer id){
        Map map = new HashMap();
        if(supplierService.deleteSupplierById(id)){
            map.put("result","success");
        }else{
            map.put("result","fail");
        }
        return map;
    }

    //通过id查找供应商信息
    @RequestMapping("/getSupplierById")
    @ResponseBody
    public Supplier getSupplierById(Integer id){
        return supplierService.getSupplierById(id);
    }

    //修改供应商
    @RequestMapping("/modifySupplier")
    @ResponseBody
    public Map<String,String> modifySupplier(Supplier supplier){
        Map map = new HashMap();
        if(supplierService.updateSupplier(supplier)){
            map.put("result","success");
        }else{
            map.put("result","fail");
        }
        return map;
    }

    //添加供应商
    @RequestMapping("/addSupplier")
    @ResponseBody
    public Map<String,String> addSupplier(Supplier supplier){
        System.out.println("进来了");
        supplier.setSupplierNo("GYS"+NumberUtil.createNum());
        Map map = new HashMap();
        if(supplierService.addSupplier(supplier)){
            map.put("result","success");
        }else{
            map.put("result","fail");
        }
        return map;
    }
}
