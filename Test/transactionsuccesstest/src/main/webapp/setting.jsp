<%--
  Created by IntelliJ IDEA.
  User: jtwu
  Date: 2021/9/22
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>
        在线购物平台
    </title>
</head>
<style>
    .navbar {
        margin-bottom: 0;
        position: fixed;
        left: 0;
        right: 0;
        z-index: 9999;
    }
    #titleText{
        background: none;
        font-size: 96px;
        color: whitesmoke;
        transition-duration: 0.4s;
        border: none;
        width: 100%;
        text-decoration: none;
        cursor:pointer;
        text-align: center;
        letter-spacing: 5px;
    }
    a.astyle{
        background-color: #037bd2;
        font-size: xx-large;
        color: whitesmoke;
        transition-duration: 0.4s;
        border: none;
        width: 100%;
        text-decoration: none;
        cursor:pointer
    }
    .astyle:hover{
        color: lightgray;
    }
    .bd{
        margin-top: 10%;
        margin-left: 20%;
        margin-right: 20%;
        height: 70%;
    }
    .dh{
        height: 33.3%;
        width: 100%;
        writing-mode: vertical-lr;
        font-size: xx-large;
        font-family: "Microsoft Himalaya";
        color: white;
        text-align: center;
        cursor: pointer;

    }
    .button1{
        margin: 0 auto;
        background-color: salmon; /* Green */
        border: none;
        color: white;
        margin-top: 5%;
        padding: 15px 30px;
        width: 200%;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 32px;
        border-radius: 5px;
    }
    .button1:active {
        background-color: #e4b9c0;
        box-shadow: 0 5px #d9edf7;
        transform: translateY(4px);
    }
    .sp1 {
        color: white;
        font-style: inherit;
        margin: 0 auto;
        font-family: "Microsoft Himalaya";
        font-size: 72px;
        text-align: center;
        background: #037bd2;
        border-radius: 10px;
        padding-top: 5%;
        padding-bottom: 5%;
        margin-left: 5%;
        margin-right: 5%;
        opacity: 0.8;
    }
    td {
        text-align: center;
        margin: 0 auto;
        /*background: #037bd2;*/
        max-width: 60%;
        height: 210px;
    }
    .sp1:hover {
        transform: scale(1.2);
        border: yellow 8px;
        border-style: solid;
        transition: all 0.5s;
        cursor: pointer;
        box-shadow: inset 0 1px 1px white,0 0 8px snow;
        opacity: 1;
    }

</style>
<body style="background-image: url(pictures/background.png); max-height: 100%; overflow: hidden">
<div style="text-align: center; margin-left: 3%; margin-right: 3%; margin-bottom: 5%;">
    <a href="./setting.jsp" style="text-decoration: none"><span id="titleText">在线购物系统</span></a>
    <table style="margin: 0 auto; text-align: center; border-spacing: 40px 40px; table-layout: fixed; width: 100%;
     margin-top: 1%; margin-bottom: 30%; background: rgba(245, 245, 245, 0.7); border: 5px; border-radius: 10px; border-style: inset; border: #e4b9c0;
     ">
        <tr>
            <td width="50%">
                <a href="./upload.jsp" style="text-decoration: none"><div class="sp1">发布商品</div></a>
            </td>
            <td width="50%">
                <a href="SellerServlet?method=viewHisGoods" style="text-decoration: none"><div class="sp1">历史商品</div></a>
            </td>
        </tr>
        <tr>
            <td width="50%">
                <a href="SellerServlet?method=viewBuyerInfo" style="text-decoration: none"><div class="sp1">购买人信息</div></a>
            </td>
            <td width="50%">
                <a href="./frozenGoods.jsp" style="text-decoration: none"><div class="sp1">商品状态</div></a>
            </td>
        </tr>
    </table>
</div>
<div style="position: absolute; top: 3px; left: 10px">
    <div style="font-size: x-large; font-family: 'Microsoft Himalaya'; font-style: inherit; color: white">管理员${sessionScope.seller.sellername}，欢迎您！</div>
    <a href="./updatePassWord.jsp" style="text-decoration: none"><div style="font-size: small; font-family: 'Microsoft Himalaya'; font-style: italic; color: white">修改密码</div></a>
    <a href="./home1.jsp" style="text-decoration: none"><div style="font-size: small; font-family: 'Microsoft Himalaya'; font-style: italic; color: white; float: left">退出登录</div></a>
</div>
</body>
</html>
