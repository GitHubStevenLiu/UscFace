<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<title>意见反馈</title>
	<link rel="stylesheet" href="../css/reset.css">
	<link rel="stylesheet" href="../css/faceback.css">
	<script src="../js/jquery/jquery-1.11.2.min.js"></script>
</head>
<body>
	<div class="content">
		<textarea class="shadow" name="" id="feedback" placeholder="感谢您宝贵的建议和留言..."></textarea>
	</div>
	<div class="msg">我们会尽快回复您,您的资料将会保密处理</div>
	<div class="sub" onclick="submitMsg()">提交</div>
	
	
	<script>
	
	function submitMsg(){
		
		var feedbackMsg = $('#feedback').val();
		
		/** 异步加载 */
		$.ajax({
			url : "faceback.do",
			type : "post",
			dataType : "json",
			data: {content:feedbackMsg},
			async : true,
			success : function(data) {				
				
				if(data.status == 1){
					
					alert("成功反馈");
					
				}else if(data.status == -1){
					
					alert("系统问题");
				}else if(data.status == 0){
					
					alert("反馈失败");
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