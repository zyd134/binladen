package com.aaa.service;

import java.util.List;
import java.util.Map;

public interface StorageService {

    /**
     * 查出所有仓库
     * @return
     */
    public List<Map> selectNo();

    /**
     * 入库详细表
     * @param map
     * @return
     */
    public boolean insertSto(Map map);
}
