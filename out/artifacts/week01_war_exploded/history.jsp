<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2021/9/21
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="week01.Good"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="week01.Repository" %>
<%@ page import="java.util.Iterator" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        body {
            font-family: verdana;
            font-size: 25px;
            background-color: lightblue;
            border-radius: 5px;
        }
        table.gridtable {
            font-family: verdana,arial,sans-serif;
            font-size:11px;
            color:#333333;
            border-width: 1px;
            border-color: #666666;
            border-collapse: collapse;
        }
        table.gridtable th {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #dedede;
        }
        table.gridtable td {
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #666666;
            background-color: #ffffff;
        }
    </style>
</head>
<body>
    <%
        Repository repo1 =new Repository();
        ArrayList<Good> goodlist=new ArrayList<Good>();
        Good g=null;
        for(int i=0;i<100;i++)
        {
            g=new Good();
            g.setGoodName("good"+i);
            g.setPrice("10");
            goodlist.add(g);
        }
        repo1.setRepo(goodlist);
        session.setAttribute("hisgoodlist", repo1);
        Repository repo=(Repository)session.getAttribute("hisgoodlist");
        ArrayList<Good> glist=repo.getRepo();
        Iterator<Good> glter=glist.iterator();
    %>
<table border="1" class="gridtable">
    <tr>
        <th>商品名称</th>
        <th>商品价格</th>
        <th>商品描述</th>
        <th>商品图片</th>
    </tr>
    <%
        while(glter.hasNext()){
            g=glter.next();
    %>
    <tr>
        <td><%=g.getGoodName()%></td>
        <td><%=g.getPrice()%></td>
<%--        <td><%=g.getDescription()%></td>--%>
<%--        <td><img src="<%=g.getPictures()%>"></td>--%>
    </tr>
    <%}%>
</table>
<a href="setting.jsp">返回</a>
</body>
</html>
