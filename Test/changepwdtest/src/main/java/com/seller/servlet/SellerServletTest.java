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
    private String oldpwd;
    private String newpwd;
    private int expected;
    private SellerServlet ss;

    @Before
    public void setUp() throws Exception{

    }

    @Parameterized.Parameters
    public static Collection prepareData() throws IOException{
        CSVdata_changepwd c=new CSVdata_changepwd();
        Object[][] objects=c.CSVRead();
        return Arrays.asList(objects);
    }

    public SellerServletTest(String index,String oldpwd,String newpwd){
        this.index=index;
        this.oldpwd=oldpwd;
        this.newpwd=newpwd;
        expected=1;
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
        EasyMock.expect(request.getParameter("oldpwd")).andReturn(oldpwd).once();
        EasyMock.expect(request.getParameter("newpwd")).andReturn(newpwd).once();
        request.setCharacterEncoding("utf-8");
        EasyMock.replay(request);
        assertEquals(expected,ss.changePwd(request,response));
    }

}