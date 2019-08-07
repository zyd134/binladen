package com.aaa.service;

import com.aaa.dao.ProcurementDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProcurementServiceImpl implements ProcurementService {
    @Autowired
    private ProcurementDao procurementDao;
    @Override
    public List<Map> selectPro() {
        return procurementDao.selectPro();
    }

    @Override
    public int examineById(Integer status,String procurementNo) {
        return procurementDao.examineById(status,procurementNo);
    }

    @Override
    public List<Map> selectDic() {
        return procurementDao.selectDic();
    }

    @Override
    public List<Map> selectDet(String procurementNo) {
        return procurementDao.selectDet(procurementNo);
    }
}
