package com.user.daoimpl;

import com.user.dao.UserDao;
import com.user.bean.User;

import java.sql.*;
import java.util.ArrayList;

public class UserDaoimpl implements UserDao {
    private static  final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static  final String USER ="root";
    private static  final String PASSWORD ="cj123456";
    private static  final String URL ="jdbc:mysql://localhost:3306/shopingol?allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=UTC";
    static {
        try {
            Class.forName(DRIVER);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    private Connection getConn() {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return conn;
    }
    @Override
    public User checkUser(User u) throws SQLException {
        return null;
    }

    @Override
    public void insertTransaction(int goodId, int userId) {
        Connection conn = null;
        ResultSet rs = null;
        Statement sql=null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            sql=conn.createStatement();
            int ok=sql.executeUpdate("insert into transaction values ('"+goodId+"','"+userId+"',"+false+")");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public void insertUser(User u) throws SQLException {
        Connection conn = null;
        ResultSet rs = null;
        Statement sql=null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            sql=conn.createStatement();
            int ok=sql.executeUpdate("insert into user(username,userphone,transactionaddress ) values ('"+u.getUsername()+"','"+u.getUserphone()+"','"+u.getTransactionaddress()+"')");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public User getBuyer(int userid) throws SQLException {
        User u=null;
        Connection conn = getConn();
        String sql = "select userid,username,userphone,transactionaddress from user where userid='"+userid+"' ";
        Statement sqls=conn.createStatement();
        ResultSet rs=sqls.executeQuery(sql);
        if(rs.next()){
        u=new User();
        u.setUserid(Integer.parseInt(rs.getString(1)));
        u.setUsername(rs.getString(2));
        u.setUserphone(rs.getString(3));
        u.setTransactionaddress(rs.getString(4));
        }
        return u;
    }

    @Override
    public int findUserId() throws SQLException {
        Connection conn = null;
        ResultSet rs = null;
        Statement sql=null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            sql=conn.createStatement();
            rs=sql.executeQuery("select userid from user order by userid desc limit 1");
        } catch (Exception e) {
            System.out.println(e);
        }
        assert rs != null;
        if(rs.next()) return rs.getInt("userid");
        return 0;
    }

    public ArrayList<Integer> getBuyerid(int googid) throws SQLException{
        ArrayList<Integer> list =new ArrayList<>() ;
        Connection conn = getConn();
        Statement sql=conn.createStatement();
        ResultSet rs=sql.executeQuery("select userid from transaction where goodid = '"+googid+"'");
        while (rs.next()) {
                list.add(rs.getInt("userid"));
            }
        return list;
    }
}
