package com.good.dao;

import com.good.vo.Good;

import java.sql.SQLException;
import java.util.ArrayList;

public interface GoodDao {
    public ArrayList<Good> getGoods() throws SQLException, ClassNotFoundException;
    public void releaseGood(String goodname, String price, String description,ArrayList<String> goodpicture, String wwhDes, String origin) throws SQLException, ClassNotFoundException;
    public void offLoadGood(int goodid) throws SQLException, ClassNotFoundException;
    public ArrayList<Good> viewHisGood() throws SQLException, ClassNotFoundException;
    public void freezeGood(int goodid) throws SQLException, ClassNotFoundException;
    public void goodBackOnline(int goodid) throws SQLException, ClassNotFoundException;
    public void transactionSuccess(int goodid) throws SQLException, ClassNotFoundException;
}
