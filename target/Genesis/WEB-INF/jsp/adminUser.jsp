<%--
  Created by IntelliJ IDEA.
  User: GONG
  Date: 2020/2/17
  Time: 12:29
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
        #createUserTable th{
            width: 200px;
            height: 50px;
            background-color: #8A8A8A;
        }

        #createUserTable td{
            width: 320px;
        }

        .createDiv{
            height: 50px;
        }

        .createDiv input{
            width: 200px;
            height: 45px;
            margin-left: 60px;
            font-size: 25px;
        }

        #textUserTable td{
            height: 30px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="/static/css/admin.css"/>
    <script src="../../static/js/jquery.js"></script>
    <script>
        function showTable() {
            var sty1=$("#createUserTable").css('display');
            if(sty1=="none"){
                $("#createUserTable").css('display','block');
                $("#userTable").css('display','none');
            }else{
                $("#createUserTable").css('display','none');
                $("#userTable").css('display','block');
            }
        }
        function toName(){
            $.ajax({
                url:"/toRegister",
                type:"POST",
                data:{
                    "name":$("#userName").val().trim()
                },

                success:function (data) {
                    if(data.toString()==="ok"){
                        $("#nameSpan").css("color","green");
                    }else{
                        $("#nameSpan").css("color","red");
                    }
                    $("#nameSpan").html(data);
                }
            });
        }
        function addUser() {
            $.ajax({
                type:"POST",
                url:"/addUser",
                data:{
                    "uName":$("#userName").val().trim(),
                    "pwd":$("#password").val().trim(),
                    "tName":$("#trueName").val().trim(),
                    "sex":$("#sex").val(),
                    "email":$("#email").val().trim(),
                    "mobile":$("#mobile").val().trim(),
                },
                success:function (data) {
                    window.location.reload(true);
                }
            });
        }
        function delUser(id) {
            $.ajax({
                type:"POST",
                url:"/delUser",
                data:{
                    "id":id
                },
                success:function (data) {
                    window.location.reload(true);
                }
            });
        }

    </script>
</head>
<body>
<%@ include file="header.jsp" %>
<div id="adminContent">
    <div class="aSep20"></div>
    <%@ include file="adminBar.jsp" %>
    <div id="adminRight">
        <div id="first" style="overflow-y: auto">
            <div class="createDiv">
                <input type="button" value="增加" id="increase" onclick="showTable()">
                <form action="/addUser" method="post">
                    <table id="createUserTable" border="1" style="display: none">
                        <tr>
                            <th colspan="7" style="background-color: #cccccc;font-size: 30px;">增加用户</th>
                        </tr>
                        <tr>
                            <th>用户名</th>
                            <td><input type="text" id="userName" required onblur="toName()">
                                <p id="nameSpan" style="display: inline-block"></p></td>
                        </tr>
                        <tr>
                            <th>密码</th>
                            <td><input type="text" id="password"></td>
                        </tr>
                        <tr>
                            <th>真实姓名</th>
                            <td><input type="text" id="trueName"/></td>
                        </tr>
                        <tr>
                            <th>性别</th>
                            <td style="text-align: center;">
                                <select id="sex" name="sex" style="width: 100px;height: 40px;font-size: 20px;text-align: center;">
                                    <option class="sexValue" value="男">男</option>
                                    <option class="sexValue" value="女">女</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>邮箱</th>
                            <td><input type="text" id="email">
                        </tr>
                        <tr>
                            <th>手机</th>
                            <td><input type="text" id="mobile"></td>
                        </tr>
                        <tr>
                            <th>操作</th>
                            <td><input type="button" value="确定" onclick="addUser()"></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div id="userTable">
                <table id="textUserTable" border="1">
                    <tr>
                        <th colspan="7" style="height: 50px;font-size: 30px;background: #8A8A8A">用户管理</th>
                    </tr>
                    <col style="width: 150px" />
                    <col style="width: 150px" />
                    <col style="width: 150px" />
                    <col style="width: 40px" />
                    <col style="width: 220px" />
                    <col style="width: 150px" />
                    <col style="width: 60px" />
                    <tr>
                        <th class="adIf">用户名</th>
                        <th class="adIf">密码</th>
                        <th class="adIf">真实姓名</th>
                        <th class="adIf">性别</th>
                        <th class="adIf">邮箱</th>
                        <th class="adIf">手机</th>
                        <th class="adIf">操作</th>
                    </tr>
                    <c:forEach items="${adminToUser}" var="atu">
                        <tr>
                            <td><c:out value="${atu.userName}"/></td>
                            <td><c:out value="${atu.password}"/></td>
                            <td><c:out value="${atu.trueName}"/></td>
                            <td><c:out value="${atu.sex}"/></td>
                            <td><c:out value="${atu.email}"/></td>
                            <td><c:out value="${atu.mobile}"/></td>
                            <td><input type="button" value="删除" id="${atu.userId}" onclick="delUser(this.id)"></td>
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
