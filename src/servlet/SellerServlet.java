package servlet;

import dao.SellerDao;
import daoimpl.SellerDaoImpl;
import vo.Good;
import vo.Seller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class SellerServlet
 */
public class SellerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SellerServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method=request.getParameter("method");
        if(method.equals("login")){
            login(request,response);
        }else if(method.equals("changePwd")){
            changePwd(request,response);
        }else if(method.equals("viewHisGoods")){
            viewHisGoods(request,response);
        }else if(method.equals("releaseGood")){
            releaseGood(request,response);
        }else if(method.equals("freezeGood")){
            freezeGood(request,response);
        }else if(method.equals("transaction")){
            transaction(request,response);
        }else if(method.equals("goodBackOnline")){
            goodBackOnline(request,response);
        }else if(method.equals("transactionSuccess")){
            transactionSuccess(request,response);
        }else if(method.equals("viewBuyerInfo")){
            viewBuyerInfo(request,response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sellername=request.getParameter("sellername");
        String sellerpwd=request.getParameter("sellerpwd");
        Seller se=new Seller(sellername,sellerpwd);
        SellerDao sd=new SellerDaoImpl();
        boolean flag=false;
        try {
            flag=sd.checkSeller(se);
            if(flag==true){
                request.setAttribute("sellername", sellername);
                HttpSession s=request.getSession();
                s.setAttribute("Seller", se);
                request.getRequestDispatcher("success.jsp").forward(request, response);
            }
            else
                request.getRequestDispatcher("fail.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    protected void changePwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession hs=request.getSession();
        Seller se=(Seller) hs.getAttribute("Seller");
        String sellname=se.getSellername();
        String oldpwd=request.getParameter("oldpwd");
        String newpwd=request.getParameter("newpwd");
        if(oldpwd.equals(se.getSellerpwd())){
            SellerDao sd=new SellerDaoImpl();
            try {
                sd.changePwd(sellname,newpwd);
                request.getRequestDispatcher("").forward(request,response);
            } catch (SQLException | ClassNotFoundException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }else{
            //原密码错误
            request.getRequestDispatcher("").forward(request,response);
        }
        //得到数据
        //进行判断
        //构造一个seller
        //存在则修改
        //不存在则失败
    }

    protected void viewHisGoods(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Good> glist=null;
        GoodDao gd=new GoodDaoImpl();
        glist=gd.viewHisGoods();
        HttpSession hs=request.getSession();
        hs.setAttribute("hisgoodlist",glist);
        request.getRequestDispatcher("........").forward(request,response);
    }

    protected void releaseGood(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String goodname=request.getParameter("goodname");
        String description=request.getParameter("description");
        String goodid="";//随机//
        Good g=new Good(goodid,goodname,description);
        GoodDao gd=new GoodDaoImpl();
        gd.releaseGood(g);
        request.getRequestDispatcher("........").forward(request,response);
        //跳转
    }

    protected void freezeGood(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //得到商品属性
        //冻结商品
        //跳回卖家界面
        GoodDao gd=new GoodDaoImpl();
        gd.freezeGood();
        request.getRequestDispatcher("........").forward(request,response);
    }//主动冻结

    protected void transaction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //得到商品属性
        //冻结商品
        //跳回交易界面
        GoodDao gd=new GoodDaoImpl();
        gd.freezeGood();
        request.getRequestDispatcher("........").forward(request,response);
    }//交易冻结
    protected void goodBackOnline(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //得到商品属性
        GoodDao gd=new GoodDaoImpl();
        gd.goodBackOnline();
        request.getRequestDispatcher("........").forward(request,response);
    }
    protected void transactionSuccess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //得到商品属性
        GoodDao gd=new GoodDaoImpl();
        gd.transactionSuccess();
        request.getRequestDispatcher("........").forward(request,response);
    }
    protected void viewBuyerInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //得到意向购买goodid的userid
        //根据userid去user库中查找得到
        String goodid=request.getAttribute("goodid");
        UserDao ud=new UserDaoImpl();
        ArrayList<user> ulist=null;
        ArrayList<String> useridlist=ud.getBuyerid(goodid);
        Iterator<String> useriditer=useridlist.iterator();
        User u=null;
        String userid="";
        while(useriditer.hasNext()){
            userid=useriditer.next();//得到一位意向购买人的id
            try {
                u=ud.getBuyer(userid);
                ulist.add(u);
            } catch (SQLException | ClassNotFoundException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        HttpSession hs=request.getSession();
        hs.setAttribute("userlist",ulist);
        request.getRequestDispatcher("").forward(request,response);
    }
}
