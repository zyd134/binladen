package com.aaa.dao;

import com.aaa.entity.GoodType;
import com.aaa.entity.Goods;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface GoodsDao {
    @Select("select * from goods join goodtype on goods.goodType=goodtype.id")
    public List<Map> queryGoods();

    //获得商品列表
    @Select("select g.*,gt.typeName goodtypeName from goods g\n" +
            "join goodtype gt on g.goodType=gt.id\n" +
            "LIMIT #{currentPage},#{pageSize}" )
    public List<Goods> getGoodList(@Param("currentPage") int currentPage, @Param("pageSize") int pageSize);

    //获得商品总数
    @Select("select count(goodNo) from goods")
    public int getCountOfGood();

    //删除商品
    @Delete("delete from goods where goodNo = #{goodNo}")
    public boolean delGoodsByGoodNo(String goodNo);

    //修改商品
    @Update("update goods set goodName=#{goodName},goodSpecs=#{goodSpecs},goodType=#{goodType}," +
            "purchasePrice=#{purchasePrice},salePrice=#{salePrice},retailPrice=#{retailPrice},originPlace=#{originPlace}," +
            "unit=#{unit} where goodNo = #{goodNo}")
    public boolean updGoods(Goods goods);

    //通过id获得商品
    @Select("select * from goods where goodNo = #{goodNo}")
    public Goods getGoodByNo(String goodNo);

    //获得商品类型集合
    @Select("select * from goodtype")
    public List<GoodType> getGoodTypeList();

    //添加商品
    @Insert("insert into goods(goodNo,goodName,goodSpecs,goodType,purchasePrice,salePrice,retailPrice,originPlace,unit)" +
            "values(#{goodNo},#{goodName},#{goodSpecs},#{goodType},#{purchasePrice},#{salePrice},#{retailPrice},#{originPlace},#{unit})")
    public boolean addGood(Goods goods);
}
