<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<title>店铺资料</title>
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/person.css">
</head>
<body>
	<div class="content">
		<div class="list">
			<div class="list_item clearfix">
				<div class="fl col-45 font14">店铺标志</div>
				<div class="col-45">
					<img class="min_face" src="${shop.img}" alt="">
				</div>
				<div class="col-5 fr">
					<img class="middle img1" src="../images/person/arrow.png" alt="">
				</div>
			</div>			
		</div>
		<div class="list">
			<div class="list_item clearfix">
				<div class="fl col-45 font14">店铺名称</div>
				<div class="col-45">
					<input id="shopName" class="fr font14" type="text" value="${shop.name}">
				</div>
				<div class="col-5 fr">
					<img class="middle img1" src="../images/person/arrow.png" alt="">
				</div>
			</div>			
		</div>
		<div class="list">
			<div class="list_item clearfix">
				<div class="fl col-45 font14">联系电话</div>
				<div class="col-45">
					<input id="shopTel" class="fr font14" type="text" value="${shop.tel}">
				</div>
				<div class="col-5 fr">
					<img class="middle img1" src="../images/person/arrow.png" alt="">
				</div>
			</div>			
		</div>
		<div class="list m-b-0">
			<div class="list_item clearfix">
				<div class="fl col-45 font14">店铺简介</div>
				<div class="col-5 fr">
					<img class="middle img1" src="../images/person/arrow.png" alt="">
				</div>
			</div>			
		</div>
		<div class="ta">
			<textarea name="" id="shopIntroduction">${shop.introduce}</textarea>
		</div>
		<div class="list">
			<div class="list_item clearfix">
				<div class="fl col-45 font14">店铺类别</div>
				<div class="col-45 shopType">
					<select id="shopType" class="fr font14" onChange="onChangeSelect()">
					<c:forEach items="${shoptypes}" var="item">
						<option value="${item.id}" >${item.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-5 fr">
					<img class="middle img1" src="../images/person/arrow.png" alt="">
				</div>
			</div>			
		</div>
	</div>
	<div class="sub" onclick="keepShopMsg()">保存</div>
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
	
	var shopType;
	  function onChangeSelect(){
		 shopType = $('#shopType').val();
		}
	 
		function keepShopMsg(){
			
			var shopName = $('#shopName').val();
			var shopTel = $('#shopTel').val();
			var shopIntroduction = $('#shopIntroduction').val();
			shopType = $('#shopType').val();
			alert(shopName);
			alert(shopTel);
			alert(shopIntroduction);
			alert(shopType);
				/** 异步加载 */
				$.ajax({
					url : "updateShopInfor.do",
					type : "post",
					dataType : "json",
					data: {name:shopName,tel:shopTel,introduce:shopIntroduction,typeId:shopType},
					async : true,
					success : function(data) {
						//alert(data.status);
						
						if(data.status == 1){
							
							alert("成功修改");				
							
						}else if(data.status == -1){
							
							alert("系统问题");
						}else if(data.status == 0){
							
							alert("修改错误");
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
