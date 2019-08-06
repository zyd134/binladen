package com.aaa.service;

import com.aaa.dao.SaleDao;
import com.aaa.entity.Sale;
import com.aaa.entity.SaleDetail;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SaleServiceImpl implements SaleService {

    @Resource
    private SaleDao saleDao;

    //查询采购订单
    @Override
    public List<Sale> getSaleListByStatus(int status) {
        return saleDao.getSaleListByStatus(status);
    }

    //通过订单编号查询订单明细
    @Override
    public List<SaleDetail> getSaleDetailListBySaleNo(String saleNo) {
        return saleDao.getSaleDetailListBySaleNo(saleNo);
    }

    //查询订单状态
    @Override
    public String getStatusNameByStatus(int status) {
        return saleDao.getStatusNameByStatus(status);
    }

    //通过no更新订单状态
    @Override
    public boolean updSaleStatusByNo(int status, String saleNo) {
        return saleDao.updSaleStatusByNo(status,saleNo);
    }

    //添加采购订单
    @Override
    public boolean addSale(Sale sale){
        return saleDao.addSale(sale);
    };

    //添加采购订单明细
    @Override
    public boolean addSaleDetail(SaleDetail saleDetail){
        return saleDao.addSaleDetail(saleDetail);
    };
}
