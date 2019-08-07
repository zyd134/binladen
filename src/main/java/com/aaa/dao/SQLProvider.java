package com.aaa.dao;

public class SQLProvider {


    public String select1(String storageNo){
        StringBuffer sql=new StringBuffer();
        sql.append("select * from   goods g " +
                " join storage_in_detail sid on sid.inGoodNo=g.goodNo  " +
                " join storage_in si on sid.inNo=si.inNo  " +
                " join storage s on si.storageNo=s.storageNo  " +
                "where 1=1 ");
        if (storageNo!=null && (!storageNo.equals(""))){
            sql.append(" and  s.storageNo = #{storageNo}");
        }
        System.out.println("=============="+sql);
        return sql.toString();
    }
}
