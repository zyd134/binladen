package com.aaa.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Repository
@Mapper
public interface StorageDao {
    //查询仓库名
    @Select("select * from storage")
    public List<Map> selectSto();

    //查询盘点的商品信息

    @SelectProvider(type=SQLProvider.class,method = "select1")
    public List<Map> selectStoGoods(String storageNo);
}
