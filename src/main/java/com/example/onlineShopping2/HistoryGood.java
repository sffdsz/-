package com.example.onlineShopping2;

public class HistoryGood {
    int gid;
    String gname;
    String url;

    public int getGid() {
        return gid;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public HistoryGood(String gname) {
        this.gname = gname;
    }

    public HistoryGood(int gid, String gname) {
        this.gid = gid;
        this.gname = gname;
    }

    public HistoryGood(int gid, String gname, String url) {
        this.gid = gid;
        this.gname = gname;
        this.url = url;
    }
}
