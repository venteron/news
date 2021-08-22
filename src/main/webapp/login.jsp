<%--
  Created by IntelliJ IDEA.
  User: 62787
  Date: 2021/8/6
  Time: 8:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!--使用Bootstrap的js插件，必须先调入jQuery-->
    <script src="js/jquery-1.8.3.js" type="text/javascript"></script>
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

    //登录
    $(function(){
        $("#btn").click(
            function () {
                $.post(
                    'login',
                    $("form").serialize(),
                    function (data) {
                        if(data==true){
                            //boolean
                            alert("登录成功");
                            location.href="index.jsp";
                        }else{
                            alert("登录失败");
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
        <input id="userName" name="username" type="text" class="form-control" placeholder="用户名" aria-describedby="basic-addon1">
    </div>
    <br>
    <!--下面是密码输入框-->
    <div class="input-group">
        <span class="input-group-addon" id="pw">密码</span>
        <input id="passWord" name="password" type="password" class="form-control" placeholder="密码" aria-describedby="basic-addon1">
    </div>
    <br>

    <!--下面是登陆按钮,包括颜色控制-->

    <input type="button" style="width:280px;" class="btn btn-default" id="btn" value="登录"/><br>
    <a href="register.jsp" class="">立即注册</a>
</form>

</body>
</html>
