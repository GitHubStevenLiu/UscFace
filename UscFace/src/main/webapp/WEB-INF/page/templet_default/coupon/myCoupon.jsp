<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-CN" >
	<head>
		<jsp:include page="../common/head.jsp"></jsp:include>
	    <meta charset="utf-8">
	    <meta name="keywords" content="逛周边,移动电商服务平台" />
	    <meta name="HandheldFriendly" content="True">
	    <meta name="MobileOptimized" content="320">
	    <meta name="format-detection" content="telephone=no">    
	    <meta http-equiv="cleartype" content="on">
	    <meta name="referrer" content="always">   
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1"> 
	    <title>我的优惠券</title>
	    <link href="../css/guang.css" rel="stylesheet" type="text/css">
	    <script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
	</head>
	<body>
		
		
		<section class="woList myWoList">
			<ul class="btn-group">
				<li><a onclick="showCoupon('unUsed-list',1)" class="btn btn-default">未使用 (<em id="count-list1">${status1Num}</em>)</a></li>
				<li><a  onclick="showCoupon('used-list',2)" class="btn btn-default">已使用 (<em id="count-list2">${status2Num}</em>)</a></li>
				<li><a  onclick="showCoupon('expired-list',3)" class="btn btn-default">已过期 (<em id="count-list3">${status3Num}</em>)</a></li>
			</ul>
			<div class="searchBar">
				<form class="search-form" method="post" autocomplete="off">
					<button class="s-btn" type="button"></button>
					<input class="search search-key" name="key" type="text" placeholder="搜索/关键字/拼音" />
				</form>
			</div>
			
			<div class="couponList unUsed-list list1"style="display:block">
				<c:forEach items="${status1}" var="item">
					<div class="coupon">
					<div class="logo"><img style="width:100px;" src="${item.img}" /></div>
					<div class="publishDetail" _id="${item.id}" onclick="showCouponInfo(this)" >
						<h3>${item.name }</h3>
						<h3 class="couponValue">${item.cid}</h3>
						<div class="expiredDate">有效截止：<fmt:formatDate value="${item.useTime }" pattern="yyyy/MM/dd" /></div>
						<h3 class="couponNo"></h3>
					</div>
					
						<div style="float:right;padding:30px 10px;text-align:center;">
					 		<img src="../img/use.png" style="vertical-align: middle;text-align: center;width:23px;height:23px;"   onclick="showCouponInfo(this)">
							<h5 style="color: #ED6C2B;display: block;margin:10px 0 0 0;" id="overDue" onclick="window.location.href='../myCoupon/toMyCouponInfo.do?mycouponId=${item.id}'">去使用</h5>
						</div>
					</div>
					</c:forEach>
			</div>
			
			
			
			<div class="couponList used-list list2"  style="display:none">
				<c:forEach items="${status2}" var="item">
					<div class="coupon">
						<div class="logo"><img style="width:100px;" src="${item.img}" /></div>
						<div class="publishDetail"   _id="${item.id}" onclick="showCouponInfo(this)">
							<h3>${item.name}</h3>
							<h3 class="couponValue">${item.cid}</h3>
							<div class="expiredDate">有效截止：<fmt:formatDate value="${item.useTime }" pattern="yyyy/MM/dd" /></div>
							<h3 class="couponNo"></h3>
						</div>
							<div style="float:right;padding:30px 10px;text-align:center;">
					 	<img src="../img/overdue_xxx.png" style="vertical-align: middle;text-align: center;width:23px;height:23px;" _id="${item.id}" onclick="deleteCoupon(this)">
							<h5 style="color: #ED6C2B;display: block;margin:10px 0 0 0;" id="overDue">删除</h5>
						</div>
					</div>
					</c:forEach>
				</div>
			
			
			
				<div class="couponList expired-list list3"  style="display:none">
					<c:forEach items="${status3}" var="item">
					<div class="coupon">
					<div class="logo"><img style="width:100px;" src="${item.img}" /></div>
					<div class="publishDetail"   _id="${item.id}" onclick="showCouponInfo(this)">
						<h3>${item.name}</h3>
						<h3 class="couponValue">${item.cid}</h3>
						<div class="expiredDate">有效截止：<fmt:formatDate value="${item.useTime }" pattern="yyyy/MM/dd" /></div>
						<h3 class="couponNo"></h3>
					</div>
					<div style="float:right;padding:30px 10px;text-align:center;">
					 	<img src="../img/overdue_xxx.png" style="vertical-align: middle;text-align: center;width:23px;height:23px;"  _id="${item.id}" onclick="deleteCoupon(this)">
							<h5 style="color: #ED6C2B;display: block;margin:10px 0 0 0;" id="overDue">删除</h5>
					</div>
					</div>
					</c:forEach>
				</div>
			
			
			
			
		</section>
		<div id="TipsDialog"  style="opacity:0.9;width: 255px; height: 45px; position: fixed; margin:0 auto; top: 40%;display:none">
		<div id="text-tips" class="text-tips">这里是提示信息文本！</div>
		</div>

	<script>
		var width = document.body.scrollWidth;
		var left = (width-255)*0.5;
		$("#TipsDialog").css("left",left);
	</script>	
		
		
	</body>
	
	<script>
	var status=1;//默认显示未使用优惠券列表
	
	$('.search-form').submit(function(e){
		var key = $(".search-key").val();
		if(key==""){
			showTips("请输入搜索关键词！");
			return false;
		}else{
			$.ajax({
				url : "myCouponSearch.do",
				type : "post",
				dataType : "json",
				data: {keyName:key,status:status},
				async : true,
				success : function(data) {
					$(".list"+status).empty();
					var count=0;
					$.each(data,function(i,item){
						if(status ==1){
							$(".list"+status).append("<div class=\"coupon\"><div class=\"logo\"><img style=\"width:100px;\" src='"+item.img+"' /></div><div class=\"publishDetail\" _id="+item.id+" onclick=\"showCouponInfo(this)\" ><h3>"+item.name+"</h3><h3 class=\"couponValue\">"+item.title+"</h3><div class=\"expiredDate\">有效截止："+item.useTime+"</div><h3 class=\"couponNo\">优惠券号："+item.couponCode+"</h3></div><div style=\"float:right;padding:30px 10px;text-align:center;\"><img src=\"img/use.png\" style=\"vertical-align: middle;text-align: center;width:23px;height:23px;\"  _id="+item.id+" onclick=\"showCouponInfo(this)\"><h5 style=\"color: #ED6C2B;display: block;margin:10px 0 0 0;\" id=\"overDue\">去使用</h5></div></div>");
						}else{
							$(".list"+status).append("<div class=\"coupon\"><div class=\"logo\"><img style=\"width:100px;\" src='"+item.img+"' /></div><div class=\"publishDetail\" _id="+item.id+" onclick=\"showCouponInfo(this)\" ><h3>"+item.name+"</h3><h3 class=\"couponValue\">"+item.title+"</h3><div class=\"expiredDate\">有效截止："+item.useTime+"</div><h3 class=\"couponNo\">优惠券号："+item.couponCode+"</h3></div><div style=\"float:right;padding:30px 10px;text-align:center;\"><img src=\"img/overdue_xxx.png\" style=\"vertical-align: middle;text-align: center;width:23px;height:23px;\"  _id="+item.id+" onclick=\"deleteCoupon(this)\"><h5 style=\"color: #ED6C2B;display: block;margin:10px 0 0 0;\" id=\"overDue\">删除</h5></div></div>");
						}
						count++;
					});
					$("#count-list"+status).text(count);
				},
				error:function(XMLHttpRequest, textStatus, errorThrown) {
		            alert(XMLHttpRequest.status+" "+XMLHttpRequest.readyState+" "+textStatus);
		        }
			});
			return false;
		}	
	});
		function showCoupon(obj,type){
			$(".couponList").hide();
			$("."+obj).show();
			status = type;
		}
		
		 function showCouponInfo(obj){
			 var id= $(obj).attr("_id");
			 window.location.href="myCouponInfo.do?id="+id;
		 }
		 
		 
		 
		 function deleteCoupon(obj){
			 	var myCouponId= $(obj).attr("_id");
			 	if(!confirm("确认删除该优惠券？")){
			 		return;
			 	}
				/** 异步加载商城 */
				$.ajax({
					url : "deleteMyCoupon.do",
					type : "post",
					dataType : "json",
					data: {mycouponId:myCouponId},
					async : true,
					success : function(data) {
						if(data.status==1){
							showTips("删除优惠券成功！");
							setTimeout(function(){
								window.location.href="toInfo.do"; 
					    	},1000);
						}else{
							showTips("亲！系统繁忙请稍后操作。");
						}
					},
					error:function(XMLHttpRequest, textStatus, errorThrown) {
			            alert(XMLHttpRequest.status+" "+XMLHttpRequest.readyState+" "+textStatus);
			        }
				});
				
				
			}
		 
		 
		 $(function () {	 
		 });
	</script>
	
</html>