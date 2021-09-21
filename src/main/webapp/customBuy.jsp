<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.onlineShopping2.Good" %>
<%@ page import="com.example.onlineShopping2.Custom" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
</head>
<style>
    .navbar11 {
        margin-bottom: 0;
        position: fixed;
        left: 0;
        right: 0;
        z-index: 9999;
    }
    .sidebar {
        background: lightslategray;
        padding: 0;
        position: fixed;
        top: 15%;
        width: 10%;
        /*bottom: 15%;*/
    }
    .content {
        position: fixed;
        top: 15%;
        right: 0;
        bottom: 0;
        overflow: scroll;
    }

    table.title1{
        position: fixed;
        width: 100%;
        height: 10%;
        top: 0;
        background-color: cornflowerblue;
    }
    button.title_button{
        background-color: cornflowerblue;
        font-size: xx-large;
        color: whitesmoke;
        transition-duration: 0.4s;
        border: none;
        width: 100%;
    }
    .title_button:hover{
        /*background-color: lightblue; !* Green *!*/
        color: lightgray;
    }
    .title_button:active{
        /*background-color: lightblue; !* Green *!*/
        color: lightslategrey;
        border: none;
    }
    #title_tr{
        color: cornflowerblue;
        border-style: none;
    }
    td.title_td{
        border-style: none;
    }
    span{
        text-align: center;
    }
    img{
        border-radius: 80%;
        width: 300px;
        height: 300px;
    }
    #imglist{
        text-align: center;
    }
    #imglist img{
        float: left;
    }
    .left:hover{
        background-color: slategrey;
    }
    a.astyle{
        background-color: cornflowerblue;
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
    #titleText{
        background-color: cornflowerblue;
        font-size: xxx-large;
        color: whitesmoke;
        transition-duration: 0.4s;
        border: none;
        width: 100%;
        text-decoration: none;
        cursor:pointer
    }
</style>
<script>

</script>
<body>
<%
    List<Custom> clist = new ArrayList<Custom>();
    clist.add(new Custom("jack", "杭州", "100"));
    session.setAttribute("custom", clist);
%>
<div class="navbar11 navbar-inverse">
    <table class="title1">
        <tr id="title_tr" align="center">
            <td width="60%" align="center"><a href="./setting.jsp" id="titleText">在 线 购 物 系 统</a></td>
            <td width="10%" class="title_td"><a href="./index.jsp" class="astyle">发布商品</a></td>
            <td width="10%" class="title_td"><a href="" class="astyle">历史商品</a></td>
            <td width="10%" class="title_td"><a href="./customBuy.jsp" class="astyle">购买人信息</a></td>
            <td width="10%" class="title_td"><a href="./frozenGoods.jsp" class="astyle">冻结商品</a></td>
        </tr>
    </table>
</div>
<%--style="margin: 0 auto; border-spacing: 40px 40px"--%>
<div style="margin: 0 auto; margin-top: 10%; width: 60%">
    <table class="table table-hover">
        <tr>
            <th>用户ID</th><th>姓名</th><th>地址</th><th>出价</th>
        </tr>
        <c:choose>
            <c:when test="${not empty custom}">
                <c:forEach items="${custom}" var="c" varStatus="s">
                    <tr>
                        <td>${c.uid}</td><td>${c.name}</td><td>${c.address}</td><td>${c.prive}</td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4">没有购买人信息</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </table>

</div>

</body>
</html>