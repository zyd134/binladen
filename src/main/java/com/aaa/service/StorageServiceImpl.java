package com.aaa.service;

import com.aaa.dao.StorageDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service
public class StorageServiceImpl implements StorageService {
    @Resource
    private StorageDao storageDao;
    @Override
    public List<Map> selectSto() {
        return storageDao.selectSto();
    }

    @Override
    public List<Map> selectStoGoods(String storageNo) {
        return storageDao.selectStoGoods(storageNo);
    }
}
