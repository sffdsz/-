<%@ page import="com.good.vo.Good" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: jtwu
  Date: 2021/10/2
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    input:focus::-webkit-input-placeholder {
        color:transparent;
    }
    input:focus:-moz-placeholder {
        color:transparent;
    }
    input:focus::-moz-placeholder {
        color:transparent;
    }
    input:focus:-ms-input-placeholder {
        color:transparent;
    }
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
    .left-navigation {
        position: fixed;
        margin-left: 5%;
        margin-top: 5%;
        width: 10%;
        height: 80%;
    }

    .sum1 {
        font-size: x-large;
        font-family: "Microsoft Himalaya";
        color: grey;
    }

    .sum1:hover {
        color: darkgray;
        cursor: pointer;
    }

    li {
        list-style: none;
        font-family: "Microsoft Himalaya";
        font-size: large;
        cursor: pointer;
    }

    li:hover {
        background: whitesmoke;
    }

    #ss {
        width: 40px;
        height: 40px;
    }

    .s1 {
        display: table-cell;
        vertical-align: middle;
    }

    .i1 {
        border-style: none;
        width: 600px;
        height: 50px;
        font-size: x-large;
        outline: none;
        border-radius: 25px;
    }

    .i1:hover {
        border: white;
    }

    .b1 {
        background: #037bd2;
        height: 50px;
        font-size: x-large;
        font-family: "Microsoft Himalaya";
        outline: none;
        color: white;
        border: #037bd2;
    }

    .s2 {
        width: 30px;
        height: 30px;
        border: 1px lightgray;
        border-style: solid;
        margin: 0 auto;
        display: table-cell;
        cursor: pointer;
    }

    .s3 {
        width: 40px;
        height: 40px;
        border: 2px lightgray;
        border-style: solid;
        margin: 0 auto;
        text-align: center;
        display: table-cell;
        cursor: pointer;
    }

    .s3:hover {
        border: 2px red;
        border-style: solid;
        margin: 0 auto;
        display: table-cell;
    }

    .s3:visited {
        border: 2px red;
        border-style: solid;
        margin: 0 auto;
        display: table-cell;
    }

    .good {
        width: inherit;
        height: inherit;
        border: 3px rgba(0, 0, 0, 0);
        border-style: solid
    }
    .good:hover {
        border: 3px red;
        border-style: solid;
        box-shadow: inset 0 1px 1px white,0 0 8px snow;
    }

    .t1 {
        width: 250px;
        height: 360px;
    }
    ul li {
        cursor: pointer;
        width: inherit;
    }
    .a1:hover {
        text-decoration: underline;
        cursor: pointer;
    }
</style>
<%
    Good g = new Good();
    g.setGoodId(1);
    g.setGoodName("超级无敌电视");
    g.setPrice("998");
    ArrayList<String> plist = new ArrayList<>();
    List<Good> glist = new ArrayList<>();
    for (int i = 0; i <= 12; i ++) {
        plist.add("ds" + i + ".png");
    }
    g.setPictures(plist);
    int index = 0;
    glist.add(g);
    glist.add(g);
    glist.add(g);
    glist.add(g);
    glist.add(g);
    glist.add(g);
    glist.add(g);
    session.setAttribute("goods", glist);
    String [] s = new String[glist.size()];
    for (int i = 0; i < s.length; i ++) {
        Iterator<String> it = glist.get(i).getPictures().iterator();
        while (it.hasNext()) {
            String str = it.next();
            if (i == 0) {
                s[i] += str;
            } else {
                s[i] = s[i] + " " + str;
            }
        }
    }
%>
<script>
    function next(imgList, index) {
        id = index
        imgList = imgList.replace("[", "").replace("]", "").replace(" ", "").split(",");
        index = parseInt(document.getElementById("m" + id).alt);
        var count = 0;
        if ((index + 1) * 4 > imgList.length) {
            var len = imgList.length;
            var len2 = len - index * 4;
            for (i = index * 4 - 1; i < imgList.length; i ++) {
                document.getElementById("m" + id.toString() + "b" + count.toString()).src = "pictures/" + imgList[i].replace(" ", "");
                count ++;
            }
            while (len2 >= 0) {
                document.getElementById("sm" + id.toString() + "b" + count.toString()).style.display = "none";
                count ++;
                len2 --;
            }
            document.getElementById("m" + id).alt = index;
        } else {
            for (i = index * 4; i <index * 4 + 4; i ++) {
                document.getElementById("m" + id.toString() + "b" + count.toString()).src = "pictures/" + imgList[i].replace(" ", "");
                count ++;
                // document.write("pictures/" + imgList[i]);
            }
            document.getElementById("m" + id).alt = index + 1;
        }

    }
    function back(imgList, index) {
        id = index
        imgList = imgList.replace("[", "").replace("]", "").replace(" ", "").split(",");
        index = parseInt(document.getElementById("m" + id).alt);
        var count = 0;
        index --;
        if (index < 0) {
            index = 0;
        } else {
            for (i = index * 4; i <index * 4 + 4; i ++) {
                document.getElementById("sm" + id.toString() + "b" + count.toString()).style.display = "table-cell";
                document.getElementById("m" + id.toString() + "b" + count.toString()).src = "pictures/" + imgList[i].replace(" ", "");
                count ++;
                // document.write("pictures/" + imgList[i]);
            }
        }
        document.getElementById("m" + id).alt = index;
    }

    function change(id1, id2) {
        var src = document.getElementById(id2).src;
        document.getElementById(id1).src = src;
    }
    function search() {
        alert("亨亨NB彩电视已售罄")
    }
</script>

<body>
<div class="navbar navbar-inverse">
    <table class="title">
        <tr id="title_tr" align="center">
            <td width="60%" align="center"><a href="GoodServlet" id="titleText">在 线 购 物 系 统</a></td>
            <td width="10%" class="title_td"><a href="GoodServlet" class="astyle">商品列表</a></td>
            <td width="10%" class="title_td"><a class="astyle" onclick="dianji()">商品状态</a></td>
            <td width="10%" class="title_td"><a href="./sign_in.jsp" class="astyle">商家登录</a></td>
        </tr>
    </table>
</div>
<div class="left-navigation">
    <details class="details-1">
        <summary class="sum1">家电</summary>
        <ul>
            <li>电视</li>
        </ul>
    </details>
</div>
<div style="position: relative; top: 12%; right: 2%; float: right; display: table; border: 2px darkgray; border-style: solid; border-radius: 25px 0 0 25px;background: white">
    <span class="s1"><img src="pictures/sousuo.png" id="ss"></span><span class="s1"><input type="text" placeholder="请输入想要查询的商品" class="i1" onkeydown="if (event.keyCode == 10 || event.keyCode == 13) search()"></span>
    <span class="s1"><button class="b1">搜一下</button></span>
</div>
<div style="position: relative; left: 8%; top: 15%; right: 2%; width: 80%;">
    <table style="width: 100%; margin-left: 10%; margin-top: 5%">
        <c:forEach items="${goods}" var="g" varStatus="gvs">
            <c:if test="${gvs.index % 4 == 0}">
                <tr>
            </c:if>
                <td class="t1">
                    <div class="good">
                        <div style="width: 240px; height: 200px"><img src="pictures/${g.pictures.get(0)}" style="width: 240px; height: 200px" id="m${gvs.index}" alt="0"></div>
                        <div style="width: 240px; height: 50px; margin: 0 auto; display: table; vertical-align: middle">
                            <span class="s2" style="border: none; cursor: pointer" onclick="back('${g.pictures.toString()}', '${gvs.index}')"><img src="pictures/left.png" style="width: 30px; right: 30px;"></span>
                            <c:forEach items="${g.pictures}" var="p" varStatus="pvs">
                                <c:if test="${pvs.index < 4}">
                                    <span class="s3" onclick="change('m${gvs.index}', 'm${gvs.index}b${pvs.index}')" id="sm${gvs.index}b${pvs.index}"><img src="pictures/${p}" style="width: 40px; height: 40px" id="m${gvs.index}b${pvs.index}"></span>
                                </c:if>
                            </c:forEach>
                            <span class="s2" style="border: none" onclick="next('${g.pictures.toString()}', '${gvs.index}')"><img src="pictures/right.png" style="width: 30px; height: 30px"></span>
                        </div>
                        <div style="font-family: 'Arial Black'; font-size: xx-large; color: orangered; width: 50px; width: inherit; margin-left: 5%; margin-right: 5%">￥${g.price}</div>
                        <div style="font-size: small; width: 50px; width: inherit; margin-left: 5%; margin-right: 5%"><a class="a1">${g.goodName}</a></div>
                    </div>
                </td>
            <c:if test="${gvs.index % 4 == 3}">
                </tr>
            </c:if>
        </c:forEach>
    </table>
</div>
</body>
</html>
