<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/9/15
  Time: 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>商家登录页面</title>
  </head>
  <body>
  <style>
    #title{
          color: black;
          margin-left: 45%;
          font-size: 30px;
    }
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
  <p id="title">商家登录</p>
  <form action="Login_handle.jsp" method="post">
    用户名：<input type="text" name="username"/><br/>
      <p class="p">密  码：<input type="password" name="password"/></p>
    <input type="submit" value="登录"/>
  </form>
  </body>
</html>
