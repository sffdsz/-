package com.example.onlineShopping2;

public class Custom {
    int uid;
    String name;
    String address;
    String prive;

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPrive() {
        return prive;
    }

    public void setPrive(String prive) {
        this.prive = prive;
    }

    public Custom(String name, String address, String prive) {
        this.name = name;
        this.address = address;
        this.prive = prive;
    }
}
