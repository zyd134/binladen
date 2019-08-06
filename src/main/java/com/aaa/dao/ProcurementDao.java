package com.aaa.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface ProcurementDao {
    @Select("select * from procurement p JOIN dictionary d on p.status=d.valueId")
    public List<Map> selectPro();

    @Select("select * from dictionary")
    public List<Map> selectDic();

    @Update("update procurement set status=#{status} where procurementNo=#{procurementNo}")
    public int examineById(@Param("status") Integer status, @Param("procurementNo") String procurementNo);

    @Select("select * from purchase_detail p JOIN goods g on p.goodNo=g.goodNo where procurementNo=#{procurementNo}")
    public List<Map> selectDet(String procurementNo);
}
