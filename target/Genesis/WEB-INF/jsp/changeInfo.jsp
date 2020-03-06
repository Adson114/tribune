<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hz.bean.Topic" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="multipart/form-data;charset=utf-8" />
    <style>
        #main{
            width: 1000px;
            height: 1000px;
            margin-top: 20px;
            margin-left: 200px;
            position: absolute;
        }

        #infoTable th{
            width: 300px;
            height: 50px;
            font-size: 25px;
            text-align: center;
        }

        #infoTable td{
             width: 300px;
             height: 50px;
            text-align: center;
         }

        p{
            margin-left: 20px;
        }

        #changeDiv input{
            width: 100px;
            height: 30px;
            margin-left: 250px;
        }

    </style>
    <link rel="stylesheet" type="text/css" href="/static/css/ChangeAndSetInfo.css"/>
    <script src="../../static/js/jquery.js"></script>
    <script src="../../static/js/change.js"></script>
</head>

<%@ include file="header.jsp" %>
    <div>
<div style="width: 1720px">
<div class="sep20"></div>
<div id="main">
    <div class="sep20"></div>
    <div id="leftDiv">
        <c:forEach items="${list}" var="list">
        <div class="sep20"></div>
        <div id="photoDiv">
            <span id="photoSpan"><img src="/static/img/<c:out value="${list.face}"/>" id="img1" /> </span>
        </div>
        <div class="sep30"></div>
        <div id="infoDiv">
            <table border="1" id="infoTable">
                <tr>
                    <th>昵称</th>
                    <td><c:out value="${list.userName}"/></td>
                </tr>
                <tr>
                    <th>真实姓名</th>
                    <td><c:out value="${list.trueName}"/> </td>
                </tr>
                <tr>
                    <th>注册时间</th>
                    <td><c:out value="${list.localCreateTime}"/> </td>
                </tr>
                <tr>
                    <th>邮箱</th>
                    <td><c:out value="${list.email}"/> </td>
                </tr>
                <tr>
                    <th>电话</th>
                    <td><c:out value="${list.mobile}"/> </td>
                </tr>
                <tr style="display: none">
                    <th>userId</th>
                    <td> <input id="uId" name="uId" value="<c:out value="${list.userId}"/>" style="display: none"/> </td>
                </tr>
            </table>
        </div>
        <div class="sep30"></div>
        <div id="declarationDiv">
            <div id="personTxt">个人宣言：</div>
            <div id="declaration">
                <span><c:out value="${list.declaration}"/> </span>
            </div>
            <div class="sep30"></div>
            <div class="sep20"></div>

                <div id="changeDiv">
                    <div  class="sep20"></div>
                    <input type="button" value="修改" onclick="append()"> </div>

            <div id="sep20" class="sep20"></div>
        </div>
        </c:forEach>
    </div>

</div>
    <%@ include file="side.jsp" %>
</div>


<%@ include file="footer.jsp" %>
</div>
</body>
</html>