<%--
  Created by IntelliJ IDEA.
  User: 烟雨如画
  Date: 2021/8/22
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新闻发布</title>
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
        input{
            width: 400px;
            border: 2px solid;
        }
        textarea{
            border: 2px solid;
            width: 400px;
            height: 300px;
        }
    </style>
</head>
<script>
    //发布
    $(function(){
        $("#btn").click(
            function () {
                $.post(
                    'save',
                    $("form").serialize(),
                    function (data) {
                        if(data==true){
                            //boolean
                            alert("发布成功,请等待审核!");
                            location.href="main.jsp";
                        }else{
                            alert("发布失败");
                        }
                    }
                )
            }
        )
    })
</script>
<body>
<form>
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span12">
                <h3>
                    新闻标题<input type="text" name="title">
                </h3>
                <h3>新闻内容</h3>
                <textarea placeholder="请输入你的内容" name="content">

                </textarea>
            </div>
        </div>
        <br>
        <input type="button" style="width:280px;" class="btn btn-default" id="btn" value="发布"/><br>
    </div>
</form>
</body>
</html>
