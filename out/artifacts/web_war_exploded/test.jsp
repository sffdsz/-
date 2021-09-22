<%--
  Created by IntelliJ IDEA.
  User: 咳咳
  Date: 2021/9/15
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>test</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/SellerServlet?method=login" method="post">
    sellername:<input name="sellername" value="" type="text"><br/>
    sellerpwd:<input name="sellerpwd" value="" type="pwd"><br/>
    <input value="登录" type="submit"><br/>
</form>
</body>
</html>
