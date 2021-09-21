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
        border-radius: 10px;
        width: 250px;
        height: 250px;
    }
    .leftImg{
        border-radius: 10px;
        width: 40px;
        height: 40px;
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
    a.qg{
        font-size: x-large;
        text-decoration: none;
        cursor:pointer;
        color: crimson;
        font-style: italic;
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
    var imgList = new Array("1.png", "2.png", "3.png");
    var index = 0;
    function next() {
        var s = document.getElementById("src").value;
        index ++
        if (index == imgList.length) {
            index = 0;
        }
        document.getElementById("picture").src = s + imgList[index];
    }
    function back() {
        var s = document.getElementById("src").value;
        index --;
        if (index < 0) {
            index = imgList.length - 1;
        }
        document.getElementById("picture").src = s + imgList[index];
    }
    function dianji() {
        alert("当前出售的商品为${sp}")
    }

</script>
<body>
<%
    List<Good> releasedGoodsFruit = new ArrayList<Good>();
    releasedGoodsFruit.add(new Good("mht.png", "sl.png"));
    releasedGoodsFruit.add(new Good("mg.png"));
    session.setAttribute("releasedGoodsFruit", releasedGoodsFruit);
    List<Good> releasedGoodselEctric = new ArrayList<Good>();
    releasedGoodselEctric.add(new Good("ds.png", "xyj.png"));
    releasedGoodselEctric.add(new Good("kt.png"));
    session.setAttribute("releasedGoodselEctric", releasedGoodselEctric);
    List<Good> releasedGoodselVegetables = new ArrayList<Good>();
    releasedGoodselVegetables.add(new Good("xhs.png", "hg.png"));
    releasedGoodselVegetables.add(new Good("hlb.png"));
    session.setAttribute("releasedGoodselVegetables", releasedGoodselVegetables);
    session.setAttribute("sp", "亨哥");
%>
<div class="navbar navbar-inverse">
    <table class="title">
        <tr id="title_tr" align="center">
            <td width="60%" align="center"><a href="./index.jsp" id="titleText">在 线 购 物 系 统</a></td>
            <td width="10%" class="title_td"><a href="./index.jsp" class="astyle">商品列表</a></td>
            <td width="10%" class="title_td"><a class="astyle" onclick="dianji()">商品状态</a></td>
            <td width="10%" class="title_td"><button type="submit" class="title_button">商家登录</button></td>
        </tr>
    </table>
</div>

<div class="container-fluid main">
    <div class="row">
        <div class="col-md-2 sidebar">
            <table>
                <tr onclick="document.getElementById('t1').style.display='block';document.getElementById('t2').style.display='none'; document.getElementById('t3').style.display='none'" style="cursor:pointer" class="left">
                    <td width="60%" align="center"><img src="${pageContext.request.contextPath}/pictures/水果.png" class="leftImg"></td>
                    <td style="font-size: xx-large; color: white" align="center">水果</td>
                </tr>
                <tr onclick="document.getElementById('t2').style.display='block';document.getElementById('t1').style.display='none'; document.getElementById('t3').style.display='none'" style="cursor:pointer" class="left">
                    <td width="60%" align="center"><img src="${pageContext.request.contextPath}/pictures/家电.png"  class="leftImg"></td>
                    <td style="font-size: xx-large; color: white" align="center">家电</td>
                </tr>
                <tr onclick="document.getElementById('t3').style.display='block';document.getElementById('t2').style.display='none'; document.getElementById('t1').style.display='none'" style="cursor:pointer" class="left">
                    <td width="60%" align="center"><img src="${pageContext.request.contextPath}/pictures/蔬菜.png"  class="leftImg"></td>
                    <td style="font-size: xx-large; color: white" align="center">蔬菜</td>
                </tr>
            </table>
        </div>
<%--        class="col-md-10 content pull-right"--%>
        <div>
            <div id="imglist">
                <input type="hidden" value="${pageContext.request.contextPath}/pictures/" id="src">
                <div id="back" style="position: absolute; top: 30%; left: 35%">
                    <img src="${pageContext.request.contextPath}/pictures/back.png" onclick="back()" style="width: 30%; height: 30%">
                </div>
                <div id="img" style="position: absolute; top: 15%; left: 45%">
                    <img src="${pageContext.request.contextPath}/pictures/1.png" id="picture">
                </div>
                <div id="more" style="position: absolute; top: 30%; left: 65%">
                    <img src="${pageContext.request.contextPath}/pictures/more.png" onclick="next()" style="width: 30%; height: 30%">
                </div>
            </div>
            <div style="border: cornflowerblue; border-style: solid; border-width: 2px; top: 50%; width: 50%; position: absolute; left: 25%; padding: 10px" id="t1">
                <table style="border-spacing: 30px 30px;">
                    <c:choose>

                        <c:when test="${not empty releasedGoodsFruit}">
                            <c:forEach items="${releasedGoodsFruit}" var="r" step="1" varStatus="status">
                                <tr>
                                    <td rowspan="3"><img src="${pageContext.request.contextPath}/pictures/${r.g1}"></td>
                                    <td style="font-size: xx-large; color: #ff4500">商品价格</td>
                                    <c:if test="${not empty r.g2}">
                                        <td rowspan="3"><img src="${pageContext.request.contextPath}/pictures/${r.g2}"></td>
                                        <td style="font-size: xx-large; color: #ff4500">商品价格</td>
                                    </c:if>
                                </tr>
                                <tr>
                                    <td>亨哥</td>
                                    <c:if test="${not empty r.g2}">
                                        <td>亨哥</td>
                                    </c:if>
                                </tr>
                                <tr>
                                    <td><a href="./information.jsp" class="qg">抢购</a></td>
                                    <c:if test="${not empty r.g2}">
                                        <td><a href="./information.jsp" class="qg">抢购</a></td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <p align="center">当前未发布商品</p>
                        </c:otherwise>
                    </c:choose>
                </table>
            </div>
            <div style="border: cornflowerblue; border-style: solid; border-width: 2px; top: 50%; width: 50%; position: absolute; left: 25%; padding: 10px; display: none" id="t2">
                <table style="border-spacing: 30px 30px;">
                    <c:choose>

                        <c:when test="${not empty releasedGoodselEctric}">
                            <c:forEach items="${releasedGoodselEctric}" var="r" step="1" varStatus="status">
                                <tr>
                                    <td rowspan="3"><img src="${pageContext.request.contextPath}/pictures/${r.g1}"></td>
                                    <td style="font-size: xx-large; color: #ff4500">商品价格</td>
                                    <c:if test="${not empty r.g2}">
                                        <td rowspan="3"><img src="${pageContext.request.contextPath}/pictures/${r.g2}"></td>
                                        <td style="font-size: xx-large; color: #ff4500">商品价格</td>
                                    </c:if>
                                </tr>
                                <tr>
                                    <td>亨哥</td>
                                    <c:if test="${not empty r.g2}">
                                        <td>亨哥</td>
                                    </c:if>
                                </tr>
                                <tr>
                                    <td><a href="./information.jsp" class="qg">抢购</a></td>
                                    <c:if test="${not empty r.g2}">
                                        <td><a href="./information.jsp" class="qg">抢购</a></td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <p align="center">当前未发布商品</p>
                        </c:otherwise>
                    </c:choose>
                </table>
            </div>
            <div style="border: cornflowerblue; border-style: solid; border-width: 2px; top: 50%; width: 50%; position: absolute; left: 25%; padding: 10px; display: none" id="t3">
                <table style="border-spacing: 30px 30px;">
                    <c:choose>

                        <c:when test="${not empty releasedGoodselVegetables}">
                            <c:forEach items="${releasedGoodselVegetables}" var="r" step="1" varStatus="status">
                                <tr>
                                    <td rowspan="3"><img src="${pageContext.request.contextPath}/pictures/${r.g1}"></td>
                                    <td style="font-size: xx-large; color: #ff4500">商品价格</td>
                                    <c:if test="${not empty r.g2}">
                                        <td rowspan="3"><img src="${pageContext.request.contextPath}/pictures/${r.g2}"></td>
                                        <td style="font-size: xx-large; color: #ff4500">商品价格</td>
                                    </c:if>
                                </tr>
                                <tr>
                                    <td>亨哥</td>
                                    <c:if test="${not empty r.g2}">
                                        <td>亨哥</td>
                                    </c:if>
                                </tr>
                                <tr>
                                    <td><a href="./information.jsp" class="qg">抢购</a></td>
                                    <c:if test="${not empty r.g2}">
                                        <td><a href="./information.jsp" class="qg">抢购</a></td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <p align="center">当前未发布商品</p>
                        </c:otherwise>
                    </c:choose>
                </table>
            </div>

        </div>
    </div>
</div>

</body>
</html>