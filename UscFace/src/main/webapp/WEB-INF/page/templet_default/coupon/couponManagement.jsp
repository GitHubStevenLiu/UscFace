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
	content="width=device-width,initial-scale=1,user-scalable=no">
<title>优惠券管理</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/coupon.css">
</head>
<body>

	<div class="nav clearfix">
		<div id="bg">
			<img src="../images/coupon/nav.png" alt="">
		</div>
		<ul>
			<li class="active" onclick="showCoupon('unUsed-list')"><span>制作中</span>
				<span>${status1Num}</span></li>
			<li onclick="showCoupon('used-list')"><span>待确认</span> <span>${status2Num}</span>
			</li>
			<li onclick="showCoupon('expired-list')"><span>进行中</span> <span>${status3Num}</span>
			</li>
		</ul>
	</div>

	<c:forEach items="${status1}" var="item">
		<div class="list unUsed-list" style="display: block">
			<div class="list_item clearfix">
				<div class="img fl">
					<img src="${item.img}" alt="">
				</div>
				<div class="fl">
					<div class="font1">${item.name}</div>
					<div class="font2">正在建设中</div>
					<div class="font2">数量:${item.maxSize}张</div>
				</div>
			</div>

			<div class="op">
				<div class="fl date">
					提交时间:
					<fmt:formatDate value="${item.createTime}" pattern="yyyy/MM/dd" />
				</div>
				<div class="fl update" onclick="window.location.href='toCouponModify.do?couponId=${item.id}'">修改</div>
				<div class="fl del" onclick="deleteCoupon('${item.id}')">
					<img src="../images/coupon/del.png" alt="">
				</div>
			</div>

		</div>

	</c:forEach>


	<c:forEach items="${status2}" var="item">
		<div class="list used-list" style="display: none">
			<div class="list_item clearfix">
				<div class="img fl">
					<img src="${item.img}" alt="">
				</div>
				<div class="fl">
					<div class="font1">${item.name}</div>
					<div class="font2">等待确认中</div>
					<div class="font2">数量:${item.maxSize}张</div>
				</div>
			</div>

			<div class="op">
				<div class="fl date">
					使用期限：
					<fmt:formatDate value="${item.startTime}" pattern="yyyy/MM/dd" />
					-
					<fmt:formatDate value="${item.endTime}" pattern="yyyy/MM/dd" />
				</div>
				<div class="fl update" onclick="confirmCoupon('${item.id}')">确认</div>
				<div class="fl del" onclick="deleteCoupon('${item.id}')">
					<img src="../images/coupon/del.png" alt="">
				</div>
			</div>

		</div>
	</c:forEach>


	<c:forEach items="${status3}" var="item">
		<div class="list expired-list" style="display: none">
			<div class="list_item clearfix">
				<div class="img fl">
					<img src="${item.img}" alt="">
				</div>
				<div class="fl">
					<div class="font1">${item.name}</div>
					<div class="font2">已领取:${item.maxSize}/${item.totalNum}</div>
					<div class="font2">已使用:${item.workType}/${item.maxSize}</div>
				</div>
			</div>

			<div class="op">
				<div class="fl date">
					使用期限：
					<fmt:formatDate value="${item.startTime}" pattern="yyyy/MM/dd" />
					-
					<fmt:formatDate value="${item.endTime}" pattern="yyyy/MM/dd" />
				</div>
				<div class="fl update">活动进行时</div>
				<div class="fl del" onclick="deleteCoupon1('${item.id}')">
					<img src="../images/coupon/del.png" alt="">
				</div>
			</div>

		</div>

	</c:forEach>



	<div class="sub" onclick="window.location.href='toCouponCreate.do'">添加优惠</div>
	<div id="mask"></div>
	<!-- 	<div id="modal"> -->
	<!-- 		<div id="modal-body"> -->
	<!-- 			<div> -->
	<!-- 				<img src="../images/person/gou.png" alt=""> -->
	<!-- 				<div>成功保存</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 		<div id="modal-bottom">确定</div> -->
	<!-- 	</div> -->



	<script>
		function showCoupon(obj) {
			$(".list").hide();
			$("." + obj).show();

			if (obj == "unUsed-list") {

				$(".sub").show();
			} else if (obj == "used-list") {

				$(".sub").hide();
			} else if (obj == "expired-list") {

				$(".sub").hide();
			}
		}

		function deleteCoupon(couponId) {

			alert(couponId);

			/** 异步加载 */
			$.ajax({
				url : "couponDelete.do",
				type : "post",
				dataType : "json",
				data : {
					couponId : couponId
				},
				async : true,
				success : function(data) {

					alert(data.status);

					if (data.status == 1) {

						window.location.reload();
						alert("成功删除");

					} else if (data.status == -1) {

						alert("系统问题");
					} else if (data.status == 0) {

						alert("删除失败");
					}

				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status + " "
							+ XMLHttpRequest.readyState + " " + textStatus);
				}
			});

		}
		
		
		
		function confirmCoupon(couponId) {

			alert(couponId);

			/** 异步加载 */
			$.ajax({
				url : "couponPublish.do",
				type : "post",
				dataType : "json",
				data : {
					couponId : couponId
				},
				async : true,
				success : function(data) {

					alert(data.status);

					if (data.status == 1) {

						window.location.reload();
						alert("成功发布");

					} else if (data.status == -1) {

						alert("系统问题");
					} else if (data.status == 0) {

						alert("发布失败");
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
<script src="../js/jquery/jquery-1.11.2.min.js"></script>
<script src="../js/coupon.js"></script>
</html>