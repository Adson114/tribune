<%--
  Created by IntelliJ IDEA.
  User: GONG
  Date: 2020/2/25
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <form action="/toChecking" id="check" method="post">
        <div>
            验证码：<input id="authCode" name="authCode" type="text">
            <label><img type="image" src="authCode.do" id="codeImage" οnclick="chageCode()" title="图片看不清？点击重新得到验证码" style="cursor:pointer;"/></label>
            <label><a οnclick="chageCode()">换一张</a></label>
        </div>
        <input type="button" id="checkBtn" value="登录" onclick="sub()">
    </form>
</div>
</body>
</html>
<script src="../../static/js/jquery.js"></script>
<script>
    function changeCode() {
        $('#codeImage').attr('src','authCode.do?abc='+Math.random());
    }

    $("#check").validate({
        rules:{
            authCode:{required:true,checkCode:true}
        },
        messages:{
            authCode: {required:"验证码不能为空"}
        }
    });

    jQuery.validator.addMethod('checkCode',function (value,element) {
        var strCode=${strCode};
        var inpCode=${'authCode'}.val().trim();
        if(strCode==""||strCode==null){
            changeCode();
        }else if(inpCode==strCode){
            return true;
        }else{
            return  false;
        }
    },'验证码不正确');
</script>