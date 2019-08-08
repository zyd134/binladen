package com.aaa.entity;

import java.util.Date;
import java.util.List;

/**
 * 销售总表
 */
public class Sale {
    private int id;
    //销售编号
    private String saleNo;
    //销售时间
    private Date saleTime;
    //销售人
    private String salePerson;
    //销售人名
    private String salePersonName;
    //申请部门
    private String applyDepartment;
    //申请人
    private String applicant;
    //说明
    private String s_explain;
    //销售总价
    private double salePrice;
    //订单状态id
    private int status;
    //订单状态名
    private String statusName;
    //客户编号
    private String customer;
    //客户名
    private String customerName;
    //订单明细集合
    private List<SaleDetail> saleDetailList;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSaleNo() {
        return saleNo;
    }

    public void setSaleNo(String saleNo) {
        this.saleNo = saleNo;
    }

    public Date getSaleTime() {
        return saleTime;
    }

    public void setSaleTime(Date saleTime) {
        this.saleTime = saleTime;
    }

    public String getSalePerson() {
        return salePerson;
    }

    public void setSalePerson(String salePerson) {
        this.salePerson = salePerson;
    }

    public String getApplyDepartment() {
        return applyDepartment;
    }

    public void setApplyDepartment(String applyDepartment) {
        this.applyDepartment = applyDepartment;
    }

    public String getApplicant() {
        return applicant;
    }

    public void setApplicant(String applicant) {
        this.applicant = applicant;
    }

    public String getS_explain() {
        return s_explain;
    }

    public void setS_explain(String s_explain) {
        this.s_explain = s_explain;
    }

    public double getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(double salePrice) {
        this.salePrice = salePrice;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public List<SaleDetail> getSaleDetailList() {
        return saleDetailList;
    }

    public void setSaleDetailList(List<SaleDetail> saleDetailList) {
        this.saleDetailList = saleDetailList;
    }

    public String getSalePersonName() {
        return salePersonName;
    }

    public void setSalePersonName(String salePersonName) {
        this.salePersonName = salePersonName;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
}
