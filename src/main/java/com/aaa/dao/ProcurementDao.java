package com.aaa.dao;

import com.aaa.entity.Goods;
import com.aaa.entity.PurchaseReturn;
import com.aaa.entity.PurchaseReturnDetail;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface ProcurementDao {
    @Select("select * from procurement p JOIN pro_dictionary d on p.status=d.valueId")
    public List<Map> selectPro();

    @Select("select * from pro_dictionary")
    public List<Map> selectDic();

    @Update("update procurement set status=#{status} where procurementNo=#{procurementNo}")
    public int examineById(@Param("status") Integer status, @Param("procurementNo") String procurementNo);

    @Select("select * from purchase_detail p JOIN goods g on p.goodNo=g.goodNo where procurementNo=#{procurementNo}")
    public List<Map> selectDet(String procurementNo);


    /**
     * 采购退货方法
     */
    //根据客户编号获得客户已买商品
    @Select("select *,SUM(goodAmount) as totalAmount from (select g.*,gt.typeName as goodTypeName,p.procurementNo,pd.goodAmount from goods g \n" +
            "\t\t\t\t\t\tjoin procurement p\n" +
            "            join purchase_detail pd \n" +
            "            join goodtype gt \n" +
            "            on p.procurementNo = pd.procurementNo and pd.goodNo = g.goodNo and p.supplier = #{supplierNo}\n" +
            "\t\t\t\t\t\tGROUP BY p.procurementNo,g.goodNo) as goodform GROUP BY goodNo")
    public List<Goods> getGoodListBySupplierNo(String supplierNo);

    //添加采购退货订单
    @Insert("insert into pur_return(returnNo,returnDay,operator,handlePerson,supplier,returnPrice)values(#{returnNo},#{returnDay},#{operator},#{handlePerson},#{supplier},#{returnPrice})")
    public boolean addPurReturnOrder(PurchaseReturn pr);

    //添加采购退货订单明细
    @Insert("insert into pur_return_detail(purReturnNo,goodNo,goodAmount)values(#{purReturnNo},#{goodNo},#{goodAmount})")
    public boolean addPurReturnOrderDetail(PurchaseReturnDetail prd);
}
