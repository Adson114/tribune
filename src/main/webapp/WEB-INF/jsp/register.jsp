<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        #usernameDiv{
            height:35px;
            width:300px;
            position:relative;
            display:inline;
        }
        #username{
            height:30px;
            width:300px;
            padding-right:50px;
        }
        #usernameSpan{
            position:absolute;
            right:18px;
            top:2px;
            height:16px;
            width:50px;
        }

        a:visited {
            font-size: 12px;
            color: #000;
            text-decoration: none;
        }

    </style>
    <link rel="stylesheet" type="text/css" href="/static/css/LoginAndRegister.css"/>
    <script src="../../static/js/jquery.js"></script>
    <script>
        function toUserName(){
            $.ajax({
                url:"/toRegister",
                type:"POST",
                data:{
                    "name":$("#username").val().trim()
                },

                success:function (data) {
                    console.log(data);
                    if(data.toString()==="ok"){
                        $("#usernameSpan").css("color","green");
                    }else{
                        $("#usernameSpan").css("color","red");
                    }
                    $("#usernameSpan").html(data);
                }
            });
        }

        // function reg2(){
        //     $.ajax({
        //         type:"POST",
        //         url:"/reg2",
        //         data:{
        //             "username":$("#username").val().trim(),
        //             "phoneNumber":$("#phoneNumber").val().trim(),
        //             "loginPassword":$("#login_password").val().trim(),
        //             "sex":$("#sex").val(),
        //             "email":$("#email").val().trim(),
        //             "trueName":$("#true_name").val().trim()
        //         },
        //         success:function(data){
        //             var json = JSON.parse(data);
        //             var  result = json["status"];
        //             if(result == 1)
        //             {
        //                 $("#message").html("注册成功,返回登录界面");
        //                 $("#username").val("");
        //                 $("#phoneNumber").val("");
        //                 $("#login_password").val("");
        //                 $("#email").val("");
        //                 $("#true_name").val("");
        //                 $("#usernameSpan").html("");
        //             }
        //             else
        //             {
        //                 $("#message").html("注册失败，请重新注册");
        //             }
        //         }
        //     });
        // }

    </script>
</head>
<body>
<div id="background">
<div id="outMain">
    <form action="/reg2" method="post">
        <div  id="innerDiv">
            <div id="newUserDiv">注册新用户</div>

            <br/>
            <span class="p">*</span>
            <label for="username" class="l">用户名&nbsp;:</label>
            <div id="usernameDiv">
                <input id="username" type="text" class="i" name="username"required onblur="toUserName()">
                <p id="usernameSpan"></p>
            </div>
            <br/>
            <br/>
            <span class="p">*</span>
            <label for="phoneNumber" class="l">手机号&nbsp;:</label>
            <div  class="d">
                <input id="phoneNumber" type="text" class="i" name="phoneNumber" required>
            </div>
            <br/><br/>
            <span class="c">*</span>
            <label for="login_password" class="l">登录密码:</label>
            <div  class="d">
                <input id="login_password" type="text" class="i" name="loginPassword" required>
            </div>
            <br/><br/>
            <span class="p">*</span>
            <label for="email" class="l">邮&nbsp;&nbsp;&nbsp;&nbsp;箱:</label>
            <div  class="d">
                <input id="email" type="text" class="i" name="email" required>
            </div>
            <br/><br/>
            <span class="p">*</span>
            <label for="sex" class="l">性&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
            <div  class="d">
                <select id="sex" name="sex">
                    <option class="sexValue" value="男">男</option>
                    <option class="sexValue" value="女">女</option>
                </select>
            </div>
            <br/><br/>
            <span class="c">*</span>
            <label for="true_name" class="l">真实姓名:</label>
            <div  class="d">
                <input id="true_name" type="text" class="i" name="trueName" required>
            </div>
            <br/><br/>
            <label for="captcha" id="checkLabel" class="l">验证码：</label>
            <div class="d">   <!--相关位置--> <!--此处为相关位置与绝对位置联合使用-->
                <input id="captcha" type="text" name="captcha"/>
                <img id="captchaImage" alt="验证码" src="/code"/>
                <a href="#" onclick="changeImg()">换一张</a>
                <span id="checkSpan"></span>  <!--绝对位置-->
            </div>
            <br/><br/>
            <input type="checkbox" name="agree" id="agree" value="1"/>
            <span style="font-size:10px;">我已阅读并同意《用户注册协议》</span>
            <br/>
            <div style="margin-left: 100px;margin-top:30px;width: 300px; font-size: 20px;font-weight: 500;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/login" style="float: right;">返回登录</a>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/allView" style="float: left;">返回首页</a>
            </div>
            <br/><br/>
            <input type="submit" value="同意以上协议并注册" id="agree2" />
            <p id="message">${message}</p>
        </div>

    </form>
</div>
</div>
</body>
</html>
