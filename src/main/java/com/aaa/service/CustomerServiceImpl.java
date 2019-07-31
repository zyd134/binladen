package com.aaa.service;

import com.aaa.dao.CustomerDao;
import com.aaa.entity.Customer;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Resource
    private CustomerDao customerDao;

    @Override
    public List<Map> query() {
        return customerDao.query();
    }

    @Override
    public void addCust(Customer customer) {
       customerDao.addCust(customer);
    }

    @Override
    public void delCust(int id) {
        customerDao.delCust(id);
    }

    @Override
    public void updateCust(Customer customer) {
        customerDao.updateCust(customer);
    }
}
