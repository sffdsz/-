package com.good.vo;

import com.jdbc.Conn;

import java.sql.*;
import java.util.ArrayList;

public class Good {
    private int goodId;
    private String goodName;
    private String price;
    private String description;
    private boolean freeze;
    private boolean isPurchased;
    private boolean isOnline;
    private String userid;
    private ArrayList<String> pictures;
    private String wwhDes;
    private String origin;

    public Good() {
    }

    public Good(int goodId, String goodName, String price, String description, boolean freeze, boolean isPurchased, boolean isOnline, String userid, String wwhDes, String origin) throws SQLException, ClassNotFoundException {
        this.goodId = goodId;
        this.goodName = goodName;
        this.price = price;
        this.description = description;
        this.freeze = freeze;
        this.isPurchased = isPurchased;
        this.isOnline = isOnline;
        this.userid = userid;
        this.wwhDes = wwhDes;
        this.origin = origin;
    }

    public int getGoodId() {
        return goodId;
    }

    public void setGoodId(int goodId) {
        this.goodId = goodId;
    }

    public String getGoodName() {
        return goodName;
    }

    public void setGoodName(String goodName) {
        this.goodName = goodName;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isFreeze() {
        return freeze;
    }

    public void setFreeze(boolean freeze) {
        this.freeze = freeze;
    }

    public boolean isPurchased() {
        return isPurchased;
    }

    public void setPurchased(boolean purchased) {
        isPurchased = purchased;
    }

    public boolean isOnline() {
        return isOnline;
    }

    public void setOnline(boolean online) {
        isOnline = online;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public ArrayList<String> getPictures() {
        return pictures;
    }

    public void setPictures(ArrayList<String> pictures) throws SQLException, ClassNotFoundException {
        this.pictures = pictures;
    }

    public String getWwhDes() {
        return wwhDes;
    }

    public void setWwhDes(String wwhDes) {
        this.wwhDes = wwhDes;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }
}
