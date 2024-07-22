<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="tag" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"></script>
    <style>
        .loginWrap {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .loginArea {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
<div class="container">
    <div class="loginWrap">
        <div class="loginArea">
            <form id="loginForm" name="loginForm" method="post" role="form">
                <input type="hidden" id="prevPage" name="prevPage" value="${prevPage}"/>
                <h2 class="form-signin-heading text-center"><tag:message code="signin"/></h2>
                <div class="form-group">
                    <label for="userId" class="sr-only"><tag:message code="userid"/></label>
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="Input your user ID" required autofocus/>
                </div>
                <div class="form-group">
                    <label for="passwd" class="sr-only"><tag:message code="passwd"/></label>
                    <input type="password" class="form-control" id="passwd" name="passwd" placeholder="Input your password" required/>
                </div>
                <div class="alert alert-danger" style="display: none;"></div>
                <input type="button" class="btn btn-primary btn-lg btn-block" name="signinSubmit" value="<tag:message code="signin"/>">
                <div class="btn-group btn-group-justified mt-3" role="group">
                    <a class="btn btn-default" href="/user/regist"><tag:message code="signup"/></a> | 
                    <a class="btn btn-default" href="/share/main"><tag:message code="common.home"/></a> | 
                    <a class="btn btn-default" href="/user/forgotPassword"><tag:message code="common.forgotpassword"/></a>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
$(document).ready(function() {
    $("#loginForm").validate({
        rules: {
            userId: { required: true },
            passwd: { required: true }
        },
        messages: {
            userId: { required: '아이디를 입력해 주세요.' },
            passwd: { required: '패스워드를 입력해 주세요.' }
        }
    });

    $("input").keypress(function(event) {
        if (event.which == 13) {
            event.preventDefault();
            loginAction();
        }
    });

    $("input[name=signinSubmit]").on("click", function() {
        loginAction();
    });

    function loginAction() {
        if ($("#loginForm").valid()) {
            $.ajax({
                url: "/loginProcess.json",
                data: $("#loginForm").serialize(),
                dataType: "json",
                method: "post",
                success: function(data) {
                    if (data.resultCode === 'LOGIN_0000') {
                        window.location.href = $("#prevPage").val();
                    } else {
                        showError(data.resultMsg);
                    }
                },
                error: function() {
                    showError('An error occurred. Please try again.');
                }
            });
        }
    }

    function showError(message) {
        $(".alert.alert-danger").text(message).fadeIn(2000).delay(2000).fadeOut(2000, function() {
            $("#passwd").focus();
        });
    }

    $("#userId").focus();
});
</script>
</body>
</html>
