<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<title>优惠券详情</title>
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/person.css">
</head>
<body>
<c:forEach items="${myCoupon}" var="item">
	<div class="bg1">
		<div class="clearfix box1">
			<div class="fl logo"><img class="img2" src="${item.img}" alt=""></div>
			<div class="fl box2">
				<div class="font1">${item.name}</div>
				<div class="font2">${item.cid}</div>
				
				
						<div class="expiredDate">有效截止：<fmt:formatDate value="${item.useTime}" pattern="yyyy/MM/dd"  /></div>
			</div>
		</div>
		<div class="p-b-20">
			<div class="h1">优惠券号:${item.couponNum}</div>
			<div class="codeImg"><img class="img2" src="../images/person/code.jpg" alt=""></div>
		</div>
	</div>
	<div class="">
		<div class="head">使用说明</div>
		<div class="main">
			<div>1.${item.extraString}</div>
			<div>2.刺身特价就睡了饮料</div>
			<div>3.不予商家其他活动同事想用</div>
			<div>4.最终解释权归商家所有</div>
		</div>
	</div>
	
</c:forEach>

</body>
</html>