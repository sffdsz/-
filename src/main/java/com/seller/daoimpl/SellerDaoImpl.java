package com.seller.daoimpl;

import com.seller.dao.SellerDao;
import com.seller.vo.Seller;

import java.sql.*;

public class SellerDaoImpl implements SellerDao {
    public static String url="jdbc:mysql://10.50.32.46:3306/shopingol?allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=UTC";
    public static String mysqluser="root";
    public static String mysqlpassword="wjt256634@";
    @Override
    public boolean checkSeller(Seller se) throws SQLException {//检查用户是否存在
        Connection con=null;
        ResultSet rs=null;
        PreparedStatement ps=null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con= DriverManager.getConnection(url,mysqluser,mysqlpassword);
            String sql="select * from seller where sellername=? and sellerpwd=?";
            ps=con.prepareStatement(sql);
            ps.setString(1,se.getSellername());
            ps.setString(2,se.getSellerpwd());
            rs=ps.executeQuery();
            if(rs.next())
                return true;
            else
                return false;
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }finally {
            if(con!=null){
                con.close();
            }
            if(rs!=null){
                rs.close();
            }
            if(ps!=null){
                ps.close();
            }
        }
        return false;
    }

    @Override
    public void changePwd(String sellername,String newpwd) throws SQLException, ClassNotFoundException {//修改密码
        Connection con=null;
        ResultSet rs=null;
        PreparedStatement ps=null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con= DriverManager.getConnection(url,mysqluser,mysqlpassword);
            String sql="update seller set sellerpwd=? where sellername=?";
            ps=con.prepareStatement(sql);
            ps.setString(1,newpwd);
            ps.setString(2,sellername);
            ps.execute();
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }finally {
            if(con!=null){
                con.close();
            }
            if(rs!=null){
                rs.close();
            }
            if(ps!=null){
                ps.close();
            }
        }
    }

    @Override
    public void transactionFreezeGood(int goodid, int userid) throws SQLException, ClassNotFoundException {
        Connection con=null;
        ResultSet rs=null;
        PreparedStatement ps=null;
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            con= DriverManager.getConnection(url,mysqluser,mysqlpassword);
            String sql="update transaction set ischosen = true where goodid = ? and userid = ?";
            ps=con.prepareStatement(sql);
            ps.setString(1,goodid+"");
            ps.setString(2,userid+"");
            ps.execute();
        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }finally {
            if(con!=null){
                con.close();
            }
            if(rs!=null){
                rs.close();
            }
            if(ps!=null){
                ps.close();
            }
        }
    }
}
