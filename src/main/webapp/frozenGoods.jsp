<%--
  Created by IntelliJ IDEA.
  User: jtwu
  Date: 2021/9/21
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.good.vo.Good" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>商品状态</title>
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
    .s1 {
        display: inline-block;
        height: 40px;
        width: 40px;
        color: white;
        font-size: x-large;
        background: rgba(135, 206, 250, 1);
        border: 1px solid lightgray;
        cursor: pointer;
        line-height: 40px;
    }
    .s1:hover {
        background: rgba(135, 206, 250, 0.7);
        box-shadow: white inset 0 0;
    }
    .s2 {
        display: inline-block;
        height: 40px;
        width: 100px;
        color: white;
        font-size: x-large;
        background: rgba(135, 206, 250, 1);
        border: 1px solid lightgray;
        cursor: pointer;
        line-height: 40px;
    }
    .s2:hover {
        background: rgba(135, 206, 250, 0.7);
        box-shadow: white inset 0 0;
    }
    .s3 {
        display: inline-block;
        height: 40px;
        color: black;
        font-size: x-large;
        line-height: 40px;
    }
    .btu2 {
        border: none;
        border-radius: 10px;
        color: white;
        font-size: large;
        background: rgba(135, 206, 250, 1);
    }
</style>
<script>
    function unFrozen(id, index) {
        location.href = "SellerServlet?method=goodBackOnline&goodid=" + id + "&index=" + index;
    }

    function frozen(id, index) {
        location.href = "SellerServlet?method=freezeGood&goodid=" + id + "&index=" + index;
    }
    function down(id) {
        // location.href = "SellerServlet?method=freezeGood&goodid=" + id;
        location.href = "setting.jsp"
    }
    var pno = 1;   //当前第几页
    var psize = 3; //一页显示的记录数
    var totalPage = 999;
    function getPage() {
        pno = (pno < 1)? 1: pno;
        pno = (pno > totalPage)? totalPage: pno;
        var it = document.getElementById("tb1");
        var rows = it.rows.length;
        var pageSize = psize;
        var currentPage = (pno < 1)? 1: pno; //当前页数
        var startRow = (currentPage - 1) * pageSize + 2;//开始显示的行
        var endRow = currentPage * pageSize + 1;//结束显示的行
        endRow = (endRow > rows)? rows : endRow;
        if (rows / pageSize > parseInt(rows / pageSize)) {
            totalPage = parseInt(rows / pageSize) + 1;
        } else {
            totalPage = parseInt(rows / pageSize)
        }
        // if (startRow == 1) {
        //     startRow ++;
        //     endRow ++;
        // }
        document.getElementById("sptext").innerText = "当前页数 " + pno + " / " + totalPage;
        for (var i=1; i<(rows + 1); i ++) {
            var irow = it.rows[i - 1];
            if (i >= startRow && i <= endRow){
                irow.style.display = "table-row";
            } else if (i != 1){
                irow.style.display = "none";
            }
        }
    }
    function addIndex() {
        // index = parseInt(index) + 1;
        // if (index * 3 - parseInt(size) < 3) {
        //     location.href = "SellerServlet?method=viewHisGoodsChangeIndex&index=" + index;
        // }
        pno ++;
        getPage();
    }

    function minusIndex() {
        // index = parseInt(index) - 1;
        // if (index > 0)  {
        //     location.href = "SellerServlet?method=viewHisGoodsChangeIndex&index=" + index;
        // }
        pno --;
        getPage();
    }

    function changeIndex() {
        if (parseInt(document.getElementById("index").value)) {
            var index = parseInt(document.getElementById("index").value);
            pno = index;
            getPage();
        }
    }
</script>
<body style="background-image: url(pictures/background.png)" onload="getPage()">
<c:if test="${empty sessionScope.seller}">
    <jsp:forward page="unlogin.jsp"></jsp:forward>
</c:if>
<c:if test="${not empty sessionScope.seller}">
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
    <div style="margin: 0 auto; margin-top: 6%; width: 60%; height: 600px; border: 5px #e4b9c0; border-radius: 10px; border-style: solid; background: white;
    padding-top: 5%; padding-left: 5%; padding-right: 5%; padding-bottom: 5%; position: relative">
        <form>
            <table class="table table-hover" style="max-height: 550px" id="tb1">
                <tr>
                    <th>商品图</th><th>商品ID</th><th>商品名</th><th>状态</th><th>操作</th>
                </tr>
                <c:choose>
                    <c:when test="${not empty sessionScope.gls}">
                        <c:forEach items="${sessionScope.gls}" var="f" varStatus="s">
                            <tr style="margin: 0 auto">
                                <td><img src="${pageContext.request.contextPath}/${f.pictures.get(0)}"></td><td>${f.goodId}</td><td>${f.goodName}</td>
                                <td>${f.freeze?"冻结":"在售"}</td>
                                <td style="border-spacing: 2px">
                                    <span><button class="but1" type="button" onclick="unFrozen('${f.goodId}', '${requestScope.index}')">解除冻结</button></span>
                                    <span><button class="but1" type="button" onclick="frozen('${f.goodId}', '${requestScope.index}')">冻结</button></span>
                                        <%-- <span><button class="but1" type="button" onclick="down('${c.goodId}')">下架商品</button></span>--%>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="5">没有商品</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </table>
        </form>
        <div style="position: absolute; bottom: 10px; width: 600px; height: 40px; right: 2px;">
            <span class="s2" onclick="minusIndex()">上一页</span>
            <span class="s3" id="sptext">当前页数 10 / 10</span>
            <span class="s2" onclick="addIndex()">下一页</span>
            <span class="s3" style="width: 60px;">到第</span>
            <span class="s3"><input type="text" style="height: 30px; width: 60px; text-align: center" id="index"></span>
            <span class="s3" style="width: 40px">页</span>
            <span style="display: inline-block; height: 40px; line-height: 40px; width: 60px;"><input type="button" class="btu2" value="跳转" onclick="changeIndex()"></span>
        </div>
    </div>
</c:if>
</body>
</html>