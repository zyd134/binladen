package com.aaa.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface StorageDao {

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
}
