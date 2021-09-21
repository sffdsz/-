package com.example.onlineShopping2;

public class Good {
    String g1;
    String g2;

    public String getG1() {
        return g1;
    }

    public void setG1(String g1) {
        this.g1 = g1;
    }

    public String getG2() {
        return g2;
    }

    public void setG2(String g2) {
        this.g2 = g2;
    }

    public Good(String g1, String g2) {
        this.g1 = g1;
        this.g2 = g2;
    }

    public Good(String g1) {
        this.g1 = g1;
    }
}
