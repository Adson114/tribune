<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hz.bean.Topic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn" %>
<html>
<head>
    <title>send</title>
    <style>
        #sendSelect{
            display: inline-block;
            width: 100px;
            height: 34px;
            padding: 6px 12px;
            font-size: 14px;
            color: #555;
            background: #fff;
            border: 1px solid #000;
            border-radius: 4px;
            margin-left: 30px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="/static/css/DetailAndSend.css"/>
    <script src="../../static/js/jquery.js"></script>
    <script src="../../static/js/change.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<div id="sendMainDiv">
    <div class="sep20"></div>
    <form action="/insertContain"method="post" onsubmit="return verify()">
    <div id="sendTxtDiv">
        <div class="sep20"></div>
        <div id="sendTitle">
            <span>帖子标题</span>
            <div id="sendInput">
                <input type="text" id="titleInput" name="title" maxlength="15" placeholder="必填！最多15个字" required>
            </div>
        </div>
        <div class="sep20"></div>
        <div id="sendTab">
            <span>板块选择</span>
            <select id="sendSelect" name="tab">
                <c:forEach items="${sendTabList}" var="stl">
                <option class="selectValue" value="<c:out value="${stl.tabId}"/>"><c:out value="${stl.tabName}"/></option>
                </c:forEach>
            </select>
        </div>
        <div class="sep20"></div>
        <div><h1 style="margin-left: 40px;">正文：</h1></div>
        <div id="sendContain">
            <textarea id="area" name="area" placeholder="在这里输入内容..." required></textarea><br>
        </div>
        <div class="sep20"></div>
        <div id="sendBtn">
            <input type="submit"value="发表" id="inputBtn">
            <input type="button"value="返回首页" id="returnBtn" onclick="returnMain()">
        </div>
        <p id="contentP"></p>
    </div>
    </form>

</div>
<%@ include file="footer.jsp" %>
</body>
</html>
