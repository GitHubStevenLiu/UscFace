
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
	    <title>我的店铺</title>
	    <link href="css/guang.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<section class="shop">
			<div class="shopInfo">
				<div class="shopPhoto">
					<img src="images/store.png" />
				</div>
				<div class="shopCon1">
					<span class="name">万岁回转寿司</span>
				</div>
				<div class="shopCon2">
					<span class="xiugai">修改密码</span>
				</div>
			</div>
		</section>
		
		<section class="shopDetail">
			<form action>
				<div class="shopDetailHeader">
					店铺基本信息：
				</div>
				<div class="details">
					<label>店铺名称：</label>
					<label id="shopName">万岁回转寿司</label>
				</div>
				<div class="details">
					<label>地址：</label>
					<label id="address">正佳广场四楼403卡</label>
				</div>
				<div class="details">
					<label>电话：</label>
					<label id="photoNo">020-598475542</label>
				</div>
				
				<div class="details detail-AD">
					<label>店铺形象广告：</label>
					<div class="cameraIcon">
						<input id="uploadImage" type="file" multiple="multiple" accept="image/*" />
					</div>
					<textarea id="ta-shopAD" row="8" cols="30" class="textarea-control"></textarea> 
				</div>

			  <button type="submit" class="btn btn-form btnApply">保存</button>
			  <input type="button" class="btn btn-form btnReset" value="取消" />
			</form>							
		</section>
	</body>
</html>