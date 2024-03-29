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
            @Result(property = "salePersonName",column = "salePerson",
                    one = @One(select = "com.aaa.dao.SaleDao.getEmpNameByNo")),
            @Result(property = "customerName",column = "customer",
                    one = @One(select = "com.aaa.dao.SaleDao.getCustomerNameByNo")),
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
    @Select("select *,SUM(goodAmount) as totalAmount from (select g.*,gt.typeName as goodTypeName,s.saleNo,sd.goodAmount from goods g \n" +
            "\t\t\t\t\t\tjoin sale s\n" +
            "            join sale_detail sd \n" +
            "            join goodtype gt \n" +
            "            on s.saleNo = sd.saleNo and sd.goodNo = g.goodNo and s.customer = #{customerNo}\n" +
            "\t\t\t\t\t\tGROUP BY s.saleNo,g.goodNo) as goodform GROUP BY goodNo")
    public List<Goods> getGoodListByCustomerNo(String customerNo);

    @Select("select name from employees where empNo=#{empNo} ")
    public String getEmpNameByNo(String empNo);

    @Select("select customerName from customer where customerNo=#{customerNo}")
    public String getCustomerNameByNo(String customerNo);


    /**
     * 下面是销售退货的方法
     */

    //添加销售退货单
    @Insert("insert into sale_return(returnNo,returnDay,operator,customer,returnPrice) values(#{returnNo},#{returnDay},#{operator},#{customer},#{returnPrice})")
    public boolean addSaleReturnOrder(SaleReturn saleReturn);

    //添加销售退货订单明细
    @Insert("insert into sale_return_detail(saleReturnNo,goodNo,goodAmount) values(#{saleReturnNo},#{goodNo},#{goodAmount})")
    public boolean addSaleReturnOrderDetail(SaleReturnDetail saleReturnDetail);


    /**
     * 审核方法
     * @return
     */

    //查询采购订单
    @Select(
            "select * from sale where status = 1 LIMIT #{currentPage},#{pageSize}"
    )
    @Results({
            @Result(property = "saleNo",column = "saleNo"),
            @Result(property = "statusName",column = "status",
                    one = @One(select = "com.aaa.dao.SaleDao.getStatusNameByStatus")),
            @Result(property = "salePersonName",column = "salePerson",
                    one = @One(select = "com.aaa.dao.SaleDao.getEmpNameByNo")),
            @Result(property = "customerName",column = "customer",
                    one = @One(select = "com.aaa.dao.SaleDao.getCustomerNameByNo")),
            @Result(property = "saleDetailList", column = "saleNo",
                    many = @Many(select = "com.aaa.dao.SaleDao.getSaleDetailListBySaleNo"))
    })
    public List<Sale> getNotPassSaleList(@Param("currentPage") int currentPage, @Param("pageSize") int pageSize);


    //获得未通过订单总数
    @Select("select count(*) from sale where status=1")
    public int getCountOfNotPassSale();
}
