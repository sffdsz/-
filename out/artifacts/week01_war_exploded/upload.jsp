<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/9/21
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<style>
    body {
        font-family: verdana;
        font-size: 25px;
        background-color: lightblue;
        border-radius: 5px;
    }
    input[type=text], select {
        width: 300px;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    input[type=password], select {
        width: 300px;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    input[type=submit] {
        width: 145px;
        background-color: #4CAF50;
        color: white;
        padding: 14px 20px;
        margin: 8px 100px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    form{margin-left: 40%;}
    p.p {white-space:pre}
</style>
<form action="" method="post" enctype="multipart/form-data">
    商品名称：<input type="text" name="goodname"><br/>
    商品价格：<input type="text" name="goodprice"><br/>
    商品描述：<input type="text" name="description"><br/>
    图片上传：<input type="file" name="uploadFile" /><br/>
    <input type="submit" value="上传">
</form>
</body>
</html>
