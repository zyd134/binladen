package com.aaa.service;

import com.aaa.entity.Goods;
import com.aaa.entity.PurchaseReturn;
import com.aaa.entity.PurchaseReturnDetail;

import java.util.List;
import java.util.Map;

public interface ProcurementService {
    public List<Map> selectPro();
    public List<Map> selectDic();
    public List<Map> selectDet(String procurementNo);
    public int examineById(Integer status,String procurementNo);

    //添加采购退货订单
    public boolean addPurReturnOrder(PurchaseReturn pr);

    //添加采购退货订单明细
    public boolean addPurReturnOrderDetail(PurchaseReturnDetail prd);

    //根据客户编号获得客户已买商品
    public List<Goods> getGoodListBySupplierNo(String supplierNo);
}
