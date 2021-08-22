<%--
  Created by IntelliJ IDEA.
  User: 烟雨如画
  Date: 2021/8/22
  Time: 17:51
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>新闻管理</title>
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
            background-color: #21d5ff;
        }
        td{
            width: 80px;
            white-space:nowrap;
            word-break:keep-all;
            overflow:hidden;
            text-overflow:ellipsis;
            text-align: center;
        }
    </style>
</head>
<script>
    $(function(){
        $.post(
            'newsmanage',
            function (data) {
            }
        )

        //全选
        var i=0;
        var j=0;
        $("#qx").on("click",function(){
            if(i==0){
                //把所有复选框选中
                $(".one").prop("checked", true);
                i=1;
            }else{
                $(".one").prop("checked", false);
                i=0;
            }

        });

        //全不选
        $("#qbx").on("click",function(){
            if(j==0){
                //把所有复选框选不选
                $(".one").prop("checked", false);
                j=1;
            }else{
                $(".one").prop("checked", true);
                j=0;
            }

        });
        //反选
        $("#fx").on("click",function(){

            $(".one").each(function(){
                //遍历所有复选框，然后取值进行 !非操作
                $(this).prop("checked", !$(this).prop("checked"));
            })
        });
    })

    function plsc() {
        var ids="";
        $(".one:checked").each(
            function () {
                var id=$(this).val();
                ids+=","+id;
            }

        )
        ids=ids.substring(1);
        //alert(ids);
        $.post(
            "disapprove",
            {
                type:"plsc",
                ids:ids
            },
            function (data) {
                if(data==1){
                    alert("删除成功");
                }else{
                    alert("删除失败");
                }
            }
        )
    }

    function changeSize() {
        var pageSize=$("#pageNo").val();
        location.href="newsmanage?currentPage=1&pageSize="+pageSize;
    }
    function toFirst() {
        var pageSize=$("#pageNo").val();
        location.href="newsmanage?currentPage=1&pageSize="+pageSize;
    }

    function toPrev() {
        var pageSize=$("#pageNo").val();
        location.href="newsmanage?currentPage=${sessionScope.page.prePage}&pageSize="+pageSize;
    }

    function toNext() {
        var pageSize=$("#pageNo").val();
        location.href="newsmanage?currentPage=${sessionScope.page.nextPage}&pageSize="+pageSize;
    }
    function toLast() {
        var pageSize=$("#pageNo").val();
        location.href="newsmanage?currentPage=${sessionScope.page.lastPage}&pageSize="+pageSize;
    }
</script>
<body>
<form>
    <table border="2px" cellpadding="4px" cellspacing="4px">
        <tr>
            <input type="button" id="approve" value="审核通过"/>
            <input type="button" id="disapprove" value="审核不通过"/>
        </tr>
        <tr>
            <td>
                <input type="checkbox" value="全选">
            </td>
            <td>新闻编号</td>
            <td>新闻标题</td>
            <td>新闻内容</td>
            <td>发布时间</td>
            <td>状态</td>
        </tr>
        <c:forEach var="n" items="${sessionScope.page.list}">
            <tr>
                <td>
                    <input type="checkbox" value="${n.nid}">
                </td>
                <td>${n.nid}</td>
                <td>${n.title}</td>
                <td>${n.content}</td>
                <td>${n.date}</td>
                <td>${n.status}</td>
            </tr>
        </c:forEach>
    </table>
    <input type="button" value="首页" onclick="toFirst()"/>
    <input type="button" value="上一页" onclick="toPrev()"/>
    当前页${sessionScope.page.pageNum}|${sessionScope.page.pages}总页数
    <input type="button" value="下一页" onclick="toNext()"/>
    <input type="button" value="尾页" onclick="toLast()"/>
    每页显示<input type="text" size="5" id="pageNo" value="${sessionScope.page.pageSize}">条记录
    <input type="button" onclick="changeSize()" value="查询">

</form>
</body>
</html>
