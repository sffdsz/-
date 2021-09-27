package com.seller.dao;

import com.seller.vo.Seller;

import java.sql.SQLException;

public interface SellerDao {
    public boolean checkSeller(Seller se) throws SQLException, ClassNotFoundException;
    public void changePwd(String sellername,String newpwd) throws SQLException, ClassNotFoundException;
    public void transactionFreezeGood(int goodid,int userid) throws SQLException, ClassNotFoundException;
}
