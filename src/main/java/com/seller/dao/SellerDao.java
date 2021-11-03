package com.seller.dao;

import com.seller.vo.Seller;

import java.sql.SQLException;

public interface SellerDao {
    public boolean checkSeller(Seller se) throws SQLException, ClassNotFoundException;//检查用户是否存在
    public void changePwd(String sellername,String newpwd) throws SQLException, ClassNotFoundException;//修改密码
    public void transactionFreezeGood(int goodid,int userid) throws SQLException, ClassNotFoundException;//商品交易冻结商品
    public void cancelTransaction(int goodid,int userid) throws SQLException,ClassNotFoundException;//撤销交易
    public int findChosenUser(int goodid) throws SQLException,ClassNotFoundException;//找到卖家选择交易的用户
}
