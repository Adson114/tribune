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
    <title>personPage</title>

    <link rel="stylesheet" type="text/css" href="/static/css/ChangePersonAndPersonPage.css"/>
    <script src="../../static/js/jquery.js"></script>
    <script src="../../static/js/change.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<div id="main">
    <div class="sep15"></div>
    <div id="person">
        <div class="sep10"></div>
    <div id="photo" align="center">
        <div id="imgDiv2">
            <img src="/static/img/${face}" style="width: 150px;height: 150px" />
        </div>
        <div class="sep15"></div>

        <span name="personName" style="font-size: 20px">${userInfo}</span>

    </div>
    <div class="sep25"></div>
    <div id="all">
        <div class="sep10"></div>
        <h2>个性签名：</h2>
        <div id="autograph2">
            <c:forEach items="${changePersonList}" var="cpl">
                <c:out value="${cpl.declaration}"></c:out>
            </c:forEach>
        </div>
    </div>
        <div id="ad">
        </div>

    </div>
    <div id="contain">
        <div class="sep10"></div>
        <div id="postDiv">
            <table class="replyTable" border="1">
                <tr>
                    <th class="replyTh01">帖子主题</th>
                    <th class="replyTh02">创建时间</th>
                    <th class="replyTh04">帖子内容</th>
                    <th class="replyTh03">点击量</th>
                    <th class="replyTh03">操作</th>
                </tr>
                <c:forEach items="${list}" var="bot">
                    <tr>
                        <td><a href="/t/${bot.topicId}"><c:out value="${bot.title}"/></a></td>
                        <td><c:out value="${bot.localPublishTime}"/></td>
                        <td><c:out value="${bot.content}"/></td>
                        <td><c:out value="${bot.click}"/></td>
                        <td>
                            <input type="button" value="删除" name="del" id="${bot.topicId}" onclick="remove(this.id)"/>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="sep30"></div>
        <div id="replyDiv">
            <span style="font-size: 25px;font-weight: 700;margin-left: 20px">他/她回复：</span>
            <div class="sep10"></div>
                <table class="replyTable" border="1">
                    <tr>
                        <th class="replyTh01">帖子主题</th>
                        <th class="replyTh02">帖子作者</th>
                        <th class="replyTh04">回复内容</th>
                        <th class="replyTh02">回复时间</th>
                        <th class="replyTh03">操作</th>
                    </tr>
                    <c:forEach items="${list2}" var="rep">
                        <tr>
                            <td><a href="/t/${rep.topic.topicId}"><c:out value="${rep.topic.title}"/></a></td>
                            <td><c:out value="${rep.user.userName}"/></td>
                            <td><c:out value="${rep.content}"/></td>
                            <td><c:out value="${rep.localModifyTime}"/></td>
                            <td>
                                <input type="button" value="删除" name="del" id="${rep.replyId}" onclick="removeReply(this.id)"/>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>

