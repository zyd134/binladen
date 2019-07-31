package com.aaa.service;

import com.aaa.dao.SupplierDao;
import com.aaa.entity.Supplier;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SupplierServiceImpl implements SupplierService{
    @Resource
    private SupplierDao supplierDao;

    //获得供应商列表

    @Override
    public List<Supplier> getSupplierList(int currentPage,int pageSize) {
        return supplierDao.getSupplierList(currentPage, pageSize);
    }

    //获得供应商总数

    @Override
    public int getCountOfSupplier() {
        return supplierDao.getCountOfSupplier();
    }

    //删除供应商

    @Override
    public boolean deleteSupplierById(Integer id) {
        return supplierDao.deleteSupplierById(id);
    }

    //修改供应商

    @Override
    public boolean updateSupplier(Supplier supplier) {
        return supplierDao.updateSupplier(supplier);
    }

    //通过id查找供应商

    @Override
    public Supplier getSupplierById(Integer id) {
        return supplierDao.getSupplierById(id);
    }

    //添加供应商

    @Override
    public boolean addSupplier(Supplier supplier) {
        return supplierDao.addSupplier(supplier);
    }
}
