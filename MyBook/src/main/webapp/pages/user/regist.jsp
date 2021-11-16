<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>尚硅谷会员注册页面</title>
    <%--静态包含base标签，css样式，jQuery文件--%>
    <%@include file="/pages/common/head.jsp"%>
    <script type="text/javascript">
        //页面加载完成之后
        $(function () {
            //给注册绑定单击事件
            $("#sub_btn").click(function () {
                //验证用户名:必须有字母，数字下划线组成，并且长度为5到12位
                //1 获取用户名输入框里的内容
                var usernameTest = $("#username").val();
                //2 创建正则表达式对象
                var usernamePatt = /^\w{5,12}$/;
                //3 使用test方法验证
                if (!usernamePatt.test(usernameTest)) {
                    //4 提示用户结果
                    $("span.errorMsg").text("用户名不合法！");
                    return false;
                } else {
                    $("span.errorMsg").text("");
                }


                //验证密码:必须有字母，数字下划线组成，并且长度为5到12位
                //1 获取用户名输入框里的内容
                var passwordTest = $("#password").val();
                //2 创建正则表达式对象
                var passwordPatt = /^\w{5,12}$/;
                //3 使用test方法验证
                if (!passwordPatt.test(passwordTest)) {
                    //4 提示用户结果
                    $("span.errorMsg").text("密码不合法！");
                    return false;
                } else {
                    $("span.errorMsg").text("");
                }

                //验证确认密码和密码相同
                //1 获取确认密码内容
                var repwdTest = $("#repwd").val();
                //2 和密码相比较
                if (repwdTest != passwordTest) {
                    $("span.errorMsg").text("两次密码不一致");
                    return false;
                }

                //邮箱验证：XXXXX@XX.com
                //1 获取邮箱里的内容
                var emailTest = $("#email").val();
                //2 创建正则表达式对象
                var emailPatt = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
                //3 使用test方法验证
                if (!emailPatt.test(emailTest)) {
                    //4 提示用户结果
                    $("span.errorMsg").text("邮箱不合法！");
                    return false;
                } else {
                    $("span.errorMsg").text("");
                }

                //验证码：现在只需要验证用户已输入。因为还没讲到服务器。验证码生成
                var codeText = $("#code").val();
                //去掉字符串前后的空格
                // alert("去空格前：["+codeText+"]");
                codeText = $.trim(codeText);
                // alert("去空格后：["+codeText+"]");
                if (codeText == "" || codeText == null) {
                    $("span.errorMsg").text("验证码不能为空！");
                    return false;
                }
            });
        });
    </script>
    <style type="text/css">
        .login_form {
            height: 420px;
            margin-top: 25px;
        }

    </style>
</head>
<body>
<div id="login_header">
    <img alt="" class="logo_img" src="static/img/logo.gif">
</div>

<div class="login_banner">

    <div id="l_content">
        <span class="login_word">欢迎注册</span>
    </div>

    <div id="content">
        <div class="login_form">
            <div class="login_box">
                <div class="tit">
                    <h1>注册尚硅谷会员</h1>
                    <span class="errorMsg"></span>
                </div>
                <div class="form">
                    <form action="registservlet" method="post">
                        <label>用户名称：</label>
                        <input autocomplete="off" class="itxt" id="username"
                               name="username" placeholder="请输入用户名" tabindex="1" type="text"/>
                        <br/>
                        <br/>
                        <label>用户密码：</label>
                        <input autocomplete="off" class="itxt" id="password"
                               name="password" placeholder="请输入密码" tabindex="1" type="password"/>
                        <br/>
                        <br/>
                        <label>确认密码：</label>
                        <input autocomplete="off" class="itxt" id="repwd"
                               name="repwd" placeholder="确认密码" tabindex="1" type="password"/>
                        <br/>
                        <br/>
                        <label>电子邮件：</label>
                        <input autocomplete="off" class="itxt" id="email"
                               name="email" placeholder="请输入邮箱地址" tabindex="1" type="text"/>
                        <br/>
                        <br/>
                        <label>验证码：</label>
                        <input class="itxt" id="code" name="code" style="width: 150px;" type="text"/>
                        <img alt="" src="static/img/code.bmp" style="float: right; margin-right: 40px">
                        <br/>
                        <br/>
                        <input id="sub_btn" type="submit" value="注册"/>

                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
<%@include file="/pages/common/footer.jsp"%>
</body>
</html>