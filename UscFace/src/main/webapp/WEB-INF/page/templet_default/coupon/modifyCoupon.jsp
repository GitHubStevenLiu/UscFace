<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<jsp:include page="../common/head.jsp"></jsp:include>

<meta charset="utf-8">
<meta name="keywords" content="逛周边,移动电商服务平台" />
<meta name="HandheldFriendly" content="True">
<meta name="MobileOptimized" content="320">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="cleartype" content="on">
<meta name="referrer" content="always">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>创建优惠券</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link
	href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../css/guang.css" rel="stylesheet" type="text/css">
</head>
<body>
	<section class="woList myWoList">
		<div class="infoTitle">请填写优惠信息</div>
		<form>
			<div class="createCoupon">
				<div>
					<select class="form-control dropdown-control"
						onchange="changeCouponChild()" id="sel-couponList" onclick="displayOption()">
						
							<option value="${currentType.id}" id="cType">${currentType.name}</option>
							
							<c:forEach items="${cType}" var="item">
							<option value="${item.id}"  id="cTypeMore">${item.name}</option>
						</c:forEach>
						
					</select>
				</div>
				<div>
					<select class="form-control dropdown-control" id="opType"
						onchange="changeCouponType(this)">
							<option value="${currentTemp.id},${currentTemp.img}" id="cTemp">${currentTemp.name}</option>
						<c:forEach items="${cTemp}" var="item">
							<option value="${item.id},${item.img}" style="display:none" id="cTempMore">${item.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="coupon" style="text-align: center; padding: 10px 0;">
					
						<img id="coupon-img" src="${currentTemp.img}" alt="优惠券" title="优惠券" />
					
				</div>
			</div>
			<div class="inputsControls">
				<div class="textHead">
					<label>优惠券</label>
				</div>
				<div class="textInput">
					<input class="form-control" id="input-createCoupon-num" type="tel"
						inputmode="numberic" pattren="[0-9]*" placeholder="请输入发放卡券数量"  value="${coupon.totalNum}"/>
				</div>
			</div>
			<div class="inputsControls">
				<div class="textHead">
					<label>活动时间</label>
				</div>
				<div class="dateInput">
					<input placeholder="日/月/年" class="form-control start-date"
						type="text" id="start-date" readonly  value="<fmt:formatDate value="${coupon.startTime}" pattern="yyyy/MM/dd"  />"/> <label>&nbsp;至&nbsp;</label>
					<input placeholder="日/月/年" class="form-control end-date"
						type="text" id="end-date" readonly  value="<fmt:formatDate value="${coupon.endTime}" pattern="yyyy/MM/dd"  />"/>
				</div>
			</div>
			<div class="inputsControls">
				<div class="textaeraHead">
					<label>使用规则</label>
				</div>
				<div class="textInput">
					<textarea id="textarea1" rows="5" cols="20"
						class="textarea-control area-useExplain" placeholder="." >${coupon.useRule}</textarea>
				</div>
			</div>
			<div class="agreeCheck">
				<input id="agree" name="agree" checked="checked" disabled="disabled"
					type="checkbox" /> <label for="agree" id="fakeCheck"></label> <label
					for="agree" id="agreeText"> 点击添加优惠券表示同意<a
					href="toAgreement.do">《优惠券使用协议》</a></label>
			</div>
			<div class="button-controls">
				<input class="btn-default btn submit" type="button"
					onclick="submitCoupon('${coupon.id}')" value="修改" /> <input
					class="btn-default btn cancel" type="button"
					onclick="history.go(-1)" value="取消" />
			</div>
		</form>
	</section>
	<script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#start-date").datepicker();
			$("#end-date").datepicker();

			$(".leftImg").click(function() {
				if ($(this)[0].className.indexOf("selected") > 0)
					$(this).removeClass("selected");
				else
					$(this).addClass("selected");
			});

			$(".rightImg").click(function() {
				if ($(this)[0].className.indexOf("selected") > 0)
					$(this).removeClass("selected");
				else
					$(this).addClass("selected");
			});
		});

		function submitCoupon(id) {
			var num = $("#input-createCoupon-num").val();
			var startDate = $("#start-date").val();
			var endDate = $("#end-date").val();
			var useExplain = $(".area-useExplain").val();
			
			var typeId = $('#opType').val();
			
			var idType = typeId.split(",")
			
			var couponId = idType[0];
			
			var startTime=new Date(startDate); 
			var endTime=new Date(endDate); 
			
			
		var timeStart = startTime.getFullYear()+"-"+(startTime.getMonth()+1)+"-"+startTime.getDate();
		var timeEnd = endTime.getFullYear()+"-"+(endTime.getMonth()+1)+"-"+endTime.getDate();
		
		
		//window.location.href = "couponCreate.do?tempetId="+couponId+'totalNum='+num+'startTime='+timeStart+'endTime='+timeEnd+'useRule='+useExplain;

			
// 		/** 异步加载 */
// 		$.ajax({
// 			url : "couponCreate.do",
// 			type : "post",
// 			dataType : "json",
// 			data: {tempetId:couponId,totalNum:num,startTime:timeStart,endTime:timeEnd,useRule:useExplain},
// 			data : {
// 				typeId : typeId
// 			},
// 			async : true,
// 			success : function(data) {

// 				if (data.status == 1) {

// 					alert("提交成功");
					
// 					window.location.href = "showInfo.do?info=您的优惠券提交成功!<br><br>等待我们的客服人员审核制作！谢谢！";

// 				} else if (data.status == 0) {
// 					alert("无数据");
// 				}

// 			},
// 			error : function(XMLHttpRequest, textStatus, errorThrown) {
// 				alert(XMLHttpRequest.status + " "
// 						+ XMLHttpRequest.readyState + " " + textStatus);
// 			}
// 		});
		

			if (num == "" || startDate == "" || endDate == "") {
				showTips("请填入完整信息！");
				return;
			}

			if (confirm("确认提交？")) {
				
				alert(num);
				alert(timeStart);
				alert(timeEnd);
				alert(couponId);
				alert(useExplain);
				
 				alert("couponCreate.do?tempetId="+couponId+"&totalNum="+num+"&startTime="+timeStart+"&endTime="+timeEnd+"&useRule="+useExplain+"&couponId="+id);
			//	window.location.href = "showInfo.do?info=您的优惠券提交成功!<br><br>等待我们的客服人员审核制作！谢谢！";
				window.location.href = "couponModify.do?tempetId="+couponId+"&totalNum="+num+"&startTime="+timeStart+"&endTime="+timeEnd+"&useRule="+useExplain+"&id="+id;
				
				
			}

		}
		
		
		function displayOption(){
			$('#cType').hide();
		}

		function changeCouponChild() {
			
			
			$('#cTemp').hide(); 
			$('#cTempMore').show();
			var typeId = $('#sel-couponList option:selected').val();

			/** 异步加载 */
			$.ajax({
				url : "getCouponTemplet.do",
				type : "post",
				dataType : "json",
				data : {
					typeId : typeId
				},
				async : true,
				success : function(data) {

					if (data.status == 1) {

						$("#opType").empty();

						for (var i = 0; i < data.data.length; i++) {

							$("#opType").append(
									'<option value="' + data.data[i].id +','+ data.data[i].img +'">'
											+ data.data[i].name + '</option>');
							
							$("#coupon-img").attr("src", data.data[0].img);
						}
						
					

					} else if (data.status == 0) {
						alert("无数据");
					}

				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status + " "
							+ XMLHttpRequest.readyState + " " + textStatus);
				}
			});

			
		}

		function changeCouponType(sel) {

			var index = sel[sel.selectedIndex].value;

			var idType = index.split(",")
			$("#coupon-img").attr("src", idType[1]);
		}
	</script>

	<div id="TipsDialog"
		style="opacity: 0.9; width: 255px; height: 45px; position: fixed; margin: 0 auto; top: 40%; display: none">
		<div id="text-tips" class="text-tips">这里是提示信息文本！</div>
	</div>

	<script>
		var width = document.body.scrollWidth;
		var left = (width - 255) * 0.5;
		$("#TipsDialog").css("left", left);
	</script>
</body>
</html>