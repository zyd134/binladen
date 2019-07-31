package com.aaa.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface PermissionDao {

    @Select("select p.* from permission p\n" +
            "join middle m on p.id=m.permissionId\n" +
            "join role r on r.id=m.roleId\n" +
            "join employees e on e.role=r.id\n" +
            "where e.id=#{id}")
    public List<Map> selectPermission(Integer id);
}
