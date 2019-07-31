package com.aaa.service;

import com.aaa.entity.Procurement;
import com.aaa.entity.PurchaseDetail;

public interface PurchaseService {
    public boolean addProcurement(Procurement procurement);

    public boolean addPurDetail(PurchaseDetail purchaseDetail);
}
