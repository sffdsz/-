package userServlet;

import daoimpl.UserDaoimpl;
import bean.User;

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
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out=response.getWriter();


        String username=request.getParameter("username");
        String userphone=request.getParameter("userphone");
        String transactionaddress=request.getParameter("transactionaddress");
        try {
            fillInInfo(username,userphone,transactionaddress);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        out.println("success");
    }

    public void fillInInfo(String username ,String userphone,String transactionaddress) throws SQLException {
        UserDaoimpl userDaoimpl=new UserDaoimpl();
        User u=new User();
        u.setUsername(username);
        u.setUserphone(userphone);
        u.setTransactionaddress(transactionaddress);
        userDaoimpl.insertUser(u);
    }

}
