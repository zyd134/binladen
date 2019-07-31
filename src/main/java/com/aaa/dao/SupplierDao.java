package com.aaa.dao;

import com.aaa.entity.Supplier;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface SupplierDao {
    //获得供应商列表
    @Select("select * from supplier LIMIT #{currentPage},#{pageSize}")
    public List<Supplier> getSupplierList(@Param("currentPage") int currentPage, @Param("pageSize") int pageSize);

    //获得供应商总数
    @Select("select count(id) from supplier")
    public int getCountOfSupplier();

    //删除供应商
    @Delete("delete from supplier where id =#{id}")
    public boolean deleteSupplierById(Integer id);

    //修改供应商
    @Update("update supplier set supplierName=#{supplierName},contacts=#{contacts},tel=#{tel}," +
            "email=#{email},address=#{address},bank=#{bank},bankAccount=#{bankAccount}" +
            "where id = #{id}")
    public boolean updateSupplier(Supplier supplier);

    //通过id查找供应商
    @Select("select * from supplier where id = #{id}")
    public Supplier getSupplierById(Integer id);

    //添加供应商
    @Insert("insert into supplier(supplierNo,supplierName,contacts,tel,email,address,bank,bankAccount) values(#{supplierNo},#{supplierName},#{contacts},#{tel},#{email},#{address},#{bank},#{bankAccount})")
    public boolean addSupplier(Supplier supplier);
}
