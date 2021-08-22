<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 烟雨如画
  Date: 2021/8/19
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <title>Title</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!--使用Bootstrap的js插件，必须先调入jQuery-->
    <script src="js/jquery-1.8.3.js" type="text/javascript"></script>
    <!-- 包括所有bootstrap的js插件或者可以根据需要使用的js插件调用　-->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <style>
        body{
            margin-left:auto;
            margin-right:auto;
            margin-TOP:60PX;
            font-size: 20px;
            background-color: #59eed1;
            width:20em;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <ul class="nav nav-list">
                <c:forEach var="item" items="${sessionScope.menus}" >
                    <li class="active">
                        <a href="${item.url}" target="${item.target}">${item.name}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
