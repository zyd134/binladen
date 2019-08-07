package com.aaa.entity;

public class SaleReturnDetail {
    //销售退货单号
    private String saleReturnNo;
    //商品编号
    private String goodNo;
    //商品数量
    private int goodAmount;

    public String getSaleReturnNo() {
        return saleReturnNo;
    }

    public void setSaleReturnNo(String saleReturnNo) {
        this.saleReturnNo = saleReturnNo;
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
