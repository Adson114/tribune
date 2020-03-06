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
    <link rel="stylesheet" type="text/css" href="/static/css/main.css"/>
    <script src="../../static/js/jquery.js"></script>
    <script>
        $(document).ready(function () {
            var con=document.getElementById("textContent").innerText;
            console.log(con);
            if (con.length> 25) {
                var result = "";
                result = con.substring(0, 25) + "...";
                console.log(result);
                document.getElementById("textContent").innerHTML= result;
            }

        });
    </script>
</head>
<body>
<%@ include file="header.jsp" %>

<div id="firstDiv">
    <div id="outFirst">
        <div class="sep20"></div>
        <div id="tab">
            <ul class="title">
                <li class="allTitle"><a href="/allView">全部</a></li>
                <c:forEach items="${tabList}" var="tab">
                    <li><a href="/tab/${tab.tabId}"><c:out value="${tab.tabName}"/> </a></li>
                </c:forEach>
            </ul>
        </div>
        <div style="margin-left: 300px;">
            <p>每页${page.pageSize}条 当前页${page.size}条${page.pageNum}/${page.pages}页 记录数${page.total}</p>
            <c:if test="${page.isFirstPage==true}"><a>首页</a></c:if>
            <c:if test="${page.isFirstPage==false}"><a href="/allView?pn=1">首页</a> </c:if>
            <c:if test="${page.hasPreviousPage==true}"><a href="/allView?pn=${page.prePage}">上一页</a> </c:if>
            <c:if test="${page.hasPreviousPage==false}"><a>上一页</a></c:if>
            <c:if test="${page.hasNextPage==true}"><a href="/allView?pn=${page.nextPage}">下一页</a> </c:if>
            <c:if test="${page.hasNextPage==false}"><a>下一页</a></c:if>
            <c:if test="${page.isLastPage==true}"><a>末页</a></c:if>
            <c:if test="${page.isLastPage==false}"><a href="/allView?pn=${page.pages}">末页</a> </c:if>
        </div>
        <div id="contentDiv">

                <div class="sep20"></div>
            <c:forEach items="${list}" var="topic">
                <div id="container" style="width: 930px">

                    <ul>
                        <li>
                            <div id="sonTitle">
                                <a href="/t/${topic.topicId}"><c:out value="${topic.title}"/></a>
                                <div id="textContent">
                                    正文：&nbsp; &nbsp; <c:out value="${topic.content}"/>
                                </div>
                            </div>
                            <div id="sonCon">
                                <span>作者：<a href="/p/${topic.user.userName}"><c:out value="${topic.user.userName}"/></a></span>&nbsp;&nbsp;
                                <span>发布日期：<c:out value="${topic.localPublishTime}"/></span>&nbsp;&nbsp;
                                <span>点击量：<c:out value="${topic.click}"/></span>
                            </div>
                        </li>
                    </ul>
                </div>
            </c:forEach>
        </div>

    </div>
    <%@ include file="side.jsp" %>
</div>
<%@ include file="footer.jsp" %>
</body>

</html>
