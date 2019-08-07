package com.aaa.service;

import com.aaa.dao.PurchaseDao;
import com.aaa.entity.Procurement;
import com.aaa.entity.PurchaseDetail;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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

    //查询采购订单
    @Override
    public List<Procurement> getProListByStatus(int status,String empNo) {
        return purchaseDao.getProListByStatus(status,empNo);
    }

    //通过订单编号查询订单明细
    @Override
    public List<PurchaseDetail> getPurchaseListByPno(String pNo) {
        return purchaseDao.getPurchaseListByPno(pNo);
    }
}
