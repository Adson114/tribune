<%--
  Created by IntelliJ IDEA.
  User: GONG
  Date: 2020/1/29
  Time: 19:34
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
    <title>Footer</title>
        <link rel="stylesheet" type="text/css" href="/static/css/HeaderAndFooter.css">
</head>
<body>

<div id="footer">

    <div id="containerFooter">
        本论坛提供给大家一个安全、绿色的交流环境，我们立志于为互联网社会贡献自己的绵薄之力。
        <br/><br/><br/>
        <p>Designed by </span> Gong</p>
        <div id="container2">
<%--            <div class="info">--%>
<%--                <p>统计信息</p>--%>
<%--                <ul>--%>
<%--                    <li>会员数:</li>--%>
<%--                    <li>话题数:</li>--%>
<%--                </ul>--%>
<%--            </div>--%>
            <div class="info">
                <p>友情链接</p>
                <ul>
                    <li><a href="https://www.github.com">Github</a></li>
                    <li><a href="https://segmentfault.com">SegmentFault</a></li>
                    <li><a href="https://www.v2ex.com">v2ex</a></li>
                </ul>
            </div>
            <div class="info">
                <p>其他信息</p>
                <ul>
                    <li><a href="#">关于本站</a></li>
                    <li><a href="#">联系我们</a></li>
                </ul>
            </div>
        </div>
    </div>

</div>

</body>
</html>
