package com.aaa.dao;

import com.aaa.entity.Procurement;
import com.aaa.entity.PurchaseDetail;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
@Mapper
@Repository
public interface PurchaseDao {
    //添加采购订单
    @Insert("insert into procurement(procurementNo,purchaseTime,purchaser,purchasePrice)values(#{procurementNo},#{purchaseTime},#{purchaser},#{purchasePrice})")
    public boolean addProcurement(Procurement procurement);

    //添加采购订单明细
    @Insert("insert into purchase_detail(procurementNo,goodNo,goodAmount,totalPrice)values(#{procurementNo},#{goodNo},#{goodAmount},#{totalPrice})")
    public boolean addPurDetail(PurchaseDetail purchaseDetail);
}