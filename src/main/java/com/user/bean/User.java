package com.user.bean;

public class User {
    private int userid;
    private String username;
    private String userphone;
    private String transactionaddress;

    public User(int userid, String username, String userphone, String transactionaddress) {
        this.userid = userid;
        this.username = username;
        this.userphone = userphone;
        this.transactionaddress = transactionaddress;
    }

    public User() {
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserphone() {
        return userphone;
    }

    public void setUserphone(String userphone) {
        this.userphone = userphone;
    }

    public String getTransactionaddress() {
        return transactionaddress;
    }

    public void setTransactionaddress(String transactionaddress) {
        this.transactionaddress = transactionaddress;
    }

    @Override
    public String toString() {
        return "User{" +
                "userid='" + userid + '\'' +
                ", username='" + username + '\'' +
                ", userphone='" + userphone + '\'' +
                ", transactionaddress='" + transactionaddress + '\'' +
                '}';
    }
}
