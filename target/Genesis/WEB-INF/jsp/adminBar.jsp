<%--
  Created by IntelliJ IDEA.
  User: GONG
  Date: 2020/2/17
  Time: 12:26
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
        #adminLeft li{
            width: 270px;
            height: 40px;
            margin-bottom: 30px;
            list-style-image: none;
            list-style-type: none;
            border-right-color: #000000;
            box-sizing: border-box;
        }

        li input{
            width: 200px;
            height: 50px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="/static/css/admin.css"/>
    <script>
        function appearUser() {
            window.location.href="/toAdmin";
        }
        function appearTopic() {
            window.location.href="/toATopic";
        }
        function appearReply() {
            window.location.href="/toAReply";
        }
        function appearTab() {
            window.location.href="/toATab";
        }
        function returnTribune() {
            window.location.href="/allView";
        }
    </script>
</head>
<body>
<div id="adminLeft">
    <div id="imgDiv">
        <img src="/static/img/${face}" style="width: 100px; height:100px" />
        <span style="text-align: center ;font-size: 20px">${userInfo}</span>
    </div>
    <div class="aSep30"></div>
    <ul>
        <li><input type="button" value="用户管理" id="userAD" onclick="appearUser()"></li>
        <li><input type="button" value="帖子管理" id="topicAD" onclick="appearTopic()"></li>
        <li><input type="button" value="回复管理" id="replyAD"onclick="appearReply()"></li>
        <li><input type="button" value="板块管理" id="tabAD"onclick="appearTab()"></li>
        <li><input type="button" value="返回论坛主页" id="return"onclick="returnTribune()"></li>
    </ul>
</div>
</body>
</html>
