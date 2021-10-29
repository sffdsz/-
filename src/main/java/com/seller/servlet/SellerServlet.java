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
import java.util.*;
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
        System.out.println(1);
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
        Boolean flag=true;
        if(oldpwd.equals(se.getSellerpwd())){
            if(oldpwd.equals(newpwd)){//新旧密码一致
                flag=false;
            }else{//判断新密码合法性
                int len=newpwd.length();
                if(len==0){//输入为空格字符串
                    flag=false;
                }else{
                    int index=0;
                    char c;
                    for(index=0;index<len;index++){
                        c=newpwd.charAt(index);
                        if(c==' '){//新密码中包含空格字符串
                            flag=false;
                            break;
                        }
                    }
                }
            }
            if(flag==true){//新密码合法
                SellerDao sd=new SellerDaoImpl();
                try {
                    sd.changePwd(sellname,newpwd);
                    se.setSellerpwd(newpwd);
                    hs.setAttribute("seller",se);
                    request.getRequestDispatcher("setting.jsp").forward(request,response);
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }else{//新密码不合法
                request.getRequestDispatcher("updatePassWord.jsp").forward(request,response);
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

    protected void viewHisGood(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<Good,String> glist=null;
        GoodDao gd=new GoodImpl();
        try {
            glist=gd.viewHisGood();
            HttpSession hs = request.getSession();
            hs.setAttribute("hisgoodlist",glist);
            request.getRequestDispatcher("history.jsp").forward(request,response);
//            viewHisGoodsChangeIndex(request, response);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

    }

    protected void releaseGood(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String goodname=null;
            String goodprice=null;
            String description=null;
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
            Boolean flag=true;
            int len=0;
            int index=0;
            char c;
            String prompt="";//存储错误信息
            while(fiIter.hasNext()){
                fi=fiIter.next();
                if(fi.isFormField()){
                    formname=fi.getFieldName();
                    formcontent=fi.getString("utf-8");
                    if(formname.equals("goodname")){
                        goodname=formcontent;
                        if(goodname.equals("")){//输入为空
                            prompt="请输入商品名称。";
                            flag=false;
                            break;
                        }else{
                            len=goodname.length();
                            for(index=0;index<len;index++){
                                c=goodname.charAt(index);
                                if(c!=' '){//不为空格字符串
                                    break;
                                }
                            }
                            if(index==len){//为空格字符串
                                prompt="请输入商品名称。";
                                flag=false;
                                break;
                            }
                        }
                    }else if(formname.equals("description")){
                        description=formcontent;
                        if(description.equals("")){
                            prompt="请输入商品描述。";
                            flag=false;
                            break;
                        }else{
                            len=description.length();
                            for(index=0;index<len;index++){
                                c=description.charAt(index);
                                if(c!=' '){
                                    break;
                                }
                            }
                            if(index==len){
                                prompt="请输入商品描述。";
                                flag=false;
                                break;
                            }
                        }
                    }else if(formname.equals("goodprice")){
                        goodprice=formcontent;
                        int pointposition=-1;//记录小数点位置
                        if(goodprice.equals("")){//判断是否为空
                            prompt="请输入商品价格。";
                            flag=false;
                            break;
                        }else{
                            len=goodprice.length();
                            for(index=0;index<len;index++){//判断字符串是否仅有数字和小数点组成
                                c=goodprice.charAt(index);
                                if(!((c>='0'&&c<='9')||c=='.')){//字符不为数字或小数点
                                    prompt="请输入合法的商品价格。";
                                    flag=false;
                                    break;
                                }
                                if(c=='.'){
                                    if(pointposition==-1){//尚未出现过小数点
                                        if(index==0||index==(len-1)||index<(len-3)){//小数点为字符串第一个或最后一个字符或小数点后面不止两位小数
                                            prompt="请输入合法的商品价格。";
                                            flag=false;
                                            break;
                                        }else{
                                            pointposition=index;//记录小数点位置
                                        }
                                    }else{//已经出现过小数点
                                        prompt="请输入合法的商品价格。";
                                        flag=false;
                                        break;
                                    }
                                }
                            }
                            c=goodprice.charAt(0);//判断是否存在前导零
                            if(c=='0'){
                                prompt="请输入合法的商品价格。";
                                flag=false;
                            }
                            if(flag==false){
                                break;
                            }
                        }
                    }else if(formname.equals("path")){
                        proPath=formcontent+"\\src\\main\\webapp\\pictures";
                        if(proPath.length()==0){
                            flag=false;
                            break;
                        }
                    }
                }else{
                    oFn=fi.getName();
                    if(oFn.equals("")){
                        flag=false;
                        break;
                    }
                    ext=oFn.substring(oFn.lastIndexOf("."));
                    if(ext.equals(".png")||ext.equals(".jpg")){
                        fnf=UUID.randomUUID().toString();
                        fn=fnf+ext;
                        df = proPath+"\\"+fn;//文件存储在磁盘的路径
                        updir = df.substring(0,df.lastIndexOf("\\"));
                        fUpDir = new File(updir);
                        System.out.println(df);
                        if(!fUpDir.exists()){
                            fUpDir.mkdirs();
                        }
                        try {
                            fi.write(new File(df));
                            goodpicture.add("/pictures/"+fn);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }else{//文件非图片
                        flag=false;
                        break;
                    }
                }
            }
            //修改商品表
            if(flag==false){
                request.setAttribute("prompt",prompt);
                request.getRequestDispatcher("upload_fail.jsp").forward(request,response);
            }else {
                if(goodpicture.isEmpty()==true){
                    prompt="请选择商品图片。";
                    flag=false;
                }
                if(flag==false){
                    request.setAttribute("prompt",prompt);
                    request.getRequestDispatcher("upload_fail.jsp").forward(request,response);
                }else{
                    GoodDao gd= new GoodImpl();
                    gd.releaseGood(goodname,goodprice,description,goodpicture);
                    ArrayList<Good> gls=new ArrayList<>();
                    gls=gd.getGoods();
                    HttpSession hs=request.getSession();
                    hs.setAttribute("gls",gls);
                    //修改商品图片表
                    //gd.()
                    request.getRequestDispatcher("setting.jsp").forward(request,response);
                }
            }
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
            List<Good> gls = gd.getGoods();
            HttpSession hs = request.getSession();
            hs.setAttribute("good",gls.get(0));
            hs.setAttribute("gls",gls);
            request.getRequestDispatcher("frozenGoods.jsp").forward(request, response);
//            freezeGoodIndexChange(request, response);
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
            List<Good> gls = gd.getGoods();
            HttpSession hs = request.getSession();
            hs.setAttribute("good",gls.get(0));
            hs.setAttribute("gls",gls);
//            viewBuyerInfoChangeIndex(request, response);
            request.getRequestDispatcher("customBuy.jsp").forward(request,response);
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
//            freezeGoodIndexChange(request, response);
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
        hs.setAttribute("userlist",ulist);
//        hs.removeAttribute("userlist");
//        viewBuyerInfoChangeIndex(request, response);
        request.getRequestDispatcher("customBuy.jsp").forward(request,response);
    }
//    protected void freezeGoodIndexChange(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
//        int index = Integer.parseInt(request.getParameter("index"));
//        HttpSession hs = request.getSession();
//        GoodDao gd = new GoodImpl();
//        List<Good> gls = gd.getGoods();
//        List<Good> flist = new ArrayList<>();
//        int count = gls.size() / 3;
//        if (gls.size() % 3 != 0) {
//            count += 1;
//        }
//        if (gls.size() < index * 3) {
//            for (int i = (index - 1) * 3; i < gls.size(); i ++) {
//                assert false;
//                flist.add(gls.get(i));
//            }
//        } else {
//            for (int i = (index - 1) * 3; i < index * 3; i ++) {
//                assert false;
//                flist.add(gls.get(i));
//            }
//        }
//        request.setAttribute("flist", flist);
//        request.setAttribute("count", count);
//        request.setAttribute("index", index);
//        request.getRequestDispatcher("frozenGoods.jsp").forward(request, response);
//    }
//
//    protected void viewBuyerInfoChangeIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int index = Integer.parseInt(request.getParameter("index"));
//        HttpSession hs = request.getSession();
//        GoodDao gd = new GoodImpl();
//        ArrayList<User> ulist = (ArrayList<User>) hs.getAttribute("userlist");
//        List<User> clist = new ArrayList<>();
//        int count = ulist.size() / 6;
//        if (ulist.size() % 6 != 0) {
//            count += 1;
//        }
//        if (ulist.size() < index * 6) {
//            for (int i = (index - 1) * 6; i < ulist.size(); i ++) {
//                assert false;
//                clist.add(ulist.get(i));
//            }
//        } else {
//            for (int i = (index - 1) * 6; i < index * 6; i ++) {
//                assert false;
//                clist.add(ulist.get(i));
//            }
//        }
//        request.setAttribute("clist", clist);
//        request.setAttribute("count", count);
//        request.setAttribute("index", index);
//        request.getRequestDispatcher("customBuy.jsp").forward(request, response);
//    }

//    protected void viewHisGoodsChangeIndex(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int index = Integer.parseInt(request.getParameter("index"));
//        HttpSession hs = request.getSession();
//        Map<Good, String> glist = (Map<Good, String>) hs.getAttribute("hisgoodlist");
//        Map<Good, String> hlist = new HashMap<>();
//        int count = glist.size() / 3;
//        if (glist.size() % 3 != 0) {
//            count += 1;
//        }
//        if (glist.size() < index * 3) {
//            for (int i = (index - 1) * 3; i < glist.size(); i ++) {
//                assert false;
//                hlist.put(glist.get(i));
//            }
//        } else {
//            for (int i = (index - 1) * 3; i < index * 3; i ++) {
//                assert false;
//                hlist.add(glist.get(i));
//            }
//        }
//        request.setAttribute("hlist", hlist);
//        request.setAttribute("count", count);
//        request.setAttribute("index", index);
//        request.getRequestDispatcher("history.jsp").forward(request, response);
//    }
}
