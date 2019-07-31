package com.aaa.service;

import com.aaa.entity.Customer;

import java.util.List;
import java.util.Map;

public interface CustomerService {
    public List<Map> query();

    public void addCust(Customer customer);

    public void delCust(int id);

    public void updateCust(Customer customer);
}
