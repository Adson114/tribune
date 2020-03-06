<%--
  Created by IntelliJ IDEA.
  User: GONG
  Date: 2020/2/17
  Time: 12:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn" %>
<html>
<head>
    <title>Title</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        #adminContent{
            margin-left: 150px;
        }


        #adminRight {
            width: 1200px;
            height: 900px;
            margin-left: 360px;
            margin-top: -700px;
            border: 1px solid #000;
        }

        .aSep20 {
            width: 100px;
            height: 20px;
        }

        #third {
            width: 1100px;
            height: 900px;
        }

        #replyTable {
            width: 1150px;
            height: 900px;
            margin-top: 50px;
            overflow-y: auto;
        }

        #textReplyTable {
            width: 1000px;
            margin-left: 100px;
            font-family: verdana,arial,sans-serif;
            border-collapse: collapse;
            border: 1px solid #000;
            table-layout:fixed;
        }

        #textReplyTable td{
            height: 30px;
            text-align: center;
            word-break:keep-all;
            white-space:nowrap;
            overflow:hidden;
            text-overflow:ellipsis;
        }

        #textReplyTable th{
            height: 40px;
            background: #d2d2d2;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="/static/css/admin.css"/>
    <script src="../../static/js/jquery.js"></script>
    <script>
        function delReply(id) {
            $.ajax({
                type:"POST",
                url:"/delReply",
                data:{
                    "id":id
                },
                success:function (data) {
                    window.location.reload(true);
                }
            });
        }
    </script>
</head>
<body>
<%@ include file="header.jsp" %>
<div id="adminContent">
    <div class="aSep20"></div>
    <%@ include file="adminBar.jsp" %>
    <div id="adminRight">
        <div id="third" style="overflow-y: auto">
            <div id="replyTable">
                <table id="textReplyTable" border="1">
                    <tr>
                        <th colspan="4" style="height: 50px;font-size: 30px;background: #8A8A8A">回帖管理</th>
                    </tr>
                    <col style="width: 250px" />
                    <col style="width: 150px" />
                    <col style="width: 550px" />
                    <col style="width: 50px" />
                    <tr>
                        <th>帖子标题</th>
                        <th>回复者</th>
                        <th>内容</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${adminToReply}" var="atr">
                        <tr>
                            <td><a href="/t/${atr.topic.topicId}"> <c:out value="${atr.topic.title}"/></a></td>
                            <td><c:out value="${atr.user.userName}"/></td>
                            <td><c:out value="${atr.content}"/></td>
                            <td><input type="button" value="删除" id="${atr.replyId}" onclick="delReply(this.id)"></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
    <div class="aSep20"></div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
