package com.aaa.dao;

import com.aaa.entity.Employees;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface EmployeesDao {

    @Select("select * from employees where tel=#{tel} and password=#{password}")
    public Employees login(Employees employees);
//,sex,idCard,role,tel,email,address,nativePlace,national,educationBg,school,bank,bankAccount
    //,#{sex},#{idCard},#{role},#{tel},#{email},#{address},#{nativePlace},#{national}),#{educationBg},#{school},#{bank},#{bankAccount}
    @Insert("insert into employees(empNo,name,password,sex,idCard,role,tel,email,address,nativePlace,national,educationBg,school,bank,bankAccount) values (#{empNo},#{name},#{password},#{sex},#{idCard},#{role},#{tel},#{email},#{address},#{nativePlace},#{national},#{educationBg},#{school},#{bank},#{bankAccount})")
    public int register(Employees employees);

    @Select("select * from employees e LEFT JOIN role r on e.role=r.id")
    public List<Map> selectEmp();
//,name=#{name},password=#{password},sex=#{sex},idCard=#{idCard},role=#{role},tel=#{tel},email=#{email},address=#{address},nativePlace=#{nativePlace},national=#{national},educationBg=#{educationBg},school=#{school},bank=#{bank},bankAccount=#{bankAccount}
    @Update("update employees set empNo=#{empNo},name=#{name},password=#{password},sex=#{sex},idCard=#{idCard},role=#{role},tel=#{tel},email=#{email},address=#{address},nativePlace=#{nativePlace},national=#{national},educationBg=#{educationBg},school=#{school},bank=#{bank},bankAccount=#{bankAccount} where id=#{id}")
    public int updateEmpById(Employees employees);

    @Select("select * from employees where role=#{role}")
    public List<Map> selectEmpByRole(Integer role);

    @Select("select count(*) from employees")
    public int getEmpNo();

}
