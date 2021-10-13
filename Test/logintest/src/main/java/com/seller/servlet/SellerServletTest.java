package com.seller.servlet;

import org.easymock.EasyMock;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.Collection;

import static org.junit.Assert.*;

@RunWith(Parameterized.class)
public class SellerServletTest {
    private String index;
    private String sellername;
    private String sellerpwd;
    private int expected;
    private SellerServlet ss;

    @Before
    public void setUp() throws Exception{

    }

    @Parameterized.Parameters
    public static Collection prepareData() throws IOException{
        CSVdata_login c=new CSVdata_login();
        Object[][] objects=c.CSVRead();
        return Arrays.asList(objects);
    }

    public SellerServletTest(String index,String sellername,String sellerpwd){
        this.index=index;
        this.sellername=sellername;
        this.sellerpwd=sellerpwd;
        if(index.equals("4")){
            expected=1;
        }else{
            expected=0;
        }
        ss=new SellerServlet();
    }

    @Test
    public void login() throws IOException, ServletException {
        HttpServletRequest request=null;
        HttpServletResponse response=null;
        HttpSession session=null;
        request= EasyMock.createMock(HttpServletRequest.class);
        response=EasyMock.createMock(HttpServletResponse.class);
        session=EasyMock.createMock(HttpSession.class);
        EasyMock.expect(request.getParameter("sellername")).andReturn(sellername).once();
        EasyMock.expect(request.getParameter("sellerpwd")).andReturn(sellerpwd).once();
        request.setCharacterEncoding("utf-8");
        EasyMock.replay(request);
        assertEquals(expected,ss.login(request,response));
    }

}