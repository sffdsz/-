package com.good.test;

import com.good.dao.GoodDao;
import com.good.dao.GoodImpl;
import com.good.vo.Good;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

public class test {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        GoodDao gdl = new GoodImpl();
        ArrayList<String> gpls = new ArrayList<>();
        gpls.add("1");
        gpls.add("2");
        gdl.releaseGood("test","2.25",null,gpls,"","");
//        Iterator<Good> it = gls.iterator();
//        Good g = null;
//        while(it.hasNext()){
//            g = it.next();
//            System.out.println(g.getGoodId()+"-"+g.isFreeze());
//        }
    }
}
