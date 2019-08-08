package com.aaa.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

public class Procurement {
    private int id;
    private String procurementNo;
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date purchaseTime;
    private String purchaser;
    private String applyDepartment;
    private String applicant;
    private String p_explain;
    private double purchasePrice;
    //订单状态
    private int status;
    //状态名
    private String statusName;
    //供应商编号
    private String supplier;
    //订单商品明细列表
    private List<PurchaseDetail> purchaseDetailList;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProcurementNo() {
        return procurementNo;
    }

    public void setProcurementNo(String procurementNo) {
        this.procurementNo = procurementNo;
    }

    public Date getPurchaseTime() {
        return purchaseTime;
    }

    public void setPurchaseTime(Date purchaseTime) {
        this.purchaseTime = purchaseTime;
    }

    public String getPurchaser() {
        return purchaser;
    }

    public void setPurchaser(String purchaser) {
        this.purchaser = purchaser;
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

    public String getP_explain() {
        return p_explain;
    }

    public void setP_explain(String p_explain) {
        this.p_explain = p_explain;
    }


    public double getPurchasePrice() {
        return purchasePrice;
    }

    public void setPurchasePrice(double purchasePrice) {
        this.purchasePrice = purchasePrice;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getSupplier() {
        return supplier;
    }

    public void setSupplier(String supplier) {
        this.supplier = supplier;
    }

    public List<PurchaseDetail> getPurchaseDetailList() {
        return purchaseDetailList;
    }

    public void setPurchaseDetailList(List<PurchaseDetail> purchaseDetailList) {
        this.purchaseDetailList = purchaseDetailList;
    }

    public String getStatusName() {
        return statusName;
    }

    public void setStatusName(String statusName) {
        this.statusName = statusName;
    }
}
