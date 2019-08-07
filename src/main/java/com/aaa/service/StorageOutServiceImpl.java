package com.aaa.service;

import com.aaa.dao.StorageOutDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class StorageOutServiceImpl implements StorageOutService {
    @Resource
    private StorageOutDao storageOutDao;
    @Override
    public int getdepotInCount() {
        return storageOutDao.getdepotInCount();
    }

    @Override
    public int insertOutDe(String outNo, String goodNo, int goodAmount,String salePerson) {
        int b=0;
        int c=0;
        int a=storageOutDao.insertOutDe(outNo,goodNo,goodAmount);
        if (a>0){
            c=storageOutDao.insertOut(outNo,salePerson);
        }
        if (c>0){
            b=1;
        }
        return b;
    }
}
