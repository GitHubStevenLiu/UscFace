<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<title>商家管理中心</title>
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/person.css">
</head>
<body>
	<div class="picwall">
		<div id="bg"><img src="${shop.bigImg}" alt=""></div>
		<div class="face">
			<img src="${shop.img}" alt="" style="border-radius: 50px;">
		</div>
		<div class="name clearfix">
			<span id="name">${shop.name}</span>
		</div>
		<a onclick="window.location.href='toShopManager.do'"><div class="edit">编辑店铺资料</div></a>
	</div>
	<div class="content">
		<div class="list">
			<div class="list_item clearfix" onclick="window.location.href='../coupon/toCouponManager.do'">
				<div class="col-5 fl"><img class="middle img1" src="../images/person/po.png" alt=""></div>
				<div class="col-80 right clearfix" >优惠券管理
				<c:forEach items="${coupon}" var="items">
					<span class="numcode">${items.count}</span>
					</c:forEach>
				</div>
				<div class="col-5 fl"><img class="middle img1" src="../images/person/arrow.png" alt=""></div>
			</div>			
		</div>
		<div class="list">
			<a onclick="window.location.href='../mall/toMallCenter.do'">
				<div class="list_item clearfix">
					<div class="col-5 fl"><img class="middle img1" src="../images/person/po.png" alt=""></div>
					<div class="col-80 right clearfix" >扫码验证
					</div>
					<div class="col-5 fl"><img class="middle img1" src="../images/person/arrow.png" alt=""></div>
				</div>
			</a>			
		</div>
	</div>
</body>
</html>