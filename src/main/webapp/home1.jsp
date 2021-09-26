<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.good.vo.Good" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jtwu
  Date: 2021/9/22
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        background-color: #037bd2;
        font-size: xxx-large;
        color: whitesmoke;
        transition-duration: 0.4s;
        border: none;
        width: 100%;
        text-decoration: none;
        cursor:pointer
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
    #title_tr{
        color: #037bd2;
        border-style: none;
    }
    td.title_td{
        border-style: none;
    }
    table.title{
        position: fixed;
        width: 100%;
        height: 10%;
        top: 0;
        background-color: #037bd2;
        margin-left: 1%;
        z-index: 0;
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

    }
    .dh:hover{
        background-color: #2e6da4;
    }
    .dh:visited{
        background-color: #2e6da4;
    }
    .i1{
        width: 400px;
        height: 400px;
        background-size: 100%;
        border-radius: 10px;
    }
    .i2{
        width: 300px;
        height: 300px;
        background-size: 100% 100%;
        border-radius: 10px;
    }
    .i3{
        width: 50px;
        height: 50px;
        background-size: 100% 100%;
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
</style>
<c:if test="${empty pictures}">
<jsp:forward page="GoodServlet"></jsp:forward>
</c:if>
<%
    List<String> imgList = (List<String>)session.getAttribute("pictures");
    Good good = (Good) session.getAttribute("good");
    String s = "";
    Iterator<String> it = imgList.iterator();
    while (it.hasNext()) {
        String url = it.next();
        if (s == "") {
            s += url;
        } else {
            s = s + " " + url;
        }
    }
%>

<script>
    var index = 0;
    var imgList = "<%=s%>".split(" ");
    function next() {
        // var s = document.getElementById("src").value;
        var flag = 1;
        index ++;
        if (index == imgList.length) {
            index = 0;
            flag = 0;
        }
        document.getElementById("picture").src = imgList[index];
        if (flag == 1) {
            document.getElementById(index.toString()).style.boxShadow = "inset 0 1px 1px white,0 0 8px lightskyblue";
            document.getElementById((index - 1).toString()).style.boxShadow = "none";
        } else {
            document.getElementById(index.toString()).style.boxShadow = "inset 0 1px 1px white,0 0 8px lightskyblue";
            document.getElementById((imgList.length - 1).toString()).style.boxShadow = "none";
        }
    }
    function back() {
        // var s = document.getElementById("src").value;
        var flag = 1;
        index --;
        if (index < 0) {
            index = imgList.length - 1;
            flag = 0;
        }
        document.getElementById("picture").src = imgList[index];
        if (flag == 1) {
            document.getElementById(index.toString()).style.boxShadow = "inset 0 1px 1px white,0 0 8px lightskyblue";
            document.getElementById((index + 1).toString()).style.boxShadow = "none";
        } else {
            document.getElementById(index.toString()).style.boxShadow = "inset 0 1px 1px white,0 0 8px lightskyblue";
            document.getElementById((0).toString()).style.boxShadow = "none";
        }
    }
</script>
<body style="background-image: url(pictures/background.png);">
<input type="hidden" value="${pageContext.request.contextPath}/pictures/" id="src">
<div class="navbar navbar-inverse">
    <table class="title">
        <tr id="title_tr" align="center">
            <td width="60%" align="center"><a href="./home1.jsp" id="titleText">在 线 购 物 系 统</a></td>
            <td width="10%" class="title_td"><a href="./home1.jsp" class="astyle">商品列表</a></td>
            <td width="10%" class="title_td"><a class="astyle" onclick="dianji()">商品状态</a></td>
            <td width="10%" class="title_td"><a href="" class="astyle">商家登录</a></td>

        </tr>
    </table>
</div>
<form action="information.jsp" method="post">
    <div class="bd">
        <div style="width: 10%; height: 100%; background: #9acfea; float: left">
            <div class="dh" onclick="document.getElementById('w1').style.display='block';
            document.getElementById('w2').style.display='none'; document.getElementById('w3').style.display='none'">商品简介</div>
            <div class="dh" onclick="document.getElementById('w2').style.display='block';
            document.getElementById('w1').style.display='none'; document.getElementById('w3').style.display='none'">商品图片</div>
            <div class="dh" onclick="document.getElementById('w3').style.display='block';
            document.getElementById('w2').style.display='none'; document.getElementById('w1').style.display='none'">商品信息</div>
        </div>
        <div style="width: 90%; height: 100%; float: left; background: #d9edf7" id="w1">
            <div style="width: 45%; height: 100%; float: left; padding-top: 5%; z-index: 0">
                <img src="pictures/mg.png" class="i1">
            </div>
            <div style="padding-top: 5%; padding-left: 50%; text-align: left">
                <h1 style="margin: 0 auto">${good.goodName}</h1>
                <h6 style="color: red">${good.wwhDes}</h6>
            </div>
            <div style="padding-top: 2%; padding-bottom: 2%; padding-left: 50%; text-align: left; background-image: url(pictures/price3.png)">
                <span style="color: orangered; font-size: large; text-align: center; padding-bottom: 15px">价格</span><span style="color: orangered; font-size: xxx-large; text-align: center; margin-left: 10%">${good.price}</span>
            </div>
            <div style="margin: 0 auto; float: left; padding-top: 10%; padding-left: 10%">
                <input type="submit" value="选购" class="button1">
            </div>
        </div>
        <div style="width: 90%; height: 100%; float: left;display: none; background: #d9edf7" id="w2">
            <div style="margin: 0 auto; text-align: center; margin-top: 5%">
                <img src="pictures/mg.png" class="i2" id="picture">
            </div>
            <div style="margin: 0 auto; text-align: center; margin-top: 10%">
                <span><img src="pictures/back.png" style="width: 10%; height: 10%; cursor: pointer" onclick="back()"></span>
                <c:forEach items="${pictures}" var="i" varStatus="st">
                    <span id="${st.index}" style="max-width: 30%; box-shadow: 0px 0px 10px #2e6da4"><img class="i3" src="${i}"></span>
                </c:forEach>
                <span><img src="pictures/more.png" style="width: 10%; height: 10%; cursor: pointer" onclick="next()"></span>
            </div>
        </div>
        <div style="width: 90%; height: 100%; float: left;display: none; background: #d9edf7" id="w3">
            <div style="margin-top: 10%">
                <span style="font-size: large; color: #a94442">商品名称：</span><span style="margin-left: 5%; color: #a94442">${good.goodName}</span>
            </div>
            <div style="margin-top: 3%">
                <span style="font-size: large; color: #a94442">商品产地：</span><span style="margin-left: 5%; color: #a94442">${good.origin}</span>
            </div>
            <div style="margin-top: 3%">
                <span style="font-size: large; color: #a94442">商品状态：</span><span style="margin-left: 5%; color: #a94442">${good.isOnline()?"在售":"已下架"}</span>
            </div>
            <div style="margin-top: 5%">
                <span style="font-size: x-large; color: #a94442">${good.description}</span>
            </div>
        </div>
    </div>
</form>
</body>
</html>
