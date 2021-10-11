package com.good.vo;
/*
 * @author jChen
 * @detail:商品类
 */
import java.util.ArrayList;

public class Good {
    private int goodId;//商品id
    private String goodName;//商品名
    private String price;//价格
    private String description;//商品描述
    private boolean freeze;//冻结状态
    private boolean isPurchased;//购买状态
    private boolean isOnline;//上架状态
    private String userid;//出售后购买人id，未出售为空
    private ArrayList<String> pictures;//商品图片路径列表
    private String wwhDes;//站长描述
    private String origin;//商品产地
    private int index;//商品索引
    //Constructor
    public Good() {
    }

    public Good(int goodId, String goodName, String price, String description, boolean freeze, boolean isPurchased, boolean isOnline, String userid, String wwhDes, String origin){
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

    //Getter and Setter
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
        this.price = price;
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

    public void setPictures(ArrayList<String> pictures) {
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

    public int getIndex() {
        return index;
    }

    public void setIndex(int index) {
        this.index = index;
    }
}
