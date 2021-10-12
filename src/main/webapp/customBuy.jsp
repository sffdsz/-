<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>购买人信息</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
</head>
<style>
    .navbar11 {
        margin: 0 auto;
        margin-bottom: 0;
        position: fixed;
        left: 15px;
        right: 15px;
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
        width: 98%;
        height: 10%;
        margin: 0 auto;
        top: 0;
        background-color: #037bd2;
    }
    button.title_button{
        background-color: #037bd2;
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
        color: #037bd2;
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
    input.cs{
        margin: 0 auto;
        background-color: #4CAF50; /* Green */
        border: none;
        color: white;
        margin-top: 2%;
        padding: 5px 10px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        border-radius: 5px;
    }
    .cs:active {
        background-color: #3e8e41;
        box-shadow: 0 5px #99eab7;
        transform: translateY(4px);
    }
</style>
<script>
    function buy(uid, gid) {
        location.href = "SellerServlet?method=transaction&goodid=" + gid + "&userid=" + uid;
    }

    function success(gid) {
        location.href = "SellerServlet?method=transactionSuccess&goodid=" + gid;
    }
</script>
<body style="background-image: url(pictures/background.png)">
<div class="navbar11 navbar-inverse">
    <table class="title1">
        <tr id="title_tr" align="center">
            <td width="60%" align="center"><a href="./setting.jsp" id="titleText">在 线 购 物 系 统</a></td>
            <td width="10%" class="title_td"><a href="upload.jsp" class="astyle">发布商品</a></td>
            <td width="10%" class="title_td"><a href="SellerServlet?method=viewHisGoods" class="astyle">历史商品</a></td>
            <td width="10%" class="title_td"><a href="SellerServlet?method=viewBuyerInfo" class="astyle">购买人</a></td>
            <td width="10%" class="title_td"><a href="./frozenGoods.jsp" class="astyle">冻结商品</a></td>
        </tr>
    </table>
</div>
<%--style="margin: 0 auto; border-spacing: 40px 40px"--%>
<div style="margin: 0 auto; margin-top: 10%; width: 60%; border: 5px #e4b9c0; border-radius: 10px; border-style: solid; background: white;
    padding-top: 5%; padding-left: 5%; padding-right: 5%; padding-bottom: 5%">
    <div style="width: 100%; height: 50px"><input type="button" value="交易成功" class="cs" onclick="success('${sessionScope.good.goodId}')" style="float: right"></div>
    <table class="table table-hover" style="margin-top: 5px">
        <tr>
            <th>用户ID</th><th>姓名</th><th>地址</th><th>出价</th><th>操作</th>
        </tr>
        <c:choose>
            <c:when test="${not empty requestScope.userlist}">
                <c:forEach items="${requestScope.userlist}" var="c" varStatus="s">
                    <tr style="margin-top: 50%">
                        <td>${c.userid}</td><td>${c.username}</td><td>${c.transactionaddress}</td><td>${c.userphone}</td><td><input type="button" value="出售" class="cs" onclick="buy('${c.userid}', '${sessionScope.good.goodId}')"></td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="5">没有购买人信息</td>
                </tr>
            </c:otherwise>
        </c:choose>
    </table>

</div>

</body>
</html>