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
    <title>Header</title>
    <link rel="stylesheet" type="text/css" href="/static/css/HeaderAndFooter.css"/>
</head>
<body>
<div id="header">
    <div id="content">
        <div style="padding-top: 15px">
            <table>
                <tbody>
                <td width="110" align="left" style="padding-left: 50px;">
                    <a href="/allView" name="head" title=" way to explore" >
                        <div id="logo">和谐论坛</div>
                    </a>
                </td>

                <c:if test="${empty userInfo}">

                <td width="570px" align="right" style="padding-top: 2px;padding-right: 50px;font-size: 20px">
                    <a href="/allView" class="top">首页</a>&nbsp;&nbsp;&nbsp;
                    <a href="/login" class="top">登录</a>&nbsp;&nbsp;&nbsp;
                    <a href="/register" class="top">注册</a>
                </td>
                </c:if>

                <c:if test="${!empty userInfo}">

                    <td width="570px" align="right" style="padding-top: 2px;padding-right: 10px;font-size: 20px">
                        <a href="/allView" class="top">首页</a>&nbsp;&nbsp;&nbsp;
                        <a href="/changePerson" class="top">${userInfo}</a>&nbsp;&nbsp;&nbsp;
                        <c:if test="${!empty type}">
                        <a href="/toAdmin" class="top">管理界面</a>
                        </c:if>
                        <a href="/toChangeInfo" class="top">个人设置</a>&nbsp;&nbsp;&nbsp;
                        <a href="/out" class="top">退出</a>
                    </td>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
　<script type="text/javascript" src="https://cdn.bootcss.com/canvas-nest.js/1.0.1/canvas-nest.min.js"></script>
<script src="../../static/js/gif.js"></script>
</html>
