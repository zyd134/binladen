package com.aaa.dao;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface StorageDao {

    //查询仓库名
    @Select("select * from storage")
    public List<Map> selectSto();

    //查询盘点的商品信息

    @SelectProvider(type=SQLProvider.class,method = "select1")
    public List<Map> selectStoGoods(String storageNo);

    /**
     *
     * 查出所有仓库
     * @return
     */
    public List<Map> selectNo();

    /**
     * 入库总表
     * @param map
     * @return
     */
    public int insertSto(Map map);

    /**
     * 入库详细表
     * @param list
     * @return
     */
    public int insertStoDetail(List<Map> list);

    @Update("update storage_in_detail set goodAmount=#{size} where inNo=#{inNo}")
    public boolean updateGoodsAmount(@Param("inNo")String inNo,@Param("size")int size);

    @Insert("insert into storage_in_detail values(#{orderid},#{goodNo},#{size})")
    public boolean InsertInNo(@Param("orderid") String orderid, @Param("goodNo") String goodNo, @Param("size") int size);

    @Insert("insert into storage_in(inNo,inTime,inPerson,storageNo) values(#{orderid},now(),#{applyperson},#{storageNo})")
    public boolean InsertStorageNo(@Param("orderid")String orderid,@Param("applyperson")String applyperson,@Param("storageNo")String storageNo);

    public void updateGoods(Map map);
}
