package com.aaa.service;

import com.aaa.entity.Procurement;
import com.aaa.entity.PurchaseDetail;

import java.util.List;

public interface PurchaseService {
    public boolean addProcurement(Procurement procurement);

    public boolean addPurDetail(PurchaseDetail purchaseDetail);

    public List<Procurement> getProListByStatus(int status);

    public List<PurchaseDetail> getPurchaseListByPno(String pNo);
}
