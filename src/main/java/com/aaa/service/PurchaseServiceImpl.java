package com.aaa.service;

import com.aaa.dao.PurchaseDao;
import com.aaa.entity.Procurement;
import com.aaa.entity.PurchaseDetail;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class PurchaseServiceImpl implements PurchaseService{
    @Resource
    private PurchaseDao purchaseDao;

    //添加采购订单
    @Override
    public boolean addProcurement(Procurement procurement) {
        return purchaseDao.addProcurement(procurement);
    }

    //添加采购明细
    @Override
    public boolean addPurDetail(PurchaseDetail purchaseDetail) {
        return purchaseDao.addPurDetail(purchaseDetail);
    }
}
