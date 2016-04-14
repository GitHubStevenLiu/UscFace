<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<title>修改密码</title>
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/psw.css">
	<script src="../js/jquery/jquery-1.11.2.min.js"></script>
</head>
<body>
	<div class="content">
		<div>
			<input class="shadow" type="password" placeholder="请输入旧密码"  id="old-passwd">
		</div>
		<div>
			<input class="shadow" type="password" placeholder="请输入新密码" id="new-passwd">
		</div>
		<div>
			<input class="shadow" type="password" placeholder="请再次输入新密码" id="confirm-passwd">
		</div>
		<div id="sub" onclick="editPasswd()">确认修改</div>
	</div>
	
	
	<script>
	
	
	function editPasswd(){
    	var oldPwd= $("#old-passwd").val();
    	var newPwd= $("#new-passwd").val();
    	var newPwd_Re= $("#confirm-passwd").val();
    	
    	
    	if(oldPwd==""||newPwd==""||newPwd_Re==""){
    		alert("请输入完整信息");
    		return;
    	}
    	
    	if(newPwd!=newPwd_Re){
    		alert("新密码两次输入不一致！");
    		$("#new-passwd").val('');
    		$("#confirm-passwd").val('');
    		return;
    	}
    	
    	$.ajax({
    		url : "updatePassword.do",
    		type : "post",
    		dataType : "json",
    		data: {oldPwd:oldPwd,newPwd:newPwd,newPwd_Re:newPwd_Re},
    		async : true,
    		success : function(data) {
    			
    			if(data.status == 1){
    				alert("修改密码成功");
    				$("#old-passwd").val('');
    				$("#new-passwd").val('');
    				$("#confirm-passwd").val('');
    				
    			}else{
    				showTips("账号密码不正确!请重新输入")
    				$("#old-passwd").val('');
    				$("#new-passwd").val('');
    				$("#confirm-passwd").val('');
    			}
    	},
    		error:function(XMLHttpRequest, textStatus, errorThrown) 
    		{
            alert(XMLHttpRequest.status+" "+XMLHttpRequest.readyState+" "+textStatus);
        	}
    	});
    	
    }
	
	
	
	</script>
	
</body>
</html>