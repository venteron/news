<%--
  Created by IntelliJ IDEA.
  User: 烟雨如画
  Date: 2021/8/19
  Time: 15:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>首页</title>
</head>
<frameset rows="15%,*" border="1">
    <frame src="top.jsp">
    <frameset cols="20%,*" border="1">
        <frame src="left.jsp" style="background-color: aqua"/>
        <frame src="main.jsp" name="main" style="background-color: aquamarine"/>
    </frameset>
</frameset>
</html>