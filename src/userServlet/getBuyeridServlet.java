package userServlet;

import daoimpl.UserDaoimpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "getBuyerServlet",urlPatterns = "/getBuyerServlet")
public class getBuyeridServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        PrintWriter out=response.getWriter();
        int userid=Integer.parseInt(request.getParameter("chaxun"));
        UserDaoimpl userDaoimpl=new UserDaoimpl();
        try {
            userDaoimpl.getBuyerid(userid);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }
}
