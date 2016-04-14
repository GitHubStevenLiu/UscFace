<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../common/base.jsp" %>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <title>账号登录</title>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <link href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
    <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <style type="text/css">

        input {outline:none;}


       ::-webkit-input-placeholder {
            color: #ccc;
            font-size: 18px
        }
        ::-moz-placeholder {
            color: #ccc;
            font-size: 18px
        }
        :-ms-input-placeholder {
            color: #ccc;
            font-size: 18px
        }
        input:-moz-placeholder {
            color: #ccc;
            font-size: 18px
        }

    </style>

</head>

<body style="background-color: #F9F9F9">


<div style="margin-top: 20px">

    <p align="center" style="font-size: 17px;font-weight: bold">请输入商户账号和密码登录到商家管理后台</p>


    <div style="margin-left: 10px;margin-right: 10px;margin-top: 20px">

        <div style="padding-bottom: 30px">
            <p
                    style="font-size: 18px;font-weight: bold;float: left;margin-top: 12px">账号</p>

            <input type="text"
                   style="width: 85% ;height:45px;display: inline;float: left;padding-left: 15px;border:0;border-color: #ffffff;background-color:transparent;font-weight: bold"
                   placeholder="请输入您的账号">

        </div> <br>


        <div style="width:98%; height:1px; border-top:1px solid #cccccc; clear:both;margin-left: 3px;"></div>

        <div style="margin-top: 3px">
            <p
                    style="font-size: 18px;font-weight: bold;float: left;margin-top: 12px">
                密码</p>
            <input type="password"
                   style="width: 85% ;height:45px;display: inline;float: left;margin-left: 15px;;border:0;border-color: #ffffff;background-color:transparent;font-weight: bold"
                   placeholder="请输入秘密">
        </div><br>

    </div>

    <p style="margin-left: 10px;margin-right: 10px;padding-top: 50px">

            <button
                    style="background-color:#CC0033;border: none;height: 48px;font-size: 20px"
                    type="button" class="btn btn-primary btn-lg btn-block" onclick="window.location.href='./store_select.html'">登录
            </button>

      
      

    </p>


</div>



</body>
</html>