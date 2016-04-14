<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="zh-CN" >
	<head>
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
	    <script src="../js/jquery/jquery-1.11.2.min.js"></script>
	</head>
	<body>
		
		<section class="woList myWoList">
			<ul class="btn-group">
				<li><a onclick="showCoupon('unUsed-list')" class="btn btn-default">未使用 </a></li>
				<li><a  onclick="showCoupon('used-list')" class="btn btn-default">已使用 </a></li>
				<li><a  onclick="showCoupon('expired-list')" class="btn btn-default">已过期 </a></li>
			</ul>
			<div class="searchBar">
				
					<button class="s-btn" type="button"  onclick="searchCoupon()">搜索</button>
					<input class="search" tye="text" placeholder="搜索/关键字/拼音"  id="searchCoupon"/>
				
			</div>
			<c:forEach items="${status1}" var="item">
				<div class="couponList unUsed-list"  style="display:block" onclick="window.location.href='toMyCouponInfo.do?mycouponId=${item.id}'">
				
					<div class="coupon">
					<div class="logo"><img style="width:100px;" src="${item.img}" /></div>
					<div class="publishDetail">
						<h3>${item.name}</h3>
						<h3 class="couponValue">${item.cid }</h3>
						
						<div class="expiredDate">有效截止：<fmt:formatDate value="${item.useTime}" pattern="yyyy/MM/dd"  /></div>
					</div>
					</div>
				</div>
			</c:forEach>
			
			<c:forEach items="${status2}" var="item">
				<div class="couponList used-list" style="display:none">
				
					<div class="coupon">
					<div class="logo"><img style="width:100px;" src="${item.img}" /></div>
					<div class="publishDetail">
						<h3>${item.name}</h3>
						<h3 class="couponValue">${item.cid }</h3>
						
						<div class="expiredDate">有效截止：<fmt:formatDate value="${item.useTime}" pattern="yyyy/MM/dd" /></div>
						
					</div>
					</div>
				</div>
			</c:forEach>
			
			<c:forEach items="${status3}" var="item">
				<div class="couponList expired-list"  style="display:none">
				
					<div class="coupon">
					<div class="logo"><img style="width:100px;" src="${item.img}" /></div>
					<div class="publishDetail">
						<h3>${item.name}</h3>
						<h3 class="couponValue">${item.cid }</h3>
						<div class="expiredDate">有效截止：<fmt:formatDate value="${item.useTime}" pattern="yyyy/MM/dd" /></div>
						
					</div>
					</div>
				</div>
			</c:forEach>
			
			
			
		</section>
	</body>
	
	<script>
	
	var couponId = "unUsed-list";
	
		function showCoupon(obj){
			$(".couponList").hide();
			$("."+obj).show();
			
			couponId = obj;
			//alert(couponId);
		}
		
		
		function searchCoupon(){
			
			var status ;
			var keyName = $('#searchCoupon').val();
			
			if(couponId == "unUsed-list"){
				
				status = 1;
			}else if(couponId == "used-list"){
				
				status = 2;
			}else if(couponId == "expired-list"){
				
				status = 3;
			}
			
			
			/** 异步加载 */
			$.ajax({
				url : "myCouponSearch.do",
				type : "post",
				dataType : "json",
				data: {status:status,keyName:keyName},
				async : true,
				success : function(data) {				
					
					
					if(data.status == 1){
						
						alert("搜索成功");
						
						
						for(var i = 0;i < data.data.length;i++){
							alert(data.data[i].img);
							alert(data.data[i].name);
							alert(data.data[i].cid);
							alert(data.data[i].useTime);
							alert(data.data[i].id);
						}	
						
						
						
					}else if(data.status == -1){
						
						alert("系统问题");
					}else if(data.status == 0){
						
						alert("搜索失败");
					}
											
					
				},
				error:function(XMLHttpRequest, textStatus, errorThrown) {
		            alert(XMLHttpRequest.status+" "+XMLHttpRequest.readyState+" "+textStatus);
		        }
			});
			
			
			
		}
		
	
	
	</script>
	
</html>