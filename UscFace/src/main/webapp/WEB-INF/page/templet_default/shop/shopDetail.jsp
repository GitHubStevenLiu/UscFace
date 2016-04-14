<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,user-scalable=no">
<title>歌莉娅 GOELIA</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/index.css">
<script src="../js/jquery/jquery-1.11.2.min.js"></script>
<script src="../js/index.js"></script>
</head>
<body>
	<!-- 	<div class="search"> -->
	<!-- 		<div id="bg"> -->
	<!-- 			<img src="../images/index/search_bg.png" alt=""> -->
	<!-- 		</div> -->
	<!-- 		<div class="input"> -->
	<!-- 			<input type="text" id="search"> -->
	<!-- 			<button class="sea_btn">搜索</button> -->
	<!-- 			<div class="searchType"> -->
	<%-- 				<span id="<choType></choType>">店铺</span><span class="triangle-down"></span> --%>
	<!-- 			</div> -->
	<!-- 			<div class="typeBox"> -->
	<!-- 				<div class="bg"> -->
	<!-- 					<img src="../images/index/serbox.png" alt=""> -->
	<!-- 				</div> -->
	<!-- 				<div class="type"> -->
	<!-- 					<div class="typeItem">店铺</div> -->
	<!-- 					<div class="typeItem">宝贝</div> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->


	<div class="picwall">
		<div class="bg">
			<img src="${shop.bigImg}" alt="">
		</div>
		<div class="logo">
			<img src="${shop.img}" alt="">
		</div>
	</div>


	<div class="connect clearfix">
		<div class="fl border-right">
			<img src="../images/index/telico.png" alt="">${shop.tel}
		</div>
		<div class="fl position border-left">
			<img src="../images/index/position.png" alt="">${shop.seat}
		</div>
	</div>


	<div class="item">
		<div class="hd">商铺简介</div>
		<div class="disc">${shop.introduce}</div>
		<div class="quality">
			<div class="">
				<span>商家服务品质:</span> <img src="${item.servernum}" alt=""><img
					src="../images/index/star.png" alt=""> <img
					src="../images/index/star.png" alt=""> <img
					src="../images/index/star.png" alt=""> <img
					src="../images/index/star.png" alt="">
			</div>
			<div class="">
				<span>商家诚信品质:</span> <img src="../images/index/star.png" alt="">
				<img src="../images/index/star.png" alt=""> <img
					src="../images/index/star.png" alt=""> <img
					src="../images/index/star.png" alt=""> <img
					src="../images/index/star.png" alt="">
			</div>
		</div>
	</div>



	<c:if test="${!empty coupon}">
		<c:forEach items="${coupon}" var="item">
			<div class="item">
				<div class="hd">优惠券</div>
				<div class="couImg"  onclick="window.location.href='../coupon/toCouponDetial.do?couponId=${item.id}'">
					<img src="${item.bigImg}" alt="">
					<div class="cou">
						<img src="${item.img}" alt="">
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>


	<div class="item">
		<div class="hd">商品列表</div>
		<div class="goods clearfix">

			<c:if test="${!empty goods}">
				<c:forEach items="${goods}" var="item">
					<div class="fl goodsItem">
						<div>
							<img src="${item.img}" alt="">
						</div>
						<div class="goodsMsg">
							<div class="name">${item.name}</div>
							<div class="np">
								RMB:<span>${item.newPrice}</span>
							</div>
							<div class="op">RMB:${item.oldPrice}</div>
						</div>
					</div>
				</c:forEach>
			</c:if>

		</div>
	</div>



	<div class="bottom">
		<div class="bg">
			<img src="../images/index/bottom1.png" alt="">
		</div>
		<div class="nav">
			<span>首页</span> <span id="nav">导航</span> <span>我的</span>
			<div class="navBox ni">
				<div class="bg">
					<img src="../images/index/navbox.png" alt="">
				</div>
				<div class="navItem">
					<div class="ni">A馆</div>
					<div class="ni">B馆</div>
				</div>
			</div>
		</div>
	</div>




</body>
</html>