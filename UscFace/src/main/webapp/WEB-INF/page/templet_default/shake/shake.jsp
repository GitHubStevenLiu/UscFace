<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="keywords" content="逛周边,移动电商服务平台" />
<meta name="HandheldFriendly" content="True">
<meta name="MobileOptimized" content="320">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="cleartype" content="on">
<meta name="referrer" content="always">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>摇一摇</title>
<script type="text/javascript" src="../js/common.shunyou.js"></script>
<link rel="stylesheet" type="text/css" href="../css/common.shunyou.css">
<link
	href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../css/guang.css" rel="stylesheet" type="text/css">
<script src="http://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
</head>
<body>

	<div class="bg-yy">
		<div id="hand" onclick="" class="hand hand-animate"></div>
		<div id="loading" class="loading"></div>
		<div id="result" class="result">
			<div id="result-coupon" style="display: none">
				<div class="result-title" style="font-size: 4vw;" onclick="action()"
					id="tips-result">摇一摇，惊喜来不断！</div>
				<div id="div-valid-time" style="font-size: 3vw;"
					class="result-duration">礼品券、优惠券</div>
				<div>
					<img id="couponImgId" src="../img/coupon.png" alt="代金券" title="代金券"
						class="img-responsive icon-coupon"
						style="margin: 0 auto; width: 70%;" />
				</div>
				<div class="result-handle">
					<a style="font-size: 4vw;" onclick="getCoupon()" class="get">确定领取</a>
					<a href="../coupon/toshakeCoupon.do" id="a-couponInfo"
						style="font-size: 4vw;" class="decline">取消领取</a>
				</div>
			</div>
			<div id="result-welcome"
				style="text-align: center; width: 100%; height: 30%; color: #FFF; padding: 30px 0; display: block;">
				<div style="font-size: 4vw;">爱玩！爱摇！</div>
				<div style="font-size: 4vw; margin-top: 20px;">摇一摇！更多惊喜等着你！</div>
			</div>
		</div>
	</div>
	<div>
		<audio id="musicBox" src="../sound/5018.wav" preload="auto"></audio>
	</div>
	<script src="http://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		var bgHeight = document.body.scrollHeight + "px";
		var bgWidth = document.body.scrollWidth + "px";

		var bgReWidth = (document.body.scrollWidth - 40) + "px";

		setTimeout(function() {
			document.getElementById("result").className = "result result-show";
		}, 500);

		$(".bg-yy").css({
			"height" : bgHeight,
			"width" : bgWidth
		});
		$(".result").css({
			"width" : bgReWidth
		});
		var SHAKE_THRESHOLD = 3000;
		var last_update = 0;
		var x = y = z = last_x = last_y = last_z = 0;

		if (window.DeviceMotionEvent) {
			window.addEventListener('devicemotion', deviceMotionHandler, false);
		} else {
			alert('本设备不支持devicemotion事件');
		}

		function deviceMotionHandler(eventData) {
			var acceleration = eventData.accelerationIncludingGravity;
			var curTime = new Date().getTime();

			if ((curTime - last_update) > 100) {
				var diffTime = curTime - last_update;
				last_update = curTime;
				x = acceleration.x;
				y = acceleration.y;
				z = acceleration.z;
				var speed = Math.abs(x + y + z - last_x - last_y - last_z)
						/ diffTime * 10000;
				var status = document.getElementById("status");

				if (speed > SHAKE_THRESHOLD)
					doResult();
				last_x = x;
				last_y = y;
				last_z = z;
			}
		}

		function doResult() {
			// 摇一摇开始的声音
			var media = document.getElementById("musicBox");
			media.play();
			document.getElementById("result").className = "result";
			document.getElementById("loading").className = "loading loading-show";
			setTimeout(
					function() {
						document.getElementById("result").className = "result result-show";
						document.getElementById("loading").className = "loading";
					}, 500);
			/** 异步加载商城 */
			$.ajax({
				url : "shakeLoadCoupon.do",
				type : "post",
				dataType : "json",
				async : true,
				success : function(data) {
					
					var startTime = new Date(data.data.startTime);
					var endTime = new Date(data.data.endTime);
					var timeStart = startTime.getFullYear() + "-"
							+ (startTime.getMonth() + 1) + "-"
							+ startTime.getDate();
					var timeEnd = endTime.getFullYear() + "-"
							+ (endTime.getMonth() + 1) + "-"
							+ endTime.getDate();

					$("#result-welcome").hide();
					$("#result-coupon").show();
					$('#couponImgId').attr('src', data.data.img);
					$('#couponImgId').attr('coupon_id', data.data.id);
					$('#a-couponInfo').attr("_id", data.id);
					$('#div-valid-time').text(
							"使用时间：" + timeStart + " - " + timeEnd);
					$('#tips-result').text("恭喜获得" + data.data.name);
					$(".result-handle").show();
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status + " "
							+ XMLHttpRequest.readyState + " " + textStatus);
				}
			});

		}

		function getCoupon() {

			var couponId = $('#couponImgId').attr('coupon_id');

			$.ajax({
				url : "getCoupon.do",
				type : "post",
				dataType : "json",
				data : {
					couponId : couponId
				},
				async : true,
				success : function(data) {

					if (data.status == 1) {

						$('#tips-result').text("领取成功！");
						$('#couponImgId').attr('coupon_id', "");
						$(".result-handle").hide();
					} else if (data.status == 0) {
						
						alert("您已经领取过了！！！");

					}

				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status + " "
							+ XMLHttpRequest.readyState + " " + textStatus);
				}
			});

		}

		function toCouponDetail(obj) {
			var id = $(obj).attr("_id");
			if (typeof (id) == "undefined" || "" == id) {
				showTips("先摇一摇，获得优惠券哦！");
				return;
			} else {
				window.location.href = "couponInfo.do?id=" + id;
			}

		}

		function action() {
			/** 异步加载 */
			$.ajax({
				url : "shakeLoadCoupon.do",
				type : "post",
				dataType : "json",
				async : true,
				success : function(data) {
					$('#couponImgId').attr('src', data.data.img);
					$('#couponImgId').attr('coupon_id', data.data.id);
					$('#a-couponInfo').attr("_id", data.data.id);
					$('#div-valid-time').text(
							"使用时间：" + data.data.startTime + " - "
									+ data.data.endTime);
					$('#tips-result').text("恭喜您！获得" + data.data.name);
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert(XMLHttpRequest.status + " "
							+ XMLHttpRequest.readyState + " " + textStatus);
				}
			});
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