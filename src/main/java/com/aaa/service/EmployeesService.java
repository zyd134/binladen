package com.aaa.service;

import com.aaa.entity.Employees;

import java.util.List;
import java.util.Map;

public interface EmployeesService {

    public Employees login(Employees employees);

    public int register(Employees employees);

    public List<Map> selectEmp();

    public int updateEmpById(Employees employees);

    public List<Map> selectEmpByRole(Integer role);

}
