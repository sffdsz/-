                                   <%--
  Created by IntelliJ IDEA.
  User: jtwu
  Date: 2021/9/21
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>历史商品</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
          integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
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

    table.title{
        position: fixed;
        width: 98%;
        height: 10%;
        margin: 0 auto;
        top: 0;
        background-color: #037bd2;
    }
    #title{
        font-size: xxx-large;
        color: whitesmoke;
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
        border-radius: 20px;
        width: 100px;
        height: 100px;
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
    input.dj{
        margin: 0 auto;
        background-color: #4CAF50; /* Green */
        border: none;
        color: white;
        margin-top: 5%;
        padding: 5px 10px;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        border-radius: 5px;
    }
    .dj:active {
        background-color: #3e8e41;
        box-shadow: 0 5px #99eab7;
        transform: translateY(4px);
    }
    .but1 {
        margin: 0 auto;
        background-color: #4CAF50; /* Green */
        border: none;
        color: white;
        margin-top: 5%;
        padding: 5px 10px;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        border-radius: 5px;
    }
    .but1:active {
        background-color: #3e8e41;
        box-shadow: 0 5px #99eab7;
        transform: translateY(4px);
    }
    td{
        margin: 0 auto;
        margin-top: 5%;
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
</style>
<script>

</script>
<body style="background-image: url(pictures/background.png)">
<div class="navbar11 navbar-inverse">
    <table class="title">
        <tr id="title_tr" align="center">
            <td width="60%" align="center"><a href="./setting.jsp" id="titleText">在 线 购 物 系 统</a></td>
            <td width="10%" class="title_td"><a href="upload.jsp" class="astyle">发布商品</a></td>
            <td width="10%" class="title_td"><a href="SellerServlet?method=viewHisGoods" class="astyle">历史商品</a></td>
            <td width="10%" class="title_td"><a href="SellerServlet?method=viewBuyerInfo" class="astyle">购买人</a></td>
            <td width="10%" class="title_td"><a href="./frozenGoods.jsp" class="astyle">冻结商品</a></td>
        </tr>
    </table>
</div>
<div style="margin: 0 auto; margin-top: 10%; width: 60%; border: 5px #e4b9c0; border-radius: 10px; border-style: solid; background: white;
    padding-top: 5%; padding-left: 5%; padding-right: 5%; padding-bottom: 5%">
    <form>
        <table class="table table-hover">
            <tr>
                <th>商品图</th><th>商品ID</th><th>商品名</th><th>购买用户</th>
            </tr>
            <c:choose>
                <c:when test="${not empty requestScope.hisgoodlist}">
                    <c:forEach items="${requestScope.hisgoodlist}" var="c" varStatus="s">
                        <tr style="margin: 0 auto">
                            <td><img src="${pageContext.request.contextPath}/pictures/${c.pictures}"></td><td>${c.goodId}</td><td>${c.goodName}</td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="4">没有商品</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </table>
    </form>

</div>

</body>
</html>