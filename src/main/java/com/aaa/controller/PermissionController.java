package com.aaa.controller;

import com.aaa.entity.Employees;
import com.aaa.service.PermissionService;
import com.aaa.service.SupplierService;
import com.aaa.utils.NumberUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("per")
public class PermissionController {
    @Autowired
    private PermissionService permissionService;

    @Resource
    private SupplierService supplierService;

    @RequestMapping("toOutStock")
    public String toOutStock(){
        return "houtai/outStock";
    }

    @RequestMapping("toBackIndex")
    public String toBackIndex(){
        return "houtai/backIndex";
    }

    @RequestMapping("toShow")
    public String toShow(){
        return "houtai/a";
    }

    @RequestMapping("toAddEmp")
    public String toAddEmp(){
        return "houtai/addEmp";
    }

    @RequestMapping("toSelectEmp")
    public String toSelectEmp(){
        return "houtai/selectEmp";
    }

    @RequestMapping("toSelectEmpByRole")
    public String toSelectEmpByRole(){
        return "houtai/selectEmpByRole";
    }

    @RequestMapping("toBuyIn")
    public String toBuyIn(Model model){
        model.addAttribute("purNo","CGDD"+NumberUtil.createNum());
        model.addAttribute("supplierList",supplierService.getAllSupplierList());
        return "houtai/buyIn";
    }


    @RequestMapping("toCeshi")
    public String toCeshi(){
        return "houtai/ceshi";
    }

    @RequestMapping("toGetApplyOrder")
    public String toGetApplyOrder(){
        return "houtai/getApplyOrder";
    }

    @RequestMapping("toSelectPro")
    public String toSelectPro(){
        return "houtai/selectPro";
    }

    @RequestMapping("toAllocation")
    public String toAllocation(){
        return "houtai/allocation";
    }

    @RequestMapping("selectPermission")
    @ResponseBody
    public List<Map> selectPermission(HttpSession session){
        Employees employees=(Employees)session.getAttribute("emp");
        return permissionService.selectPermission(employees.getId());
    }
}
