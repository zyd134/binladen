package com.aaa.service;

import com.aaa.entity.Supplier;

import java.util.List;

public interface SupplierService {

    public List<Supplier> getSupplierList(int currentPage, int pageSize);

    public int getCountOfSupplier();

    public boolean deleteSupplierById(Integer id);

    public boolean updateSupplier(Supplier supplier);

    public Supplier getSupplierById(Integer id);

    public boolean addSupplier(Supplier supplier);
}
