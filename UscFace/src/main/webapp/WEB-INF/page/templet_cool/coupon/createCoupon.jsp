
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
	    <title>创建优惠券</title>
	    <link href="css/guang.css" rel="stylesheet" type="text/css">
	</head>
	<body>
		<section class="woList myWoList">
			<div class="infoTitle">
				请填写优惠信息
			</div>			
			<form>
				<div class="createCoupon">
					<div>
						<select class="form-control dropdown-control">
						  <option value="1">优惠券</option>
						</select>			
					</div>
					<div>
						<select class="form-control dropdown-control">
						  <option value="10">10</option>
						  <option value="15">15</option>
						  <option value="20">20</option>
						  <option value="25">25</option>
						</select>
					</div>
					<div class="coupon">
						<img src="images/coupon.png" alt="优惠券" title="优惠券"/>
					</div>
				</div>
				<div class="inputsControls">
					<div class="textHead"><label>卡券数量</label></div>
					<div class="textInput"><input class="form-control" type="tel" inputmode="numberic" pattren="[0-9]*" placeholder="请输入卡券数量" /></div>
				</div>
				<div class="inputsControls">
					<div class="textHead"><label>活动时间</label></div>
					<div class="dateInput">
						<input class="form-control date-control" type="date" name="start_date" />
						<label>至</label>
						<input class="form-control date-control endDate" type="date" name="end_date" />
					</div>
				</div>	
				<div class="inputsControls">
					<div class="textaeraHead"><label>使用规则</label></div>
					<div class="textInput">
						<textarea id="textarea1" rows="5" cols="20" class="textarea-control" placeholder="."></textarea>
					</div>
				</div>
				<div class="agreeCheck">
					<input id="agree" name="agree" type="checkbox" />
					<label for="agree" id="fakeCheck"></label>
					<label for="agree" id="agreeText"> 点击添加优惠券表示同意<a href="#">《优惠券使用协议》</a></label>
				</div>					
				<div class="button-controls">
					<input class="btn-default btn submit" type="submit" value="添加优惠"/>
					<input class="btn-default btn cancel" type="button" value="取消"/>
				</div>						
			</form>
		</section>
	</body>
</html>