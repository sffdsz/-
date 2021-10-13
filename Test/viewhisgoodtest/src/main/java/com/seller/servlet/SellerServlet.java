package com.seller.servlet;

import com.good.dao.GoodDao;
import com.good.dao.GoodImpl;
import com.seller.dao.SellerDao;
import com.seller.daoimpl.SellerDaoImpl;
import com.user.bean.User;
import com.user.dao.UserDao;
import com.user.daoimpl.UserDaoimpl;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import com.good.vo.Good;
import com.seller.vo.Seller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class SellerServlet
 */
@WebServlet(name = "SellerServlet",value = "/SellerServlet")
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
            viewHisGood(request,response);
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
        request.setCharacterEncoding("utf-8");
        String sellername=request.getParameter("sellername");
        String sellerpwd=request.getParameter("sellerpwd");
        sellername=new String(sellername.getBytes("iso-8859-1"),"utf-8");
        sellerpwd=new String(sellerpwd.getBytes("iso-8859-1"),"utf-8");
        Seller se=new Seller(sellername,sellerpwd);
        SellerDao sd=new SellerDaoImpl();
        boolean flag=false;
        try {
            flag=sd.checkSeller(se);
            if(flag==true){
                request.setAttribute("sellername", sellername);
                HttpSession s=request.getSession();
                s.setAttribute("seller", se);
                request.getRequestDispatcher("./setting.jsp").forward(request, response);
            }
            else
                request.getRequestDispatcher("fail.jsp").forward(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void changePwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        HttpSession hs=request.getSession();
        Seller se=(Seller) hs.getAttribute("seller");
        String sellname=se.getSellername();
        String oldpwd=request.getParameter("oldpwd");
        String newpwd=request.getParameter("newpwd");
        oldpwd=new String(oldpwd.getBytes("iso-8859-1"),"utf-8");
        newpwd=new String(newpwd.getBytes("iso-8859-1"),"utf-8");
        if(oldpwd.equals(se.getSellerpwd())){
            SellerDao sd=new SellerDaoImpl();
            try {
                sd.changePwd(sellname,newpwd);
                se.setSellerpwd(newpwd);
                hs.setAttribute("seller",se);
                request.getRequestDispatcher("setting.jsp").forward(request,response);
            } catch (SQLException | ClassNotFoundException e) {
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

    protected int viewHisGood(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Good> glist=null;
        GoodDao gd=new GoodImpl();
        try {
            glist=gd.viewHisGood();
            return 1;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return 0;
    }

    protected void releaseGood(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String goodname=null;
            String goodprice=null;
            String description=null;
            String wwhDes=null;
            String origin=null;
            String formname=null;
            String formcontent=null;
            ArrayList<String> goodpicture=new ArrayList<>();
            String proPath=null;//当前项目目录
            String oFn=null;//文件名
            String ext=null;//扩展名
            String updir=null;//上传目录
            File fUpDir=null;//上传目录 文件类型
            String fnf=null;
            String fn=null;
            String df=null;
            DiskFileItemFactory factory=new DiskFileItemFactory();
            ServletFileUpload upload=new ServletFileUpload(factory);
            List<FileItem> items=upload.parseRequest(request);
            Iterator<FileItem> fiIter=items.iterator();
            FileItem fi=null;
            while(fiIter.hasNext()){
                fi=fiIter.next();
                if(fi.isFormField()){
                    formname=fi.getFieldName();
                    formcontent=fi.getString("utf-8");
                    if(formname.equals("goodname")){
                        goodname=formcontent;
                    }else if(formname.equals("description")){
                        description=formcontent;
                    }else if(formname.equals("goodprice")){
                        goodprice=formcontent;
                    }else if(formname.equals("wwhDes")){
                        wwhDes=formcontent;
                    }else if(formname.equals("origin")){
                        origin=formcontent;
                    }else if(formname.equals("path")){
                        proPath=formcontent+"\\src\\main\\webapp\\pictures";
                    }
                }else{
                    oFn=fi.getName();
                    ext=oFn.substring(oFn.lastIndexOf("."));
                    if(ext.equals(".png")||ext.equals(".jpg")){
                        df = proPath+"\\"+oFn.replace("/","\\");//文件存储在磁盘的路径
                        updir = df.substring(0,df.lastIndexOf("\\"));
                        fUpDir = new File(updir);
                        if(!fUpDir.exists()){
                            fUpDir.mkdirs();
                        }
                        try {
                            fi.write(new File(df));
                            goodpicture.add("pictures/"+oFn);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        System.out.println(df);
                    }else{//文件非图片

                    }
                }
            }
            //修改商品表
            GoodDao gd= new GoodImpl();
            gd.releaseGood(goodname,goodprice,description,goodpicture,wwhDes,origin);
            //修改商品图片表
            //gd.()
            request.getRequestDispatcher("setting.jsp").forward(request,response);
        } catch (FileUploadException | ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    protected void freezeGood(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //得到商品属性
        //冻结商品
        //跳回卖家界面
        int goodid=Integer.parseInt(request.getParameter("goodid"));
        GoodDao gd=new GoodImpl();
        try {
            gd.freezeGood(goodid);
            request.getRequestDispatcher("frozenGoods.jsp").forward(request,response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }//主动冻结

    protected void transaction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //得到商品属性
        //冻结商品
        //用户与商品绑定
        //跳回交易界面
        int goodid=Integer.parseInt(request.getParameter("goodid").toString());
        int userid=Integer.parseInt(request.getParameter("userid").toString());
        GoodDao gd=new GoodImpl();
        SellerDao sd=new SellerDaoImpl();
        try {
            gd.freezeGood(goodid);
            sd.transactionFreezeGood(goodid,userid);
            //用户与商品绑定
            request.getRequestDispatcher("........").forward(request,response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }//交易冻结

    protected void goodBackOnline(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //得到商品属性
        int goodid=Integer.parseInt(request.getParameter("goodid").toString());
        GoodDao gd=new GoodImpl();
        try {
            gd.goodBackOnline(goodid);
            List<Good> gls = gd.getGoods();
            HttpSession hs = request.getSession();
            hs.setAttribute("good",gls.get(0));
            hs.setAttribute("gls",gls);
            request.getRequestDispatcher("frozenGoods.jsp").forward(request,response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    protected void transactionSuccess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //得到商品属性
        int goodid=Integer.parseInt(request.getParameter("goodid").toString());
        GoodDao gd=new GoodImpl();
        try {
            gd.transactionSuccess(goodid);
            request.getRequestDispatcher("setting.jsp").forward(request,response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
    protected void viewBuyerInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //得到意向购买goodid的userid
        //根据userid去user库中查找得到
        HttpSession hs = request.getSession();
        int goodid= ((Good)hs.getAttribute("good")).getGoodId();
        UserDao ud=new UserDaoimpl();
        ArrayList<User> ulist= new ArrayList<>();
        ArrayList<Integer> useridlist= null;
        try {
            useridlist=ud.getBuyerid(goodid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        assert useridlist != null;
        Iterator<Integer> useriditer=useridlist.iterator();
        User u=null;
        int userid;
        while(useriditer.hasNext()){
            userid=useriditer.next();//得到一位意向购买人的id
            try {
                u=ud.getBuyer(userid);
                System.out.println(userid+"-"+u);
                assert false;
                ulist.add(u);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        request.setAttribute("userlist",ulist);
        request.getRequestDispatcher("customBuy.jsp").forward(request,response);
    }
}
