<%--
  Created by IntelliJ IDEA.
  User: GONG
  Date: 2020/2/17
  Time: 12:42
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
        #createTabTable tbody th{
            width: 600px;
            height: 50px;
        }

        input{
            height: 35px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="/static/css/admin.css"/>
    <script src="../../static/js/jquery.js"></script>
    <script>
        function addTab() {
            $.ajax({
                type:"POST",
                url:"/addTab",
                data:{
                    "tabCh":$("#tabCh").val().trim(),
                    "tabEn":$("#tabEn").val().trim()
                },
                success:function (data) {
                    window.location.reload(true);
                }
            });
        }
        function toCh(){
            $.ajax({
                url:"/toCh",
                type:"POST",
                data:{
                    "tabCh":$("#tabCh").val().trim()
                },

                success:function (data) {
                    if(data.toString()==="ok"){
                        $("#chSpan").css("color","green");
                    }else{
                        $("#chSpan").css("color","red");
                    }
                    $("#chSpan").html(data);
                }
            });
        }
        function delTab(id) {
            $.ajax({
                type:"POST",
                url:"/delTab",
                data:{
                    "id":id
                },
                success:function (data) {
                    window.location.reload(true);
                }
            });
        }
        function showTabTable() {
            var sty1=$("#createTabTable").css('display');
            if(sty1=="none"){
                $("#createTabTable").css('display','block');
                $("#tabTable").css('display','none');
            }else{
                $("#createTabTable").css('display','none');
                $("#tabTable").css('display','block');
            }
        }

    </script>
</head>
<body>
<%@ include file="header.jsp" %>
<div id="adminContent">
    <div class="aSep20"></div>
    <%@ include file="adminBar.jsp" %>
    <div id="adminRight">
        <div id="fourth" style="overflow-y: auto">
            <div class="createDiv">
                <input type="button" value="增加" id="increaseTab" onclick="showTabTable()">
                <table id="createTabTable" border="1" style="display: none">
                    <tr>
                        <th colspan="3" style="background-color: #cccccc;font-size: 30px;">增加板块</th>
                    </tr>
                    <tr>
                        <td style="width: 250px;height:40px;text-align: center">板块中文名</td>
                        <td style="width: 250px;height:40px;text-align: center">板块英文名</td>
                        <td>操作</td>
                    </tr>
                    <tr>
                        <td style="width: 250px;height:40px;text-align: center"><input type="text" id="tabCh" required onblur="toCh()">
                            <p id="chSpan"></p></td>
                        <td style="width: 250px;height:40px;text-align: center"><input type="text" id="tabEn" required></td>
                        <td style="width: 250px;height:40px;text-align: center"><input type="button" value="确定" onclick="addTab()" style="width: 100px"></td>
                    </tr>
                </table>
            </div>
            <div id="tabTable">
                <table id="textTabTable" border="1">
                    <tr>
                        <th colspan="3" style="height: 50px;font-size: 30px;background: #8A8A8A">板块管理</th>
                    </tr>
                    <tr>
                        <td class="tabName">板块中文名</td>
                        <td class="tabName">板块英文名</td>
                        <td class="tabName">操作</td>
                    </tr>
                    <c:forEach items="${adminToTab}" var="adta">
                        <tr>
                            <td><c:out value="${adta.tabName}"/></td>
                            <td><c:out value="${adta.tabNameEn}"/></td>
                            <td><input type="button" value="删除" id="${adta.tabId}" onclick="delTab(this.id)" style="width: 80px"></td>
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
