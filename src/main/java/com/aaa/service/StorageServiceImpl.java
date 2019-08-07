package com.aaa.service;

import com.aaa.dao.StorageDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;





@Service
public class StorageServiceImpl implements StorageService {
    @Resource
    private StorageDao storageDao;
  
    @Override
    public List<Map> selectSto() {
        return storageDao.selectSto();
    }

    @Override
    public List<Map> selectStoGoods(String storageNo) {
        return storageDao.selectStoGoods(storageNo);
    }

    /**
     * 查出所有仓库
     * @return
     */
    @Override
    public List<Map> selectNo() {
        return storageDao.selectNo();
    }

    @Override
    public boolean insertSto(Map map) {

        //入库总表
        int num= storageDao.insertSto(map);
        //添加详情表
        List<Map> list= (List<Map>)map.get("goods");

        //
        int num2=storageDao.insertStoDetail(list);
        if(num>0 && num2>0){
            return  true;

        }
        return true;
    }
}
