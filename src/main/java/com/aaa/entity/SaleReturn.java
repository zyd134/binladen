package com.aaa.entity;

import java.util.Date;
import java.util.List;

public class SaleReturn {
    private Integer id;
    //退货单编号
    private String returnNo;
    //退货时间
    private Date returnDay;
    //操作人
    private String operator;
    //经手人
    private String handlePerson;
    //客户编号
    private String customer;
    //退货价格
    private Double returnPrice;
    //退货明细集合
    private List<SaleReturnDetail> saleReturnDetailList;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getReturnNo() {
        return returnNo;
    }

    public void setReturnNo(String returnNo) {
        this.returnNo = returnNo;
    }

    public Date getReturnDay() {
        return returnDay;
    }

    public void setReturnDay(Date returnDay) {
        this.returnDay = returnDay;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getHandlePerson() {
        return handlePerson;
    }

    public void setHandlePerson(String handlePerson) {
        this.handlePerson = handlePerson;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public Double getReturnPrice() {
        return returnPrice;
    }

    public void setReturnPrice(Double returnPrice) {
        this.returnPrice = returnPrice;
    }
}
