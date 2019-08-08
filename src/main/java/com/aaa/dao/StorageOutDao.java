package com.aaa.dao;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface StorageOutDao {

    @Select("select count(*) from storage_out_detail")
    public int getdepotInCount();

    @Insert("insert into storage_out_detail(outNo,outGoodNo,goodAmount) values(#{outNo},#{goodNo},#{goodAmount})")
    public int insertOutDe(@Param("outNo") String outNo, @Param("goodNo")String goodNo, @Param("goodAmount")int goodAmount);

    @Insert("insert into storage_out(outNo,outTime,outPerson) values(#{outNo},now(),#{salePerson})")
    public int insertOut(@Param("outNo") String outNo,@Param("salePerson")String salePerson);

    @Update("update goods set acount=acount-#{num} where goodNo=#{goodNo}")
    public void updateGoodsNum(@Param("goodNo")String goodNo,@Param("num")int num);
}
