<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户登录</title>
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
<body>
<form>
    <div class="input-group">
        <span class="input-group-addon" id="un">用户名</span>
        <input id="userName" type="text" name="username" class="form-control" placeholder="用户名" aria-describedby="basic-addon1">
    </div>
    <br>
    <!--下面是密码输入框-->
    <div class="input-group">
        <span class="input-group-addon" id="pw1">密码</span>
        <input id="passWord1" type="password" name="password" class="form-control" placeholder="密码" aria-describedby="basic-addon1">
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon" id="pw2">确认密码</span>
        <input id="passWord2" type="password" class="form-control" placeholder="确认密码" aria-describedby="basic-addon1">
    </div>
    <br>
    <!--下面是登陆按钮,包括颜色控制-->

    <button type="button" style="width:280px;" class="btn btn-default" id="btn">注册</button>
    <a href="login.jsp">登录</a>
</form>
</body>
<script>
    $(
        function () {
            $("#btn").click(
                function () {
                    $.post(
                        "register",
                        $("form").serialize(),
                        function (data) {
                            if(data==true){
                                alert("注册成功");
                                //返回到登录前的页面
                                location.href="login.jsp"
                            }else{
                                alert("用户名已存在");
                            }
                        }
                    )
                }
            )
        }
    )
</script>
</html>