<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,user-scalable=no">
<title>皮具箱包类</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/index.css">
<script src="../js/jquery/jquery-1.11.2.min.js"></script>
<script src="../js/index.js"></script>
</head>
<body>
	<div class="search">
		<div id="bg">
			<img src="../images/index/search_bg.png" alt="">
		</div>
		<div class="input">
			<input type="text" id="search">

			<button class="sea_btn" onclick="searchList()">搜索</button>

			<div class="searchType">
				<span id="<choType></choType>">店铺</span><span class="triangle-down"></span>
			</div>
			<div class="typeBox">
				<div class="bg">
					<img src="../images/index/serbox.png" alt="">
				</div>
				<div class="type">
					<div class="typeItem">店铺</div>
					<div class="typeItem">宝贝</div>
				</div>
			</div>
		</div>
	</div>


	<c:forEach items="${page.results}" var="item">
		<div class="list">
			<div class="list_item clearfix">
				<div class="fl lImg col-30">
					<div class="bg">
						<img src="../images/index/logo_bg.png" alt="">
					</div>
					<img src="${item.img}" alt="" id="shopLogo">
				</div>
				<div class="fl mid shopMsg col-43 font16">
					<div class="bold" id="shopName">${item.name}</div>
					<div id="mallName">${name}</div>
					<div>
						<img src="../images/index/phoneIcon.png" alt="" id="shopTel">${item.tel}
					</div>
				</div>
				<%-- <div class="fr right col-20"  _id="${item.id}" onclick="toShopDetail(this)" >
				<img src="../images/index/enter.png" alt=""  id="${item.id}" onclick="toShopDetail(this)" >
			</div> --%>

				<div class="fr right col-20" >
					<img src="../images/index/enter.png" alt="" _id="${item.id}"
						onclick="toShopDetail(this)">
				</div>

			</div>

		</div>
	</c:forEach>


	<!-- 	<div class="list"> -->
	<!-- 		<div class="list_item clearfix"> -->
	<!-- 			<div class="fl lImg col-30"> -->
	<!-- 				<div class="bg"> -->
	<!-- 					<img src="../images/index/logo_bg.png" alt=""> -->
	<!-- 				</div> -->
	<!-- 				<img src="../images/index/enter.png" alt=""> -->
	<!-- 			</div> -->
	<!-- 			<div class="fl mid shopMsg col-43 font16"> -->
	<!-- 				<div class="bold">Chocoolate</div> -->
	<!-- 				<div>A馆</div> -->
	<!-- 				<div> -->
	<!-- 					<img src="../images/index/phoneIcon.png" alt="">0345-445645 -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 			<div class="fr right col-20"> -->
	<!-- 				<img src="../images/index/enter.png" alt=""> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	<!-- 	<div class="list"> -->
	<!-- 		<div class="list_item clearfix"> -->
	<!-- 			<div class="fl lImg col-30"> -->
	<!-- 				<div class="bg"> -->
	<!-- 					<img src="../images/index/logo_bg.png" alt=""> -->
	<!-- 				</div> -->
	<!-- 				<img src="../images/index/enter.png" alt=""> -->
	<!-- 			</div> -->
	<!-- 			<div class="fl mid shopMsg col-43 font16"> -->
	<!-- 				<div class="bold">Chocoolate</div> -->
	<!-- 				<div>A馆</div> -->
	<!-- 				<div> -->
	<!-- 					<img src="../images/index/phoneIcon.png" alt="">0345-445645 -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 			<div class="fr right col-20"> -->
	<!-- 				<img src="../images/index/enter.png" alt=""> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->




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




	<script type="text/javascript">
		function toShopDetail(obj) {
			 var id= $(obj).attr("_id");
			 window.location.href="toShopDetial.do?shopId="+id;
		}
		
	</script>

	<script type="text/javascript">
		function searchList() {

			var nameKey = $('#search').val();
			alert(nameKey);

			/** 异步加载 */
			$.ajax({
				url : "shopSearch.do",
				type : "post",
				dataType : "json",
				data : {
					nameKey : nameKey,
					pageNum : 1
				},
				async : true,
				success : function(data) {

					alert(data.data.results.length);

					if (data.status == 1) {

						// 					alert(data.data[0].name);
						// 					alert(data.data.length);

						// 					$("#opType").empty();

						$("#shopLogo").empty();
						$("#shopName").empty();

						for (var i = 0; i < data.data.results.length; i++) {

							// 						$("#opType").append(
							// 								'<option value="' + data.data[i].id +','+ data.data[i].img +'">'
							// 										+ data.data[i].name + '</option>');

							//<img src="${item.img}" alt="" id="shopLogo"> <div class="bold" id="shopName">${item.name}</div>

							$("#shopLogo").append(
									'<img src="' + data.data[i].img +'">');

							$("#shopName").append(
									'<div class="'bold'">' + data.data[i].name
											+ '</div>');

							alert(data.data.results[i].name);
							alert(data.data.results[i].img);
							alert(data.data.results[i].tel);

						}

					}

				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status + " "
							+ XMLHttpRequest.readyState + " " + textStatus);
				}
			});

		}
	</script>




</body>
</html>