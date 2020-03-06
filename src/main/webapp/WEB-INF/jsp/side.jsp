<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn" %>
<html>
<head>
    <title>side</title>
        <link rel="stylesheet" type="text/css" href="/static/css/side.css"/>
    <script src="../../static/js/jquery.js"></script>
    <script>
        function toSend() {
            window.location.href = "/send";
        }

        $(document).ready(function () {
            var temp=document.getElementById("hotUl").getElementsByTagName("li").length;
            console.log(temp);
            for(var i=0;i<temp;i++) {
                var lis = document.getElementsByClassName("hotTitle")[i].innerHTML;
                console.log(lis);
                if (lis.length> 10) {
                    var result = "";
                    result = lis.substring(0, 10) + "...";
                    console.log(result);
                    document.getElementsByClassName("hotTitle")[i].innerHTML = result;
                }
            }
        });
    </script>
</head>
<body>
<div id="outRight">
    <div class="box">
        <div class="cell" style="font-size: 20px">
            <strong>XXX是大家交流分享的地方</strong>
            <div class="sep5"></div>
        </div>

        <c:if test="${empty userInfo}">
            <div class="inner">
                <div class="sep5"></div>
                <div class="sep10"></div>
                <div align="center" id="center" style="font-size: 20px">
                    <div class="sep70"></div>
                    <a href="/register" class="super normal button" style="font-size: 20px">注册</a>
                    <div class="sep5"></div>
                    <div class="sep70"></div>
                    已注册用户请先&nbsp;&nbsp;<a href="/login">登录</a>
                </div>
            </div>
        </c:if>

        <c:if test="${!empty userInfo}">
            <div class="inner">
                <div class="sep5"></div>
                <div class="sep10"></div>
                <div align="center" id="hideCenter">
                    <div id="imgDiv">
                        <img src="/static/img/${face}" style="width: 100px; height:100px"/>
                    </div>
                    <div class="sep10"></div>
                    <a href="/changePerson" style="font-size: 20px">${userInfo}</a>
                    <div class="sep10"></div>
                    <input type="button" value="发帖" onclick="toSend()"style="width: 80px;height: 30px">
                </div>
            </div>
        </c:if>
    </div>
    <div class="sep20" style="width: 270px;height: 70px"></div>
    <div class="box2">
        <div id="inner">
            <%@ include file="calendar.jsp" %>
        </div>
    </div>
    <div class="sep20"></div>
    <div class="box" id="TopicHot">
        <div class="cell">
            <div class="sep20"></div>
            <span class="fade">热议主题</span>
        </div>
        <div class="sep20"></div>
        <div class="sep20"></div>
        <div class="sep20"></div>
        <div id="cell">
            <ul id="hotUl">
                <c:forEach items="${goodList}" var="gl">
                    <li><a href="/t/${gl.topicId}" class="hotTitle"> <c:out value="${gl.title}"/></a></li>
                </c:forEach>

            </ul>
        </div>
    </div>
</div>
</body>
</html>
