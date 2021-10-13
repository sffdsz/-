package com.seller.servlet;

import org.easymock.EasyMock;
import org.junit.Test;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import static org.junit.Assert.*;

public class SellerServletTest {
    private int expected=1;
    private int goodid=1;
    private int userid=3;
    private SellerServlet ss=new SellerServlet();

    @Test
    public void transaction() throws IOException, ServletException {
        HttpServletRequest request=null;
        HttpServletResponse response=null;
        HttpSession session=null;
        request= EasyMock.createMock(HttpServletRequest.class);
        response=EasyMock.createMock(HttpServletResponse.class);
        session=EasyMock.createMock(HttpSession.class);
        EasyMock.expect(request.getParameter("goodid")).andReturn(goodid+"").once();
        EasyMock.expect(request.getParameter("userid")).andReturn(userid+"").once();
        request.setCharacterEncoding("utf-8");
        EasyMock.replay(request);
        assertEquals(expected,ss.transaction(request,response));
    }
}