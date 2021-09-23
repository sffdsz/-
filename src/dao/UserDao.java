package dao;

import bean.User;

import java.sql.SQLException;

public interface UserDao {
    public User checkUser(User u)throws SQLException;
    public void insertUser(User u) throws SQLException;
}
