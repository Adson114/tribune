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
    <meta http-equiv="Content-Type" content="multipart/form-data;charset=utf-8"/>
        <style>
            #main{
                width: 1300px;
                height: 1520px;
                margin-left: 300px;
            }

            #setTable th{
                width: 200px;
                font-size: 25px;
                font-weight: 500;
            }

            #setTable td{
                width: 400px;
            }

            #setTable td input{
                width: 400px;
                height: 49px;
            }

            p{
                margin-top: 30px;
                margin-left: 20px;
                margin-bottom: 20px;
                font-size: 28px;
                font-weight: 500;
            }

            #headDiv form{
                margin-top: 5px;
            }

            #headDiv form input{
                margin-left: 132px;
            }

            #footDiv textarea{
                margin-left: 50px;
            }
            #footDiv button{
                width: 150px;
                height: 50px;
                float: right;
                margin-right: 50px;
                margin-top: 30px;
            }

        </style>
    <link rel="stylesheet" type="text/css" href="/static/css/ChangeAndSetInfo.css"/>
    <script src="../../static/js/jquery.js"></script>
    <script src="../../static/js/change.js"></script>
    <script>
        function updateUser(id) {
            $.ajax({
                type: "POST",
                url: "/updateUser",
                data: {
                    "uId": $("#uId").val().trim(),
                    "uName": $("#uName").val().trim(),
                    "uPassword": $("#uPassword").val().trim(),
                    "uEmail": $("#uEmail").val().trim(),
                    "uMobile": $("#uMobile").val().trim(),
                    "uSex": $("#uSex").val().trim()
                },
                async: true,
                success: function () {
                    window.location.href = "toChangeInfo";
                }
            });
        };

    </script>
</head>
<body>
<%@ include file="header.jsp" %>
        <div id="main">
            <div class="sep20"></div>
            <div id="setDiv">
                <div class="sep30"></div>
                <div id="headDiv">
                    <div id="img">
                        <img src="/static/img/${face}" style="width: 100px; height:100px"/>
                        <input id="uId" name="uId" value="${userId}" style="display: none"/>
                    </div>
                    <form action="/upLoad" method="post" enctype="multipart/form-data" >
                        <input id="choose-file" type="file" name="p" accept="image/*"/>
                        <input type="submit" value="提交" style="margin-left: -80px;"/>
                    </form>
                </div>
                <div class="sep20"></div>
                <div id="bodyDiv">
                    <table border="1" id="setTable">
                        <tr>
                            <th>昵称</th>
                            <td><input type="text" id="uName"/></td>
                        </tr>
                        <tr>
                            <th>密码</th>
                            <td><input type="text" id="uPassword"/></td>
                        </tr>
                        <tr>
                            <th>邮箱</th>
                            <td><input type="text" id="uEmail"/></td>
                        </tr>
                        <tr>
                            <th>电话</th>
                            <td><input type="text" id="uMobile"/></td>
                        </tr>
                        <tr>
                            <th>性别</th>
                            <td><input type="text" id="uSex"/></td>
                        </tr>
                        <tr>
                            <th>操作</th>
                            <td><input id="${userId}" type="button" value="确认修改" onclick="updateUser(this.id)"></td>
                        </tr>
                    </table>
                </div>
                <div class="sep20"></div>
                <div id="footDiv">
                    <p style="font-size: 30px">个人宣言</p>
                    <textarea id="textB"></textarea>
                    <button id="${userId}" onclick="updateDec(this.id)">更改宣言</button>
                </div>
                <input type="button" value="返回上一页"  name='Submit' id="reBtn" onclick="javascript:history.back(-1);"/>
            </div>
            <%@ include file="side.jsp" %>
        </div>

<%@ include file="footer.jsp" %>

</body>
</html>