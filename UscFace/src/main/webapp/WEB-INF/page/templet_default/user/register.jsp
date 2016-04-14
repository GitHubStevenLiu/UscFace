<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<title>注册</title>
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/login.css">
</head>
<body>
	<div class="content">
		<div class="input">
			<label for="">手机号</label>
			<input type="tel" placeholder="请输入手机号" id="phoneId">
			<span class="code" onclick="getPhone()">发送验证码</span>
		</div>
		<div class="input">			
			<label for="">验证码</label>
			<input type="text" placeholder="请输入验证码" id="identifyingCode">
		</div>
		<div class="input">			
			<label for="">密码</label>
			<input type="password" placeholder="请输入密码" id="passwd">
		</div>
		<div class="input">			
			<label for="">确认密码</label>
			<input type="password" placeholder="请再次输入密码" id="confirm-passwd">
		</div>
		<div class="agree">
		  	<div class="checkbox">
		  		<input type="checkbox" value="0" id="remPsw">点击注册表示同意<a onclick="window.location.href='toUserAgreement.do'">用户协议</a>
			  	<label for="remPsw"></label>
		  	</div>
		</div>
		
		<div id="login" class="btn" onclick="register()">注册</div>
	</div>
	
	
	<script>
	
	function getPhone(){
		
		var phoneNum = $('#phoneId').val();
		var code = $('#identifyingCode').val();
		
		$.ajax({
    		url : "registerMsg.do",
    		type : "post",
    		dataType : "json",
    		data: {tel:phoneNum},
    		async : true,
    		success : function(data) {
    			
               if(data.status == 1){
					
            	   alert("验证码已经发到你的手机");
				}
    			
    	},
    		error:function(XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.status+" "+XMLHttpRequest.readyState+" "+textStatus);
        	}
    	});
		
	}
	
	
	function register(){
		
		var phoneNum = $('#phoneId').val();
		var password = $('#passwd').val();
		var rePassword = $('#confirm-passwd').val();
		var code = $('#identifyingCode').val();
		
		$.ajax({
    		url : "register.do",
    		type : "post",
    		dataType : "json",
    		data: {tel:phoneNum,password:password,rePassword:rePassword,code:code},
    		async : true,
    		success : function(data) {
    			
    			if(data.status == 1){
					
					alert("注册成功");
					
				}else if(data.status == -1){
					
					alert("系统问题");
				}else if(data.status == 0){
					
					alert("您已经注册过");
				}
    			
    	},
    		error:function(XMLHttpRequest, textStatus, errorThrown) {
            alert(XMLHttpRequest.status+" "+XMLHttpRequest.readyState+" "+textStatus);
        	}
    	});
		
	}
	
	
	
	</script>
	
</body>
<script src="../js/jquery/jquery-1.11.2.min.js"></script>
<script src="../js/login.js"></script>
</html>