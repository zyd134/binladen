package com.aaa.entity;

/**
 * 商品类型表
 */
public class GoodType {
    private Integer id;
    //类型名
    private String typeName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
}
