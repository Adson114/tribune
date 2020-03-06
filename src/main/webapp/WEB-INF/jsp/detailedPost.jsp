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
    <title>Title</title>
    <style>
        #replyBtn input{
            width: 200px;
            height: 40px;
            font-size: 25px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="/static/css/DetailAndSend.css"/>
    <script src="../../static/js/jquery.js"></script>
    <script src="../../static/js/change.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<div id="detailedContain">
    <div id="detailedTitle">
        <c:forEach items="${list1}" var="list1">
        <div id="postMain">
            <c:out value="${list1.content}"/>
        </div>
        <div id="postTitle"><c:out value="${list1.title}"/></div>
        <div id="personInfo">
            <span class="sFontWeight">作者:</span><span><c:out value="${list1.user.userName}"/></span>&nbsp;&nbsp;&nbsp;
            <span class="sFontWeight">时间:</span><span><c:out value="${list1.localPublishTime}"/></span>&nbsp;&nbsp;&nbsp;
            <span class="sFontWeight">点击次数:</span><span><c:out value="${list1.click}"/></span>次
            </c:forEach>
        </div>
        <div class="sep30"></div>

        <div id="detailedReply">
            <p style="margin: 5px;font-weight: 600">回复的次数:&nbsp;<span>${count}</span></p>
            <c:forEach items="${list2}" var="list2">
                <div id="replyCount">
                    <span class="sFontWeight">回复者:</span>
                    <span><c:out value="${list2.user.userName}"/></span>&nbsp;&nbsp;&nbsp;
                    <span class="sFontWeight">回复时间:</span>
                    <span><c:out value="${list2.localModifyTime}"/></span>
                </div>
                <div id="replyContain">
                    <c:out value="${list2.content}"/>
                </div>
            </c:forEach>
        </div>

        <c:if test="${!empty userId}">

            <div class="sep30"></div>
            <div id="toReply">
                <div id="sentence"><p>添加一条新回复</p></div>
                <form action="/insertReply" method="post">
                    <input name="id" id="id" value="${topicId}" style="display: none"/>
                    <div id="replyArea">
                        <textarea id="textArea" name="area"></textarea>
                    </div>
                    <div id="replyBtn">
                        <input type="button" value="回复" onclick="insertReply()">
                    </div>


                </form>
            </div>
        </c:if>
    </div>
    <%@ include file="side.jsp" %>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
