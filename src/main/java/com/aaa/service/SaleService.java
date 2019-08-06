package com.aaa.service;

import com.aaa.entity.Sale;
import com.aaa.entity.SaleDetail;

import java.util.List;

public interface SaleService {
    //查询采购订单
    public List<Sale> getSaleListByStatus(int status,String empNo);

    //通过订单编号查询订单明细
    public List<SaleDetail> getSaleDetailListBySaleNo(String saleNo);

    //查询订单状态
    public String getStatusNameByStatus(int status);

    public boolean updSaleStatusByNo(int status,String saleNo);

    //添加采购订单
    public boolean addSale(Sale sale);

    //添加采购订单明细
    public boolean addSaleDetail(SaleDetail saleDetail);
}
