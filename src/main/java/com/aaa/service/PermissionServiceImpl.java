package com.aaa.service;

import com.aaa.dao.PermissionDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    private PermissionDao permissionDao;
    @Override
    public List<Map> selectPermission(Integer id) {
        return permissionDao.selectPermission(id);
    }
}
