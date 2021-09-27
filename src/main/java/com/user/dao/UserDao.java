package com.user.dao;

import com.user.bean.User;

import java.sql.SQLException;
import java.util.ArrayList;

public interface UserDao {
    public User checkUser(User u)throws SQLException;
    public void insertTransaction(int goodId, int userId);
    public void insertUser(User u) throws SQLException;
    public User getBuyer(int userid) throws SQLException;
    public int findUserId() throws SQLException;
    public ArrayList<Integer> getBuyerid(int googid) throws SQLException;
}
