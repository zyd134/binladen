package com.aaa.service;

import com.aaa.dao.EmployeesDao;
import com.aaa.entity.Employees;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class EmployeesServiceImpl implements EmployeesService {

    @Autowired
    private EmployeesDao employeesDao;
    @Override
    public Employees login(Employees employees) {
        return employeesDao.login(employees);
    }

    @Override
    public int register(Employees employees) {
        return employeesDao.register(employees);
    }

    @Override
    public List<Map> selectEmp() {
        return employeesDao.selectEmp();
    }

    @Override
    public int updateEmpById(Employees employees) {
        int a=employeesDao.updateEmpById(employees);
        System.out.println("7777"+employees.getName()+"444"+employees.getId()+"8888"+a);
        return a;
    }

    @Override
    public List<Map> selectEmpByRole(Integer role) {
        return employeesDao.selectEmpByRole(role);
    }

    @Override
    public int getEmpNo() {
        return employeesDao.getEmpNo();
    }

}
