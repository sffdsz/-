package com.seller.vo;

public class Seller {
    String sellername;
    String sellerpwd;

    public String getSellername() {
        return sellername;
    }

    public void setSellername(String sellername) {
        this.sellername = sellername;
    }

    public String getSellerpwd() {
        return sellerpwd;
    }

    public void setSellerpwd(String sellerpwd) {
        this.sellerpwd = sellerpwd;
    }

    public Seller(String sellername, String sellerpwd) {
        super();
        this.sellername = sellername;
        this.sellerpwd = sellerpwd;
    }
    public Seller() {
        super();
        // TODO Auto-generated constructor stub
    }
}
