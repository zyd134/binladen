package com.aaa.service;

import com.aaa.entity.GoodType;
import com.aaa.entity.Goods;

import java.util.List;
import java.util.Map;

public interface GoodsService {
    public List<Map> queryGoods();

    public List<Goods> getGoodList(int currentPage,int pageSize);

    public int getCountOfGood();

    public boolean delGoodsByGoodNo(String goodNo);

    public boolean updGoods(Goods goods);

    public Goods getGoodByNo(String goodNo);

    public List<GoodType> getGoodTypeList();

    public boolean addGood(Goods goods);
}
