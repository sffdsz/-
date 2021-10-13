package com.seller.servlet;

import au.com.bytecode.opencsv.CSVReader;

import java.io.FileReader;
import java.io.IOException;

public class CSVdata_login {
    private static String FILE_PATH="D:\\Project\\week05\\Test\\login_case.csv";
    public Object[][] CSVRead() throws IOException {
        CSVReader reader = new CSVReader(new FileReader(FILE_PATH));
        String [] nextLine;
        Object[][] obj=new Object[4][3];
        int count=0;
        reader.readNext();
        while ((nextLine = reader.readNext()) != null) {
            obj[count][0]=nextLine[0];
            obj[count][1]=nextLine[1];
            obj[count][2]=nextLine[2];
            count++;
        }
        reader.close();
        return obj;
    }
}
