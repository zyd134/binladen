package com.aaa.entity;

/**
 * 商品表
 */
public class Goods {
    private Integer id;
    //商品编号
    private String goodNo;
    //商品名
    private String goodName;
    //商品规格
    private String goodSpecs;
    //商品类型
    private Integer goodType;
    //商品类型名
    private String goodTypeName;
    //采购价格
    private int purchasePrice;
    //销售价格
    private int salePrice;
    //建议零售价
    private int retailPrice;
    //产地
    private String originPlace;
    //计量单位
    private String unit;
    //库存
    private String acount;

    public String getGoodNo() {
        return goodNo;
    }

    public void setGoodNo(String goodNo) {
        this.goodNo = goodNo;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }

    public String getGoodSpecs() {
        return goodSpecs;
    }

    public void setGoodSpecs(String goodSpecs) {
        this.goodSpecs = goodSpecs;
    }

    public Integer getGoodType() {
        return goodType;
    }

    public void setGoodType(Integer goodType) {
        this.goodType = goodType;
    }

    public int getPurchasePrice() {
        return purchasePrice;
    }

    public void setPurchasePrice(int purchasePrice) {
        this.purchasePrice = purchasePrice;
    }

    public int getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(int salePrice) {
        this.salePrice = salePrice;
    }

    public int getRetailPrice() {
        return retailPrice;
    }

    public void setRetailPrice(int retailPrice) {
        this.retailPrice = retailPrice;
    }

    public String getOriginPlace() {
        return originPlace;
    }

    public void setOriginPlace(String originPlace) {
        this.originPlace = originPlace;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getGoodTypeName() {
        return goodTypeName;
    }

    public void setGoodTypeName(String goodTypeName) {
        this.goodTypeName = goodTypeName;
    }

    public String getAcount() {
        return acount;
    }

    public void setAcount(String acount) {
        this.acount = acount;
    }
}
