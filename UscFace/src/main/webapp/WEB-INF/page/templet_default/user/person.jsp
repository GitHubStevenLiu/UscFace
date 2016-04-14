<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no">
<title>个人中心</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/person.css">
</head>
<body>

	<div class="picwall">
		<div id="bg">
			<img src="${user.bigImg}" alt="">
		</div>
		<div class="face">
			<img src="${user.img}" alt="" style="border-radius: 50px;">
		</div>
		<div class="name clearfix">
			<span id="name">${user.name}</span> <img class="sex"
				src="${user.sex == 1?'../images/person/male.png':'../images/person/famale.png'}"
				alt="">
		</div>
		<a onclick="window.location.href='../user/toPersonMsg.do'"><div
				class="edit">编辑个人资料</div></a>
	</div>


	<div class="list">
		<div class="list_item clearfix"
			onclick="window.location.href='../myCoupon/toMyCoupon.do'">
			<div class="col-5 fl">
				<img class="middle img1" src="../images/person/po.png" alt="">
			</div>
			<div class="col-80 right clearfix">
				我的优惠券
				<c:forEach items="${mycoupon}" var="items">
					<span class="numcode" id="countId">${items.count}</span>
				</c:forEach>
			</div>
			<div class="col-5 fl">
				<img class="middle img1" src="../images/person/arrow.png" alt="">
			</div>
		</div>
	</div>



	<div class="list">

		<div class="list_item clearfix"
			onclick="window.location.href='toMyMessage.do'">
			<div class="col-5 fl">
				<img class="middle img1" src="../images/person/po.png" alt="">
			</div>
			<div class="col-80 right clearfix">
				消息通知
				<c:forEach items="${message}" var="item">
					<span class="msg">有${item.count}条新的消息~</span>
				</c:forEach>
			</div>
			<div class="col-5 fl">
				<img class="middle img1" src="../images/person/arrow.png" alt="">
			</div>
		</div>

	</div>


	<div class="list">
		<div class="list_item clearfix"
			onclick="window.location.href='toFaceback.do'">
			<div class="col-5 fl">
				<img class="middle img1" src="../images/person/po.png" alt="">
			</div>
			<div class="col-80 right clearfix">意见反馈</div>
			<div class="col-5 fl">
				<img class="middle img1" src="../images/person/arrow.png" alt="">
			</div>
		</div>

	</div>




</body>
</html>