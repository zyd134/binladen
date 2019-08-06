package com.aaa.dao;

import com.aaa.entity.Procurement;
import com.aaa.entity.PurchaseDetail;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface PurchaseDao {
    //添加采购订单
    @Insert("insert into procurement(procurementNo,purchaseTime,purchaser,p_explain,purchasePrice)values(#{procurementNo},#{purchaseTime},#{purchaser},#{p_explain},#{purchasePrice})")
    public boolean addProcurement(Procurement procurement);

    //添加采购订单明细
    @Insert("insert into purchase_detail(procurementNo,goodNo,goodAmount,totalPrice)values(#{procurementNo},#{goodNo},#{goodAmount},#{totalPrice})")
    public boolean addPurDetail(PurchaseDetail purchaseDetail);

    //查询采购订单
    @Select("select * from procurement where status = #{status}")
    @Results({
            @Result(property = "procurementNo",column = "procurementNo"),
            @Result(property = "statusName",column = "status",
                    one = @One(select = "com.aaa.dao.PurchaseDao.getStatusNameByStatus")),
            @Result(property = "purchaseDetailList", column = "procurementNo",
                    many = @Many(select = "com.aaa.dao.PurchaseDao.getPurchaseListByPno"))
    })
    public List<Procurement> getProListByStatus(int status);

    //通过订单编号查询订单明细
    @Select("select * from purchase_detail pd join goods g on pd.goodNo = g.goodNo where procurementNo=#{pNo}")
    public List<PurchaseDetail> getPurchaseListByPno(String pNo);

    //查询订单状态
    @Select("select valueName from dictionary where valueId=#{status} and typeName='采购订单状态'")
    public String getStatusNameByStatus(int status);
}