package com.aaa.dao;

import com.aaa.entity.*;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface SaleDao {
    //查询采购订单
    @Select({"<script>",
            "select * from sale where status = #{status}" +
                    "<when test='empNo!=0'>",
                        " and salePerson = #{empNo}",
                    "</when>",
            "</script>"})
    @Results({
            @Result(property = "saleNo",column = "saleNo"),
            @Result(property = "statusName",column = "status",
                    one = @One(select = "com.aaa.dao.SaleDao.getStatusNameByStatus")),
            @Result(property = "saleDetailList", column = "saleNo",
                    many = @Many(select = "com.aaa.dao.SaleDao.getSaleDetailListBySaleNo"))
    })
    public List<Sale> getSaleListByStatus(@Param("status") int status,@Param("empNo") String empNo);

    //通过订单编号查询订单明细
    @Select("select * from sale_detail sd join goods g on sd.goodNo = g.goodNo where saleNo=#{saleNo}")
    public List<SaleDetail> getSaleDetailListBySaleNo(String saleNo);

    //查询订单状态
    @Select("select valueName from dictionary where valueId=#{status} and typeName='销售订单状态'")
    public String getStatusNameByStatus(int status);

    //更新订单状态
    @Update("update sale set status=#{status} where saleNo=#{saleNo}")
    public boolean updSaleStatusByNo(@Param("status") int status, @Param("saleNo") String saleNo);


    //添加销售订单
    @Insert("insert into sale(saleNo,saleTime,salePerson,applyDepartment,s_explain,salePrice,customer)values(#{saleNo},#{saleTime},#{salePerson},#{applyDepartment},#{s_explain},#{salePrice},#{customer})")
    public boolean addSale(Sale sale);

    //添加销售订单明细
    @Insert("insert into sale_detail(saleNo,goodNo,goodAmount,totalPrice)values(#{saleNo},#{goodNo},#{goodAmount},#{totalPrice})")
    public boolean addSaleDetail(SaleDetail saleDetail);

    //根据客户编号获得客户已买商品
    @Select("select g.* from goods g " +
            "join sale s " +
            "join sale_detail sd " +
            "on s.saleNo = sd.saleNo and sd.goodNo = g.goodNo and s.customer = #{customerNo}")
    public List<Goods> getGoodListByCustomerNo(String customerNo);


    /**
     * 下面是销售退货的方法
     */

    //添加销售退货单
    @Insert("insert into sale_return(returnNo,returnDay,operator,handlePerson,customer,returnPrice) values(#{returnNo},#{returnDay},#{operator},#{handlePerson},#{customer},#{returnPrice})")
    public boolean addSaleReturnOrder(SaleReturn saleReturn);

    //添加销售退货订单明细
    @Insert("insert into sale_return_detail(saleReturnNo,goodNo,goodAmount) values(#{saleReturnNo},#{goodNo},#{goodAmount})")
    public boolean addSaleReturnOrderDetail(SaleReturnDetail saleReturnDetail);
}
