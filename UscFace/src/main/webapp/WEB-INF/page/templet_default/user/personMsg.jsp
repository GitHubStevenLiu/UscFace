<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<title>个人资料</title>
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/person.css">
</head>
<body>
	<div class="content">
		<div class="list">
			<div class="list_item clearfix">
				<div class="fl col-45 font14">个人头像</div>
				<div class="col-45">
					<img class="min_face" src="${user.img}" alt="">
				</div>
				<div class="col-5 fr">
					<img class="middle img1" src="../images/person/arrow.png" alt="">
				</div>
			</div>			
		</div>
		<div class="list">
			<div class="list_item clearfix">
				<div class="fl col-45 font14">昵称</div>
				<div class="col-45">
					<input id="personName" class="fr font14" type="text" value="${user.name}">
				</div>
				<div class="col-5 fr">
					<img class="middle img1" src="../images/person/arrow.png" alt="">
				</div>
			</div>			
		</div>
		<div class="list">
			<div id="sexList" class="list_item clearfix">
				<div class="fl col-45 font14">性别</div>
				<div id="chooseSex" class="col-45 font14">
					<div id="chosen" class="fr">${user.sex == 1 ? '男' : '女'}</div>
					<div id="sexRadio" class="fr hide">
						<input name="sex" type="radio" id="male" checked="checked" onclick="sexSelect('male')" value="1">
						<label for="male">男</label>
						<input name="sex" type="radio" id="female" onclick="sexSelect('female')" value="2">
						<label for="female">女</label>
					</div>
				</div>
				<div class="col-5 fr">
					<img class="middle img1" src="../images/person/arrow.png" alt="">
				</div>
			</div>			
		</div>
		<div class="list">
			<a onclick="window.location.href='toUpdatePassword.do'">
			<div class="list_item clearfix">
				<div class="fl col-45 font14">修改登录密码</div>
				<div class="col-5 fr">
					<img class="middle img1" src="../images/person/arrow.png" alt="">
				</div>
			</div>
			</a>			
		</div>
	</div>
	<div class="sub" onclick="keepPersonMsg()">保存</div>
	<div id="mask"></div>
	<div id="modal">
		<div id="modal-body">
			<div>
				<img src="../images/person/gou.png" alt="">
				<div>成功保存</div>
			</div>
		</div>
		<div id="modal-bottom">确定</div>
	</div>
	
	
	<script>
	

	window.onload = function() {
		var  sexName = $('#chosen').val()
		
		}
	
	
	
	var sex = 1;
	
	function sexSelect(obj){
		
		sex = $('#'+obj).val();
	
	}	 
		function keepPersonMsg(){
			
			var name = $('#personName').val();
			
				/** 异步加载 */
				$.ajax({
					url : "updateInfor.do",
					type : "post",
					dataType : "json",
					data: {sex:sex,name:name},
					async : true,
					success : function(data) {
						
						if(data.status == 1){
							
							alert("保存成功");				
							
						}else if(data.status == -1){
							
							alert("系统问题");
						}else if(data.status == 0){
							
							alert("保存失敗");
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
<script src="../js/person.js"></script>
</html>
