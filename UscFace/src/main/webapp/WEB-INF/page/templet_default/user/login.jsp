<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no">
<title>登录</title>
<link rel="stylesheet" href="../css/reset.css">
<link rel="stylesheet" href="../css/login.css">
<script src="../js/jquery/jquery-1.11.2.min.js"></script>
</head>
<body>
	<div class="content">
		<div class="input">
			<label for="">账号</label> <input type="text" placeholder="请输入用户名"
				id="input-loginName" value="15674749549">
		</div>
		<div class="input">
			<label for="">密码</label> <input type="password" placeholder="请输入您的密码"
				id="input-passwd" value="123">
		</div>
		<div class="clearfix remPsw">
			<div class="checkbox fl">
				<input type="checkbox" value="0" id="remPsw">记住密码 <label
					for="remPsw"></label>
			</div>

			<span class="fr color1"
				onclick="window.location.href='toGetBackPassword.do'">找回密码?</span>
		</div>
		<div id="login" class="btn" onclick="login()">登录</div>
		<a id="register" class="btn"
			onclick="window.location.href='toRegister.do'">注册</a>
	</div>

	<script>
		function login() {

			var account = $('#input-loginName').val();
			var password = $('#input-passwd').val();

			if ('' == account || password == "") {
				showTips("请输入完整的账号密码！");
			} else {

				/** 异步加载 */
				$
						.ajax({
							url : "login.do",
							type : "post",
							dataType : "json",
							data : {
								account : account,
								password : password
							},
							async : true,
							success : function(data) {

								//alert(data.status);

								if (data.status == 1) {
									var num = 2;
									//alert("成功登录");
									window.location.href = "toLoginSuccess.do?typeTo="+ num;

									//window.location.href = "toFaceback.do";            //反馈

									//window.location.href = "toUpdatePassword.do";      //修改密码

									//	window.location.href = "toPersonMsg.do";            //个人资料

									//	window.location.href = "../myCoupon/toMyCoupon.do";    //我的优惠券

									//window.location.href = "toGetBackPassword.do";            //忘记密码

									// window.location.href = "../myCoupon/toMyCouponInfo.do?mycouponId="+num;            //优惠券详情

									// window.location.href = "toMyMessage.do";            //我的消息

									// window.location.href = "toUserCenter.do";            //个人中心

									// window.location.href = "toMallCenter.do";            //主商城

									//window.location.href = "../coupon/toshakeCoupon.do";            //摇一摇

								        // window.location.href="../mall/toMallCenter.do";       //到商城

								} else if (data.status == -1) {

									alert("系统问题");
								} else if (data.status == 0) {

									alert("账号密码错误");
								}
							},
							error : function(XMLHttpRequest, textStatus,
									errorThrown) {
								alert(XMLHttpRequest.status + " "
										+ XMLHttpRequest.readyState + " "
										+ textStatus);
							}
						});

			}

		}
	</script>

</body>

<script src="js/jquery/jquery-1.11.2.min.js"></script>
<script src="js/login.js"></script>

</html>