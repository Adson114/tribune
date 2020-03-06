<%--
  Created by IntelliJ IDEA.
  User: GONG
  Date: 2020/2/17
  Time: 12:35
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



        #textTopicTable td{
            height: 30px;
            text-align: center;
            word-break:keep-all;
            white-space:nowrap;
            overflow:hidden;
            text-overflow:ellipsis;
        }

        #textTopicTable th{
            height: 40px;
            background: #d2d2d2;
        }

    </style>
    <link rel="stylesheet" type="text/css" href="/static/css/admin.css"/>
    <script src="../../static/js/jquery.js"></script>
    <script>
        function delTopic(id) {
            $.ajax({
                type:"POST",
                url:"/delTopic",
                data:{
                    "id":id
                },
                success:function (data) {
                    window.location.reload(true);
                }
            });
        };
        function makeSure(id) {
            $.ajax({
                type:"POST",
                url:"/makeSure",
                data:{
                    "id":id
                },
                success:function (data) {
                    window.location.reload(true);
                }
            });
        };
        function canxel(id) {
            $.ajax({
                type:"POST",
                url:"/canxel",
                data:{
                    "id":id
                },
                success:function (data) {
                    window.location.reload(true);
                }
            });
        };

    </script>
</head>
<body>
<%@ include file="header.jsp" %>
<div id="adminContent">
    <div class="aSep20"></div>
    <%@ include file="adminBar.jsp" %>
    <div id="adminRight">
        <div id="second" style="overflow-y: auto">
            <div id="topicTable">
                <table id="textTopicTable" border="1">
                    <th colspan="6" style="height: 50px;font-size: 30px;background: #8A8A8A">帖子管理</th>
                    <col style="width: 200px" />
                    <col style="width: 380px" />
                    <col style="width: 200px" />
                    <col style="width: 60px" />
                    <col style="width: 60px" />
                    <col style="width: 200px" />
                    <tr>
                        <th>标题</th>
                        <th>内容</th>
                        <th>作者</th>
                        <th>板块</th>
                        <th>是否加精</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${adminToTopic}" var="att">
                        <tr>
                            <td style="display: none"><c:out value="${att.topicId}"/></td>
                            <td><a href="/t/${att.topicId}"> <c:out value="${att.title}"/></a></td>
                            <td><c:out value="${att.content}"/></td>
                            <td><c:out value="${att.user.userName}"/></td>
                            <td><c:out value="${att.tab.tabName}"/></td>
                            <td><c:out value="${att.good}"/></td>
                            <td>
                                <input type="button" value="删除" id="${att.topicId}" onclick="delTopic(this.id)">
                                <input type="button" value="加精" id="${att.topicId}" onclick="makeSure(this.id)">
                                <input type="button" value="取消加精" id="${att.topicId}" onclick="canxel(this.id)">
                            </td>
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
