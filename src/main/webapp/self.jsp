<%--
  Created by IntelliJ IDEA.
  User: 烟雨如画
  Date: 2021/8/19
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>个人中心</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!--使用Bootstrap的js插件，必须先调入jQuery-->
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.min.js"></script>
    <!-- 包括所有bootstrap的js插件或者可以根据需要使用的js插件调用　-->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <style>
        body{
            margin-left:auto;
            margin-right:auto;
            margin-TOP:100PX;
            width:20em;
            background-color: #21d5ff;
        }
    </style>
</head>
<script>
    //修改
    $(function(){
        $("#btn").click(
            function () {
                $.post(
                    'update',
                    $("form").serialize(),
                    function (data) {
                        if(data==true){
                            //boolean
                            alert("修改成功");
                        }else{
                            alert("修改失败");
                        }
                    }
                )
            }
        )
    })
</script>
<body>
<form>
    <div class="input-group">
        <span class="input-group-addon" id="un">用户名</span>
        <input id="userName" name="username" type="text" class="form-control" value="${sessionScope.user.username}" aria-describedby="basic-addon1"/>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon" id="pw">密码</span>
        <input id="password" name="password" type="password" class="form-control" value="${sessionScope.user.password}" aria-describedby="basic-addon1"/>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon" id="cd">创建时间</span>
        <input id="create_date" disabled="true" type="text" class="form-control" value="${sessionScope.user.create_date}" aria-describedby="basic-addon1"/>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon" id="ag">年龄</span>
        <input id="age" name="age" type="text" class="form-control" value="${sessionScope.user.age}" aria-describedby="basic-addon1"/>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon" id="rl">角色</span>
        <input id="role" type="text" disabled="true" class="form-control" value="${sessionScope.user.role.rolename}" aria-describedby="basic-addon1"/>
    </div>
    <br>
    <input type="button" value="保存" id="btn"/>
    </form>
</body>
</html>
