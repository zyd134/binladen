package com.aaa.service;

import com.aaa.dao.ProcurementDao;
import com.aaa.entity.Goods;
import com.aaa.entity.PurchaseReturn;
import com.aaa.entity.PurchaseReturnDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProcurementServiceImpl implements ProcurementService {
    @Autowired
    private ProcurementDao procurementDao;
    @Override
    public List<Map> selectPro() {
        return procurementDao.selectPro();
    }

    @Override
    public int examineById(Integer status,String procurementNo) {
        return procurementDao.examineById(status,procurementNo);
    }

    @Override
    public List<Map> selectDic() {
        return procurementDao.selectDic();
    }

    @Override
    public List<Map> selectDet(String procurementNo) {
        return procurementDao.selectDet(procurementNo);
    }

    //根据客户编号获得客户已买商品
    @Override
    public List<Goods> getGoodListBySupplierNo(String supplierNo){
        return procurementDao.getGoodListBySupplierNo(supplierNo);
    };

    //添加采购退货订单

    @Override
    public boolean addPurReturnOrder(PurchaseReturn pr) {
        return procurementDao.addPurReturnOrder(pr);
    }

    //添加采购退货订单明细
    @Override
    public boolean addPurReturnOrderDetail(PurchaseReturnDetail prd) {
        return procurementDao.addPurReturnOrderDetail(prd);
    }
}
