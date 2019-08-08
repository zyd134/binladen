package com.aaa.service;

import com.aaa.entity.*;

import java.util.List;

public interface SaleService {
    //查询销售订单
    public List<Sale> getSaleListByStatus(int status,String empNo);

    //通过订单编号查询订单明细
    public List<SaleDetail> getSaleDetailListBySaleNo(String saleNo);

    //查询订单状态
    public String getStatusNameByStatus(int status);

    public boolean updSaleStatusByNo(int status,String saleNo);

    //添加销售订单
    public boolean addSale(Sale sale);

    //添加销售订单明细
    public boolean addSaleDetail(SaleDetail saleDetail);

    //根据客户编号获得客户已买商品
    public List<Goods> getGoodListByCustomerNo(String customerNo);


    //添加销售退货单
    public boolean addSaleReturnOrder(SaleReturn saleReturn);

    //添加销售退货订单明细
    public boolean addSaleReturnOrderDetail(SaleReturnDetail saleReturnDetail);

    public int getCountOfNotPassSale();

    //查询采购订单
    public List<Sale> getNotPassSaleList(int currentPage,int pageSize);
}
