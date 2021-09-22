package dao;

import vo.Seller;

import java.sql.SQLException;

public interface SellerDao {
    public boolean checkSeller(Seller se) throws SQLException, ClassNotFoundException;
    public void changePwd(String sellername,String newpwd) throws SQLException, ClassNotFoundException;
}
