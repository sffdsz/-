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
    function buy(uid, gid, index) {
        location.href = "SellerServlet?method=transaction&goodid=" + gid + "&userid=" + uid + "&index=" + index;
    }

    function success(gid, index) {
        location.href = "SellerServlet?method=transactionSuccess&goodid=" + gid + "&index=" + index;
    }

    var pno = 1;   //当前第几页
    var psize = 6; //一页显示的记录数
    var totalPage = 999;
    var display = document.getElementById("dd").style.display;
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
        document.getElementById("sptext").innerText = "当前页数 " + pno + " / " + totalPage;
        // if (startRow == 1) {
        //     startRow ++;
        //     endRow ++;
        // }
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
<c:if test="${not empty sessionScope.seller}">
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
    <div style="margin: 0 auto; margin-top: 6%; width: 60%; height: 600px; border: 5px #e4b9c0; border-radius: 10px; border-style: solid; background: white;
    padding-top: 5%; padding-left: 5%; padding-right: 5%; padding-bottom: 5%; position: relative">
        <div style="width: 100%; height: 50px"><input type="button" value="交易成功" class="cs" onclick="success('${sessionScope.good.goodId}', '${requestScope.index}')" style="float: right"></div>
        <table class="table table-hover" style="margin-top: 5px" id="tb1">
            <tr>
                <th>用户ID</th><th>姓名</th><th>地址</th><th>出价</th><th>操作</th>
            </tr>
            <c:choose>
                <c:when test="${not empty sessionScope.userlist}">
                    <c:forEach items="${sessionScope.userlist}" var="c" varStatus="s">
                        <tr style="margin-top: 50%">
                            <td>${c.userid}</td><td>${c.username}</td><td>${c.transactionaddress}</td><td>${c.userphone}</td><td><input type="button" value="出售" class="cs" onclick="buy('${c.userid}', '${sessionScope.good.goodId}', '${requestScope.index}')"></td>
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
<c:if test="${empty sessionScope.seller}">
    <jsp:forward page="unlogin.jsp"></jsp:forward>
</c:if>
</body>
</html>