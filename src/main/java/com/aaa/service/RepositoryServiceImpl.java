package com.aaa.service;

import com.aaa.dao.RepositoryDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class RepositoryServiceImpl implements RepositoryService {
    @Resource
    private RepositoryDao repositoryDao;
    @Override
    public int getdepotInCount() {
        return repositoryDao.getdepotInCount();
    }
}
