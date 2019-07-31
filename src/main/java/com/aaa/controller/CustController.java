package com.aaa.controller;

import com.aaa.entity.Customer;
import com.aaa.service.CustomerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Controller
public class CustController {
    @Resource
    private CustomerService customerService;
    @RequestMapping("/selectCust")
    @ResponseBody
    public List<Map> showCust(){
        return customerService.query();
    }

    //添加
    @RequestMapping("/addCust")
    @ResponseBody
    public String addCust(Customer customer){
        customerService.addCust(customer);
        return "添加成功";
    }

    @RequestMapping("/delCust")
    @ResponseBody
    public void delCust(int id){
        customerService.delCust(id);
    }

    @RequestMapping("/updateCust")
    @ResponseBody
    public String updateCust(Customer customer){
        customerService.updateCust(customer);
        return "修改成功";
    }

    @RequestMapping("/toShow")
    public String toShow(){
        System.out.println("aaa");
        return  "show";

    }
}
