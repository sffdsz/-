package com.good.servlet;

import com.good.dao.GoodDao;
import com.good.dao.GoodImpl;
import com.good.vo.Good;

import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "GoodServlet", value = "/GoodServlet")
public class GoodServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        GoodDao gd = new GoodImpl();
        try {
            List<Good> gls = gd.getGoods();
            Good good = gls.get(0);
            List<String> pictures = good.getPictures();
            HttpSession hs = req.getSession();
            hs.setAttribute("pictures",pictures);
            hs.setAttribute("good", good);
            hs.setAttribute("gls",gls);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        resp.sendRedirect("home1.jsp");
    }
}
