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
    @Insert("insert into procurement(procurementNo,purchaseTime,purchaser,p_explain,applyDepartment,purchasePrice,supplier)values(#{procurementNo},#{purchaseTime},#{purchaser},#{p_explain},#{applyDepartment},#{purchasePrice},#{supplier})")
    public boolean addProcurement(Procurement procurement);

    //添加采购订单明细
    @Insert("insert into purchase_detail(procurementNo,goodNo,goodAmount,totalPrice)values(#{procurementNo},#{goodNo},#{goodAmount},#{totalPrice})")
    public boolean addPurDetail(PurchaseDetail purchaseDetail);

    //查询采购订单
    @Select({"<script>",
            "select * from procurement where status = #{status}" +
                    "<when test='empNo!=0'>",
                        " and purchaser = #{empNo}",
                    "</when>",
            "</script>"})
    @Results({
            @Result(property = "procurementNo",column = "procurementNo"),
            @Result(property = "statusName",column = "status",
                    one = @One(select = "com.aaa.dao.PurchaseDao.getStatusNameByStatus")),
            @Result(property = "purchaseDetailList", column = "procurementNo",
                    many = @Many(select = "com.aaa.dao.PurchaseDao.getPurchaseListByPno"))
    })
    public List<Procurement> getProListByStatus(@Param("status") int status,@Param("empNo") String empNo);

    //通过订单编号查询订单明细
    @Select("select * from purchase_detail pd join goods g on pd.goodNo = g.goodNo where procurementNo=#{pNo}")
    public List<PurchaseDetail> getPurchaseListByPno(String pNo);

    //查询订单状态
    @Select("select valueName from dictionary where valueId=#{status} and typeName='采购订单状态'")
    public String getStatusNameByStatus(int status);
}