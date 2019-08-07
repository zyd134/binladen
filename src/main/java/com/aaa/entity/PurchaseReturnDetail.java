package com.aaa.entity;

public class PurchaseReturnDetail {
    //采购退货单号
    private String purReturnNo;
    //商品编号
    private String goodNo;
    //商品数量
    private int goodAmount;

    public String getPurReturnNo() {
        return purReturnNo;
    }

    public void setPurReturnNo(String purReturnNo) {
        this.purReturnNo = purReturnNo;
    }

    public String getGoodNo() {
        return goodNo;
    }

    public void setGoodNo(String goodNo) {
        this.goodNo = goodNo;
    }

    public int getGoodAmount() {
        return goodAmount;
    }

    public void setGoodAmount(int goodAmount) {
        this.goodAmount = goodAmount;
    }
}
