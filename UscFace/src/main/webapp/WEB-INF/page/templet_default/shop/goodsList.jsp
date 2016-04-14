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
					<img src="../images/index/goods_bg.png" alt="">
				</div>
				<img src="${item.img}" alt="">
			</div>
			<div class="fl mid col-50 font16">
				<div class="bold">${item.name}</div>
				<div class="font14">${item.introduce}</div>
			</div>
			<div class="fr right col-15">
				<div class="font16 bold color1">&yen;${item.newPrice}</div>
				<div class="font16 line-through">&yen;${item.oldPrice}</div>
			</div>
		</div>
	</div>
	</c:forEach>
	
<!-- 	<div class="list"> -->
<!-- 		<div class="list_item clearfix"> -->
<!-- 			<div class="fl lImg col-30"> -->
<!-- 				<div class="bg"> -->
<!-- 					<img src="../images/index/goods_bg.png" alt=""> -->
<!-- 				</div> -->
<!-- 				<img src="../images/index/enter.png" alt=""> -->
<!-- 			</div> -->
<!-- 			<div class="fl mid col-50 font16"> -->
<!-- 				<div class="bold">欧米茄</div> -->
<!-- 				<div class="font14">牛皮女包2015秋冬款欧美手提单肩斜挎简约大包商务女式包</div> -->
<!-- 			</div> -->
<!-- 			<div class="fr right col-15"> -->
<!-- 				<div class="font16 bold color1">&yen;288</div> -->
<!-- 				<div class="font16 line-through">&yen;599</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->

<!-- 	<div class="list"> -->
<!-- 		<div class="list_item clearfix"> -->
<!-- 			<div class="fl lImg col-30"> -->
<!-- 				<div class="bg"> -->
<!-- 					<img src="../images/index/goods_bg.png" alt=""> -->
<!-- 				</div> -->
<!-- 				<img src="../images/index/enter.png" alt=""> -->
<!-- 			</div> -->
<!-- 			<div class="fl mid col-50 font16"> -->
<!-- 				<div class="bold">欧米茄</div> -->
<!-- 				<div class="font14">牛皮女包2015秋冬款欧美手提单肩斜挎简约大包商务女式包</div> -->
<!-- 			</div> -->
<!-- 			<div class="fr right col-15"> -->
<!-- 				<div class="font16 bold color1">&yen;288</div> -->
<!-- 				<div class="font16 line-through">&yen;599</div> -->
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
	
	function searchList(){
		
		var nameKey = $('#search').val();
		alert(nameKey);
		
		
		/** 异步加载 */
		$.ajax({
			url : "goodsSearch.do",
			type : "post",
			dataType : "json",
			data: {nameKey:nameKey,pageNum:1,goodsDist:4},
			async : true,
			success : function(data) {
				
				alert(data.data.results.length);
				
				if(data.status == 1){
					


					for (var i = 0; i < data.data.results.length; i++) {

						alert(data.data.results[i].name);
						alert(data.data.results[i].img);
						alert(data.data.results[i].introduce);
						alert(data.data.results[i].oldPrice);
						alert(data.data.results[i].newPrice);
						
					}
					
					
				}
										
				
			},
			error:function(XMLHttpRequest, textStatus, errorThrown) {
	            alert(XMLHttpRequest.status+" "+XMLHttpRequest.readyState+" "+textStatus);
	        }
		});
		
		
	}
	
	</script>
	
	
	
</body>
</html>