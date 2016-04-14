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
	<title>消息通知</title>
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/message.css">
</head>
<body>

	<c:if test="${!empty message}">
	  <c:forEach items="${message}" var="item">
	 
		<div class="list_item clearfix">
			<div class="fl img"><img src="../images/message/img1.png" alt=""></div>
			<div class="fl msg">
				<div class="main">[系统通知]${item.extraString}</div>
				<div class="date"><span><fmt:formatDate value="${item.createTime}" pattern="yyyy/MM/dd"  /></span></div>
				
			</div>
			<div class="fl delete" onclick="deleteCouponMsg('${item.id}')">删除</div>
		</div>
	
	</c:forEach>
	</c:if>
	
	<script>
		function deleteCouponMsg(obj){
					
			alert(obj);
			
			/** 异步加载 */
			$.ajax({
				url : "deleteMessage.do",
				type : "post",
				dataType : "json",
				data: {messageId:obj},
				async : true,
				success : function(data) {
					
					//alert(data.status);
					
					if(data.status == 1){
						
						window.location.reload();
						alert("删除成功");
						
						
					}else if(data.status == -1){
						
						alert("系统问题");
					}else if(data.status == 0){
						
						alert("删除失败");
					}
					
					
					
				},
				error:function(XMLHttpRequest, textStatus, errorThrown) {
		            alert(XMLHttpRequest.status+" "+XMLHttpRequest.readyState+" "+textStatus);
		        }
			});
			
		}
	
	
	</script>
	
	
</body>
<script src="../js/jquery/jquery-1.11.2.min.js"></script>
<script src="../js/message.js"></script>
</html>