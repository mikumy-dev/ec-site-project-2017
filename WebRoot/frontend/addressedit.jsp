<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML  >
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>地址修改</title>

<link
	href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">

<link href="${pageContext.request.contextPath }/css/personal.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/addstyle.css"
	rel="stylesheet" type="text/css">
<script
	src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/jquery.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mycss.css" />
</head>
<body>
	<!-- header -->
	<c:import url="userheader.jsp"></c:import>
	<!-- header -->
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">
				<div class="user-address">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">地址修改</strong> / <small>Address&nbsp;list</small>
						</div>
					</div>
					<hr />
					<div class="am-modal am-modal-no-btn" id="doc-modal-1">
						<div class="add-dress">
							<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
								<form class="am-form am-form-horizontal"  id="myform" action="update" method="post">
									<input type="hidden" name="id" value="${addr.id }"/>
									<div class="am-form-group">
										<label for="user-name" class="am-form-label">收货人</label>
										<div class="am-form-content">
											<input type="text" id="user-name" name="consignee" value="${addr.consignee }" />
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-phone" class="am-form-label">手机号码</label>
										<div class="am-form-content">
											<input id="user-phone" name="phone"  type="text" value="${addr.phone }" />
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-intro" class="am-form-label">详细地址</label>
										<div class="am-form-content">
											<textarea class="" rows="3" id="user-intro"  name="addr">
												${addr.addr }
											</textarea>
											<small>100字以内写出你的详细地址...</small>
										</div>
									</div>

									<div class="am-form-group">
										<div class="am-u-sm-9 am-u-sm-push-3">
											<input class="am-btn am-btn-danger"  type="submit" value="保存"/> 
											<a href="javascript:history.go(-1);" class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
	 <div class="clear"></div>
			</div>
			<!--底部-->
			<c:import url="userfooter.jsp"></c:import>
			<!--底部-->
		</div>
		<!-- aside -->
		<c:import url="userleft.jsp"></c:import>
		<!-- aside -->
	</div>

<script >
//新增地址的onsubmit事件的判断
$(function(){
	$("#myform").submit(function(){
		if($("#user-name").val() == ""){
			alert("收件人姓名不能为空。");
			return false;
		}
		
		if($("#user-phone").val() == ""){
			alert("收件人电话不能为空。");
			return false;
		}
		
		if($("#user-phone").val().length != 11){
			alert("收件人电话位数不正确。");
			return false;
		}
		
		if($("#user-intro").val() == ""){
			alert("详细地址不能为空。");
			return false;
		}
		
		return true;
	});
});


</script>
	

<script >
$(document).ready( function() {
	$(".new-option-r").click( function() {
			$(this).parent('.user-addresslist') .addClass("defaultAddr") .siblings().removeClass("defaultAddr");
		});

	var $ww = $(window).width();
	if ($ww > 640) {
		$("#doc-modal-1").removeClass("am-modal am-modal-no-btn");
	}
});
</script>

</body>
</html>
