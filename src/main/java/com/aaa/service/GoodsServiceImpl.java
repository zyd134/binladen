package com.aaa.service;

import com.aaa.dao.GoodsDao;
import com.aaa.entity.GoodType;
import com.aaa.entity.Goods;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class GoodsServiceImpl implements GoodsService {

    @Resource
    private GoodsDao goodsDao;

    @Override
    public List<Map> queryGoods() {
        return goodsDao.queryGoods();
    }

    //获得商品列表

    @Override
    public List<Goods> getGoodList(int currentPage,int pageSize) {
        return goodsDao.getGoodList(currentPage,pageSize);
    }

    //获得商品总数

    @Override
    public int getCountOfGood() {
        return goodsDao.getCountOfGood();
    }

    @Override
    public boolean delGoodsByGoodNo(String goodNo) {
        return goodsDao.delGoodsByGoodNo(goodNo);
    }

    //修改商品

    @Override
    public boolean updGoods(Goods goods) {
        return goodsDao.updGoods(goods);
    }
    //通过商品编号获得商品
    @Override
    public Goods getGoodByNo(String goodNo) {
        return goodsDao.getGoodByNo(goodNo);
    }

    //获得商品类型集合

    @Override
    public List<GoodType> getGoodTypeList() {
        return goodsDao.getGoodTypeList();
    }

    //添加商品

    @Override
    public boolean addGood(Goods goods) {
        return goodsDao.addGood(goods);
    }
}
