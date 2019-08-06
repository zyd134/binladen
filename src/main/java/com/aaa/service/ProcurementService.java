package com.aaa.service;

import java.util.List;
import java.util.Map;

public interface ProcurementService {
    public List<Map> selectPro();
    public List<Map> selectDic();
    public List<Map> selectDet(String procurementNo);
    public int examineById(Integer status,String procurementNo);
}
