package com.aaa.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface RepositoryDao {
    //为了生成一个入库单号
    @Select("select count(*) from storage_in_detail")
    public int getdepotInCount();
}
