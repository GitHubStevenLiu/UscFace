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
<title>首页</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/index.css">
<script src="../js/jquery/jquery-1.11.2.min.js"></script>
<script src="../js/unslider.min.js"></script>
<script src="../js/index.js"></script>
</head>
<body>
	<div class="search">
		<div id="bg">
			<img src="../images/index/search_bg.png" alt="">
		</div>
		<div class="input">
			<input type="text" id="search">
			<button class="sea_btn" onclick="searchShop()">搜索</button>
			<div class="searchType">
				<span id="choType">店铺</span><span class="triangle-down"></span>
			</div>
			<div class="typeBox">
				<div class="bg">
					<img src="../images/index/serbox.png" alt="">
				</div>
				<div class="type">
					<div class="typeItem" onclick="slectShopOrGoods('shop')">店铺</div>
					<div class="typeItem" onclick="slectShopOrGoods('goods')">宝贝</div>
				</div>
			</div>
		</div>
	</div>

<%-- 店铺类型 --%>
	<div class="category clearfix">
		<c:forEach items="${shoptype}" var="item">
			<div class="ca_item">
				<div>
					<img src="${item.img}" alt="">
				</div>
				<div onclick="window.location.href='../shop/toShopSearch.do?typeId=${item.id}'">${item.name}</div>
			</div>
		</c:forEach>
	</div>

	<div class="content">
		<c:forEach items="${mall}" var="item">
			<div
				onclick="window.location.href='toChildMallCenter.do?id=${item.id}'">
				<img src="${item.bigImg}" alt="">
			</div>
		</c:forEach>
	</div>


	<div class="shake" onclick="window.location.href='../coupon/toshakeCoupon.do'">
		<img src="../images/index/shake.png" alt="">
	</div>
	
	
	<div class="bottom">
		<div class="bg">
			<img src="../images/index/bottom.png" alt="">
		</div>
		<div class="nav">
			<span>首页</span> <span id="nav">导航</span> <span onclick="toLogin()">我的</span>
			<div class="navBox">
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


	<script type="text/javascript">
		function toLogin() 
		{
			//alert("~~~~~~~~");
			 window.location.href="../user/toLogin.do?";
		}
	</script>


	<script type="text/javascript">
		var selectIndex = "shop";

		function slectShopOrGoods(obj) {

			selectIndex = obj;
		}

		function searchShop() {

			var nameKey = $('#search').val();
			
// 			nameKey = encodeURI(nameKey);
// 			nameKey = encodeURI(nameKey);

			if (selectIndex == 'shop') {
				window.location.href = "../shop/toShopSearch.do?nameKey="
						+ nameKey;
			} else if (selectIndex == 'goods') {
				
				window.location.href = "../goods/toGoodsSearch.do?nameKey="+nameKey;
				

			}

			//window.location.href = "../shop/toShopSearch.do?nameKey="+nameKey;

		}
	</script>



</body>
</html>