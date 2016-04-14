<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<title>商品详情</title>
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/goods.css">
	<link rel="stylesheet" href="../css/slider.css">
	<script src="../js/jquery/jquery-1.11.2.min.js"></script>
	<script src="../js/unslider-min.js"></script>
	<script src="../js/goods.js"></script>
</head>
<body>
	<div class="unslider" id="banner">
		<ul>
			<li><img class="bg_img sliderimg" src="../images/index/img1.png" alt=""></li>
			<li><img class="bg_img sliderimg" src="../images/index/img1.png" alt=""></li>
			<li><img class="bg_img sliderimg" src="../images/index/img1.png" alt=""></li>
		</ul>
	</div>
	<div id="msg">
		<div id="name" class="name">${goods.name}</div>
		<div id="np" class="pr np">RMB:<span class="bold">${goods.newPrice}</span></div>
		<div id="op" class="pr">RMB:${goods.oldPrice}</div>
		<div id="else" class="clearfix pr">
			<div class="fl else_item">收货方式:${goods.getWay}</div>
			<div class="fl else_item">累计销量:${goods.sellNum}笔</div>
			<div class="fl else_item">库存:${goods.currentNum}件</div>
		</div>
		<button id="buy">立即抢购 ></button>
	</div>
	<div class="content">
		<div id="bg">
			<img src="../images/goods/ca_bg.png" alt="">
			<div class="hd">商品详情</div>
			<div>
				<img src="../images/goods/detail.png" alt="">
			</div>
		</div>
	</div>
	<div class="bottom_bar">
		<button class="bottom_btn">首页</button>
		<button class="bottom_btn">购物车
			<span class="numcode">1</span>
		</button>
		<button class="bottom_btn">我的
			<span class="numcode">0</span>
		</button>
	</div>
	<!-- 弹出层 -->
	<div class="mask"></div>
	<div class="modal">
		<div class="myModal">
			<div id="close"><img src="../images/goods/close.png" alt=""></div>
			<div class="clearfix">
				<div class="s_img fl">
					<img src="../images/goods/goods.png" alt="">
				</div>
				<div class="fl s_msg">
					<div class="name">[精选超值]芭图雅摩洛哥护发精油</div>
					<div id="choose" class="pr">分类名称</div>
					<div class="pr">库存250件</div>
					<div class="pr np">RMB: <span class="bold">99.00</span></div>
				</div>
			</div>
			<div>
				<div>选择分类</div>
				<div class="type">
					<span class="active">分类名称1</span>
					<span>分类名称2</span>
					<span>分类名称3</span>
					<span>分类名称4</span>

				</div>
				<div>购买数量：
					<a href="javascript:void(0);" class="a" id="add">
						<img src="../images/goods/add.png" alt="">
					</a>
					<input id="num" type="text" placeholder="1" pattern="^-?\d+$" value="1">
					<a href="javascript:void(0);" class="a" id="reduce">
						<img src="../images/goods/reduce.png" alt="">
					</a>
				</div>
			</div>
		</div>
		<div class="clearfix btn_bar">
			<div id="buyNow" class="modal_btn fl">立即购买</div>
			<div id="toCart" class="modal_btn fl">加入购物车</div>
		</div>
	</div>
</body>
</html>