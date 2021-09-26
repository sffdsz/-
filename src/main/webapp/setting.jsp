<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.onlineShopping2.Good" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<style>
    .navbar {
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

    table.title{
        position: fixed;
        width: 100%;
        height: 10%;
        top: 0;
        background-color: cornflowerblue;
    }
    #title{
        font-size: xxx-large;
        color: whitesmoke;
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
</style>
<script>

</script>
<body>
<div class="navbar navbar-inverse">
    <table class="title">
        <tr id="title_tr" align="center">
            <td width="60%" align="center" id="title"><a href="./setting.jsp" class="astyle">在 线 购 物 系 统</a></td>
            <td width="10%" class="title_td"><a href="./upload.jsp" class="astyle">发布商品</a></td>
            <td width="10%" class="title_td"><a href="./history.jsp" class="astyle">历史商品</a></td>
            <td width="10%" class="title_td"><a href="./customBuy.jsp" class="astyle">购买人</a></td>
            <td width="10%" class="title_td"><a href="./frozenGoods.jsp" class="astyle">冻结商品</a></td>
        </tr>
    </table>
</div>


</body>
</html>