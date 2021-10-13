package com.good.servlet;
/*
 * @author jChen
 * @detail: GoodServlet
 */
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
            List<Good> gls = gd.getGoods();//获取在售商品列表
            Good good = gls.get(0);//只有一个商品，取第一个商品
            List<String> pictures = good.getPictures();//取商品的图片路径
            //存入session
            HttpSession hs = req.getSession();
            hs.setAttribute("pictures",pictures);
            hs.setAttribute("good", good);
            hs.setAttribute("gls",gls);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        //跳转到商品页面
        resp.sendRedirect("home1.jsp");
    }
}
