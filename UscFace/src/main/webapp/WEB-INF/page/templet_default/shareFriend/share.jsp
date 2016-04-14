<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
	<title>个人中心</title>
	<script type="text/javascript"  src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	
	
	
</head>
<body>

      <button class="btn btn_primary" id="checkJsApi">checkJsApi</button>
  <p><p>
      <button class="btn btn_primary" id="onMenuShareTimeline">onMenuShareTimeline</button>
      <p><p>
      <button class="btn btn_primary" id="onMenuShareAppMessage">onMenuShareAppMessage</button>

</body>

<script type="text/javascript">
alert(location.href.split('#')[0])
        wx.config({
            debug: true,
            appId: '${appId}',
            timestamp: '${params.timestamp}',
            nonceStr: '${params.nonceStr}',
            signature:'${params.signature}', 
            jsApiList: [
					'checkJsApi',
					'onMenuShareTimeline',
					'onMenuShareAppMessage',
					'onMenuShareQQ',
					'onMenuShareWeibo',
					'onMenuShareQZone',
					'hideMenuItems',
					'showMenuItems',
					'hideAllNonBaseMenuItem',
					'showAllNonBaseMenuItem',
					'translateVoice',
					'startRecord',
					'stopRecord',
					'onVoiceRecordEnd',
					'playVoice',
					'onVoicePlayEnd',
					'pauseVoice',
					'stopVoice',
					'uploadVoice',
					'downloadVoice',
					'chooseImage',
					'previewImage',
					'uploadImage',
					'downloadImage',
					'getNetworkType',
					'openLocation',
					'getLocation',
					'hideOptionMenu',
					'showOptionMenu',
					'closeWindow',
					'scanQRCode',
					'chooseWXPay',
					'openProductSpecificView',
					'addCard',
					'chooseCard',
					'openCard'	
            ]
        });
        
        </script>



<script type="text/javascript">
	function  a()
	{
		alert("~~~");
		 wx.onMenuShareTimeline({
			    title: '${sharefunctionTitle}',
			    link: '${shareUrl}',
			    imgUrl: '${shareImg}',
			    trigger: function (res) {
			      // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
			      alert('用户点击分享到朋友圈');
			    },
			    success: function (res) {
			      alert('已分享');
			    },
			    cancel: function (res) {
			      alert('已取消');
			    },
			    fail: function (res) {
			      alert(JSON.stringify(res));
			    }
			  });
	}
	//alert("~~~");
	//document.querySelector('#onMenuShareTimeline').click();
</script>


<script type="text/javascript">

wx.ready
(
		function () 
		{
			  // 1 判断当前版本是否支持指定 JS 接口，支持批量判断
			  document.querySelector('#checkJsApi').onclick = function () 
			  {
			    wx.checkJsApi({
			      jsApiList: [
			        'getNetworkType',
			        'previewImage'
			      ],
			      success: function (res) {
			        alert(JSON.stringify(res));
			      }
			    });
		};
		a();
			// 2. 分享接口
		// 2.2 监听“分享到朋友圈”按钮点击、自定义分享内容及分享结果接口
		document.querySelector('#onMenuShareTimeline').onclick = function ()
		{
		  wx.onMenuShareTimeline({
		    title: '${shareTitle}',
		    link: '${shareUrl}',
		    imgUrl: '${shareImg}',
		    trigger: function (res) {
		      // 不要尝试在trigger中使用ajax异步请求修改本次分享的内容，因为客户端分享操作是一个同步操作，这时候使用ajax的回包会还没有返回
		      alert('用户点击分享到朋友圈');
		    },
		    success: function (res) {
		      alert('已分享');
		    },
		    cancel: function (res) {
		      alert('已取消');
		    },
		    fail: function (res) {
		      alert(JSON.stringify(res));
		    }
		  });
		  alert('已注册获取“分享到朋友圈”状态事件');
		};
	}
);
		
		
wx.error(function (res) {
	  alert(res.errMsg);
	});
	

</script>


</html>
