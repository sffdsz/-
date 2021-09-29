<%--
  Created by IntelliJ IDEA.
  User: jtwu
  Date: 2021/9/21
  Time: 16:04
  To change this template use File | Settings | File Templates.
--%>
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
        background-color: #037bd2;
        margin-left: 1%;
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
    input.i1{
        border: 1px solid #ccc;
        padding: 7px 0px;
        border-radius: 10px;
        padding-left:5px;
        -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
        box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
        -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
        -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
        transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
        width: 300px;
        height: 30px;
    }
    input.i1:focus{
        border-color: #66afe9;
        outline: 0;
        -webkit-box-shadow: inset 0 1px 1px dodgerblue,0 0 8px dodgerblue;
        box-shadow: inset 0 1px 1px white,0 0 8px dodgerblue;
    }
    input.i2{
        background-color: salmon; /* Green */
        border: none;
        color: white;
        padding: 10px 28px;
        margin-top: 5%;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: x-large;
        border-radius: 5px;
        font-style: inherit;
        font-family: "Microsoft Himalaya";
        cursor: pointer;
    }
    .bt1{
        background-color: salmon; /* Green */
        border: none;
        color: white;
        padding: 10px 28px;
        margin-top: 5%;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: x-large;
        border-radius: 5px;
        font-style: inherit;
        font-family: "Microsoft Himalaya";
        cursor: pointer;
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
    .t2{
        color: white;
        font-size: x-large;
        font-family: "Microsoft Himalaya";
        font-style: inherit;
    }
    input::-webkit-input-placeholder { /* WebKit browsers */
        color: red;
    }
    input:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
        color: red;
    }
    input::-moz-placeholder { /* Mozilla Firefox 19+ */
        color: red;
    }
    input:-ms-input-placeholder { /* Internet Explorer 10+ */
        color: red;
    }
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
    input{
        font-family: "Microsoft Himalaya";
        font-style: inherit;
        font-size: large;
    }
</style>
<script>
    function panDuan() {
        var oldpwd = document.getElementById("oldpwd").value;
        var newpwd = document.getElementById("newpwd").value;
        var resetpwd = document.getElementById("resetpwd").value;
        var flag = 1;
        if (oldpwd == "") {
            document.getElementById("oldpwd").style.boxShadow = "inset 0 1px 1px white,0 0 8px red";
            document.getElementById("oldpwd").placeholder = "请输入旧密码";
            flag = 0;
        }
        if (newpwd == "") {
            document.getElementById("newpwd").style.boxShadow = "inset 0 1px 1px white,0 0 8px red";
            document.getElementById("newpwd").placeholder = "请输入新密码";
            flag = 0;
        }
        if (resetpwd == "") {
            document.getElementById("resetpwd").style.boxShadow = "inset 0 1px 1px white,0 0 8px red";
            document.getElementById("resetpwd").placeholder = "请再次输入新密码";
            flag = 0;
        }
        if (newpwd != resetpwd) {
            document.getElementById("resetpwd").style.boxShadow = "inset 0 1px 1px white,0 0 8px red";
            document.getElementById("resetpwd").value = "";
            document.getElementById("resetpwd").placeholder = "请输入一致的密码";
            flag = 0;
        }
        if (flag == 1) {
            alert("提交成功！");
            location.href = "SellerServlet?method=changePwd&oldpwd=" + oldpwd + "&newpwd=" + newpwd;
        }
    }
</script>
<body style="text-align: center; background-image: url(pictures/background.png)">
<div class="navbar navbar-inverse">
    <table class="title">
        <tr id="title_tr" align="center">
            <td width="60%" align="center"><a href="./setting.jsp" id="titleText">在 线 购 物 系 统</a></td>
            <td width="10%" class="title_td"><a href=upload.jsp" class="astyle">发布商品</a></td>
            <td width="10%" class="title_td"><a href="SellerServlet?method=viewHisGoods" class="astyle">历史商品</a></td>
            <td width="10%" class="title_td"><a href="SellerServlet?method=viewBuyerInfo" class="astyle">购买人</a></td>
            <td width="10%" class="title_td"><a href="./frozenGoods.jsp" class="astyle">冻结商品</a></td>
        </tr>
    </table>
</div>
<div style="margin: 0 auto; width: 50%; margin-top: 7%">
    <form action="" method="post">
        <div style="border: 5px #e4b9c0; border-radius: 10%; border-style: solid; background: lightskyblue; margin-left: 15%; margin-right: 15%; padding-bottom: 7%; padding-top: 5%">
            <div>
                <span style="font-size: xxx-large; color: whitesmoke; text-align: center">修改密码</span>
            </div>
            <table style="margin: 0 auto; border-spacing: 25px 25px; border-style: none" >
                <tr>
                    <td class="t2" width="30%">旧密码</td><td width="70%"><input type="password" name="oldpwd" class="i1" id="oldpwd"></td>
                </tr>
                <tr>
                    <td class="t2">新密码</td><td><input type="password" name="newpwd" class="i1" id="newpwd"></td>
                </tr>
                <tr>
                    <td class="t2" >确认密码</td><td><input type="password" name="resetpwd" class="i1" id="resetpwd"></td>
                </tr>
            </table>
            <span style="margin-right: 5%"><button class="bt1" type="button" onclick="panDuan()">提交</button></span><span><input type="reset" value="重置" class="i2"></span>
        </div>
    </form>
</div>

</body>
</html>
