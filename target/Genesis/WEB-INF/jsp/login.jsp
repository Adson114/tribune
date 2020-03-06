<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        #usernameLabel, #passwordLabel ,#checkLabel{
            font-size: 30px;
            font-weight: 800;
            color: #000;
        }

        #userDiv, #password1Div,#checkDiv {
            height: 35px;
            width: 400px;
            position: relative;
            display: inline;
        }

        #username, #password1 ,#captcha{
            height: 30px;
            width: 350px;
            padding-right: 50px;
        }

        #usernameSpan, #password1Span,#checkSpan {
            position: absolute;
            right: 18px;
            top: 2px;
            height: 16px;
            width: 16px;
            display: inline-block;
        }

        a:visited {
            font-size: 12px;
            color: #000;
            text-decoration: none;
        }

        #captchaImage{
            margin-left: 125px;
            margin-top: 50px;
        }

    </style>
    <link rel="stylesheet" type="text/css" href="/static/css/LoginAndRegister.css"/>
</head>
<body>
<div id="background">
    <div id="outMain">
        <div id="innerMain">
            <form action="/log2" method="post">
                <label for="username" id="usernameLabel">用户名：</label>
                <div id="userDiv">   <!--相关位置--> <!--此处为相关位置与绝对位置联合使用-->
                    <input id="username" type="text" name="username">
                    <span id="usernameSpan"></span>  <!--绝对位置-->
                </div>
                <br/>
                <br/>
                <br/>
                <label for="password1" id="passwordLabel">密&nbsp&nbsp&nbsp码：</label>
                <div id="password1Div">   <!--相关位置--> <!--此处为相关位置与绝对位置联合使用-->
                    <input id="password1" type="text" name="password">
                    <span id="password1Span"></span>  <!--绝对位置-->
                </div>
                <br/>
                <br/>
                <br/>
                <label for="captcha" id="checkLabel">验证码：</label>
                <div id="checkDiv">   <!--相关位置--> <!--此处为相关位置与绝对位置联合使用-->
                    <input id="captcha" type="text" name="captcha"/>
                    <img id="captchaImage" alt="验证码" src="/code"/>
                    <a href="#" onclick="changeImg()">换一张</a>
                    <span id="checkSpan"></span>  <!--绝对位置-->
                </div>
                <br/>
                <br/>
                <br/>
                <div style="width:350px;margin-left: 120px; font-size: 20px;font-weight: 500;">
                    <a href="/register" style="float: left">注册</a>
                    <a href="/allView" style="float: right">返回首页</a>
                </div>
                <br/>
                <br/>
                <div id="loginDiv">
                    <input type="submit" value="登录" id="loginInput"/>
                </div>
                <br/>
                <br/>
                <p id="logP">${message}</p>
            </form>
        </div>
    </div>
</div>
</body>
</html>
<script src="../../static/js/jquery.js"></script>
<script type="text/javascript">
    function changeImg() {
        var imgSrc = $("#captchaImage");
        var src = imgSrc.attr("src");
        imgSrc.attr("src", chgUrl(src));
    }
    //时间戳
    //为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
    function chgUrl(url) {
        var timestamp = (new Date()).valueOf();
        url = url.substring(0, 17);
        if ((url.indexOf("&") >= 0)) {
            url = url + "×tamp=" + timestamp;
        } else {
            url = url + "?timestamp=" + timestamp;
        }
        return url;
    }
</script>