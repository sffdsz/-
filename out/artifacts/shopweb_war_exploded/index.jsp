<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/9/15
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
<form action="${pageContext.request.contextPath}/UserServlet" method="post">
    userid:<input type="text" name="userid"><br>
    username:<input type="text" name="username"><br>
    userphone:<input type="text" name="userphone"><br>
    transactionaddress:<input type="text" name="transactionaddress"><br>
    <input type="submit" value="提交">
  </form>
 <%-- <form action="${pageContext.request.contextPath}/goodidServlet" method="post">
    <input type="text" name="chaxun"><br>
    <input type="submit" value="提交">
  </form>--%>


  </body>
</html>
