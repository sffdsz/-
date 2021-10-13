package com.user.userServlet;

import com.good.vo.Good;
import com.user.daoimpl.UserDaoimpl;
import com.user.bean.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "UserServlet",urlPatterns = "/UserServlet")
public class UserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out=response.getWriter();

        UserDaoimpl userDaoimpl=new UserDaoimpl();
        String username=request.getParameter("username");
        String userphone=request.getParameter("userphone");
        String transactionaddress=request.getParameter("transactionaddress");

        int goodId = ((Good)session.getAttribute("good")).getGoodId();
        try {
            fillInInfo(username,userphone,transactionaddress,goodId);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        response.sendRedirect("home1.jsp");
    }

    public void fillInInfo(String username ,String userphone,String transactionaddress,int goodId) throws SQLException {
        UserDaoimpl userDaoimpl=new UserDaoimpl();
        User u=new User();
        u.setUsername(username);
        u.setUserphone(userphone);
        u.setTransactionaddress(transactionaddress);
        userDaoimpl.insertUser(u);
        userDaoimpl.insertTransaction(goodId,new UserDaoimpl().findUserId());
    }

}
