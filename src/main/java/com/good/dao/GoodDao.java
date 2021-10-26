package com.good.dao;
/*
 * @author jChen
 * @detail: interface about good
 */
import com.good.vo.Good;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

public interface GoodDao {
    public ArrayList<Good> getGoods() throws SQLException, ClassNotFoundException;//获取在售商品
    public void releaseGood(String goodname, String price, String description,ArrayList<String> goodpicture, String wwhDes, String origin) throws SQLException, ClassNotFoundException;//发布商品
    public void offLoadGood(int goodid) throws SQLException, ClassNotFoundException;//下架商品
    public Map<Good,String> viewHisGood() throws SQLException, ClassNotFoundException;//查看历史商品
    public void freezeGood(int goodid) throws SQLException, ClassNotFoundException;//冻结商品
    public void goodBackOnline(int goodid) throws SQLException, ClassNotFoundException;//解冻商品
    public void transactionSuccess(int goodid) throws SQLException, ClassNotFoundException;//交易成功
}
