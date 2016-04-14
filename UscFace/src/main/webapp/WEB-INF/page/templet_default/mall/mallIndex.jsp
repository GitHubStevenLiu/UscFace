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
<title>A馆</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/index.css">
<link rel="stylesheet" href="../css/slider.css">
<script src="../js/jquery/jquery-1.11.2.min.js"></script>
<script src="../js/unslider-min.js"></script>
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
	<!-- 广告 -->
	<div class="banner">
		<c:if test="${!empty ad}">
			<c:forEach items="${ad}" var="item">
				<div class="unslider" id="banner">

					<ul>

						<li><img class="bg_img sliderimg" src="${item.img}" alt=""></li>

						<!-- 				<li><img class="bg_img sliderimg" src="../images/index/img1.png" alt=""></li> -->
						<!-- 				<li><img class="bg_img sliderimg" src="../images/index/img1.png" alt=""></li> -->
					</ul>

				</div>
			</c:forEach>
		</c:if>
	</div>

	<div class="content">
		<div class="column">
			<div class="bg">
				<img src="../images/index/column.png" alt="">
			</div>
			<div class="colName">品牌商店</div>
		</div>
		<div class="shop clearfix">
			<c:if test="${!empty shop}">
				<c:forEach items="${shop}" var="item">
					<div class="fl shopItem"
						onclick="window.location.href='../shop/toShopDetial.do?shopId=${item.id}'">
						<img src="${item.img}" alt="">
					</div>
				</c:forEach>
			</c:if>

		</div>
		<div class="column">
			<div class="bg">
				<img src="../images/index/column.png" alt="">
			</div>
			<div class="colName">优惠券</div>
		</div>
		<div class="couImg">
			<c:if test="${!empty coupon}">
				<c:forEach items="${coupon}" var="item">
					<img src="${item.bigImg}" alt="">
					<div class="cou">
						<img src="${item.img}" alt="">
					</div>
				</c:forEach>
			</c:if>
		</div>
		<div class="column">
			<div class="bg">
				<img src="../images/index/column.png" alt="">
			</div>
			<div class="colName">热门商品</div>
		</div>
		<div class="goods clearfix">
			<c:if test="${!empty goods_child}">
				<c:forEach items="${goods_child}" var="item">

					<div class="fl goodsItem" onclick="window.location.href='../goods/toGoodsDetial.do?goodsId=${item.id}'">
						<div>
							<img src="${item.img}" alt="">
						</div>
						<div class="goodsMsg">
							<div class="name">${item.name}</div>
							<div class="np">
								RMB:<span>${item.bigImg}</span>
							</div>
							<div class="op">RMB:${item.url}</div>
						</div>
					</div>

				</c:forEach>
			</c:if>


		</div>
	</div>


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

				window.location.href = "../goods/toGoodsSearch.do?nameKey="
						+ nameKey;

			}

			//window.location.href = "../shop/toShopSearch.do?nameKey="+nameKey;

		}
	</script>



</body>
</html>