<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=no">
	<title>优惠券详情</title>
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/index.css">
	<script src="../js/jquery/jquery-1.11.2.min.js"></script>
	<script src="../js/index.js"></script>
</head>
<body>
	<div class="nameBox clearfix">
		<div class="fl logo"><img src="../images/index/enter.png" alt=""></div>
		<div class="fl shopName">${shop.name}</div>
	</div>
	<div class="connect clearfix">
		<div class="fl border-right"><img src="../images/index/telico.png" alt="">${shop.tel}</div>
		<div class="fl position border-left"><img src="../images/index/position.png" alt="">${shop.seat}</div>
	</div>
	<div class="couBox">
		<div class="couImg">
			<img src="${coupon.bigImg}" alt="">
			<div class="cou"><img src="${coupon.img}" alt=""></div>
		</div>
		<div class="take">立即领取</div>
	</div>
	<div class="item">
		<div class="hd">使用说明</div>
		<div class="disc">
		    0.${coupon.useRule}
			1.持本券可享受正价九折优惠<br>
			2.此券不可与商家其他优惠活动同时享用<br>
			3.z最终解释权归商家所有<br>
			4.有效期至134512
		</div>
	</div>
	<div id="mask"></div>
	<div id="modal">
		<div id="modal-body">
			<div>
				<img src="../images/index/true.png" alt="">
				<div>成功领取</div>
			</div>
		</div>
		<div id="modal-bottom"  onclick="getCoupon('${coupon.id}')">确定</div>
		
		
	</div>
	
	
	
	<script type="text/javascript">
	
		function getCoupon(couponId){
// 			alert(couponId);
			
			/** 异步加载 */
			$.ajax({
				url : "getCoupon.do",
				type : "post",
				dataType : "json",
				data: {couponId:couponId},
				async : true,
				success : function(data) {
					
// 					alert(data.status);
					
					if(data.status == 1){
						
						alert("成功领取");
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