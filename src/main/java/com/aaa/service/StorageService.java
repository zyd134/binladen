package com.aaa.service;

import java.util.List;
import java.util.Map;

public interface StorageService {
    public List<Map> selectSto();

    public List<Map> selectStoGoods(String storageNo);
}
