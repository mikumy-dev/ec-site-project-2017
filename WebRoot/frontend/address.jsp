<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML  >
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>地址管理</title>

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
							<strong class="am-text-danger am-text-lg">地址管理</strong> / <small>Address&nbsp;list</small>
						</div>
					</div>
					<hr />
					<ul class="am-avg-sm-1 am-avg-md-3 am-thumbnails">
						<!-- 遍历出地址 -->
						<c:forEach items="${addressList }" var="addr">
						
						<li class="user-addresslist defaultAddr"><span
							class="new-option-r"><i class="am-icon-check-circle"></i>默认地址</span>
							<p class="new-tit new-p-re">
								<span class="new-txt">${addr.consignee }</span> <span
									class="new-txt-rd2">${addr.phone }</span>
							</p>
							<div class="new-mu_l2a new-p-re">
								<p class="new-mu_l2cw">
									<span class="title">地址：${addr.addr }</span> 
								</p>
							</div>
							<div class="new-addr-btn">
								<a href="address/editAddr?id=${addr.id}">
									<i class="am-icon-edit"></i>编辑
								</a> 
								<span class="new-addr-bar">|</span> 
								<a href="javascript:;" onclick="delClick('${addr.id}');">
									<i class="am-icon-trash"></i>删除
								</a>
							</div>
						</li>
						</c:forEach>
						<!-- 遍历出地址结束 -->
					</ul>
					<div class="clear"></div>
					<a class="new-abtn-type" data-am-modal="{target: '#doc-modal-1', closeViaDimmer: 0}">添加新地址</a>
					<!--例子-->
					<div class="am-modal am-modal-no-btn" id="doc-modal-1">
						<div class="add-dress">
							<!--标题 -->
							<div class="am-cf am-padding">
								<div class="am-fl am-cf">
									<strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add&nbsp;address</small>
								</div>
							</div>
							<hr />

							<div class="am-u-md-12 am-u-lg-8" style="margin-top: 20px;">
								<form class="am-form am-form-horizontal"  id="myform" action="address/addAddr" method="post">
									<input type="hidden" name="userid" value="${sessionScope.user.uid }"/>
									<div class="am-form-group">
										<label for="user-name" class="am-form-label">收货人</label>
										<div class="am-form-content">
											<input type="text" id="user-name" name="consignee" >
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-phone" class="am-form-label">手机号码</label>
										<div class="am-form-content">
											<input id="user-phone" name="phone"  type="text">
										</div>
									</div>
									<div class="am-form-group">
										<label for="user-address" class="am-form-label">所在地</label>
										<div class="am-form-content address">
											<select  id="province" name="province">
												
											</select> 
											<select  id="city" name="city">
												 
											</select> 
											<select  id="area" name="area">
												 
											</select>
										</div>
									</div>

									<div class="am-form-group">
										<label for="user-intro" class="am-form-label">详细地址</label>
										<div class="am-form-content">
											<textarea class="" rows="3" id="user-intro"  name="addr"></textarea>
											<small>100字以内写出你的详细地址...</small>
										</div>
									</div>

									<div class="am-form-group">
										<div class="am-u-sm-9 am-u-sm-push-3">
											<input class="am-btn am-btn-danger"  type="submit" value="保存"/> 
											<a href="javascript:;" class="am-close am-btn am-btn-danger" data-am-modal-close>取消</a>
											<span>${addrmsg }</span>
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
//删除地址的js
//传入地址的id值
function delClick(id){
	//异步删除
	var flag = confirm("您确定要删除这个收货地址吗？");
	if(!flag){
		return;
	}
	
	$.ajax({
		type:"POST",
		url:"address/deleteAddress",
		data:"aid="+id,
		success:function(msg){
			location.reload();
		}
	});
}

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

<script>
//省市联动的js
	$(function(){
		$.ajax({
			type:"get",
			url:"address/getProvinces",
			success:function(data){
				var optionStr = "";
				var json = eval("("+data+")");
				for(var i=0;i<json.length;i++){
					optionStr += "<option value='"+json[i].provinceid+"'>"+json[i].province+"</option>";
				}
				$("#province").append(optionStr);
			}
		});
	});

	$("#province").change(function(){
		$.ajax({
			type:"post",
			data:"provinceId="+$("#province").val(),
			url:"address/getCityByProvinceId",
			success:function(data){
				$("#city").empty(); //清空
				var optionStr = "";
				var json = eval("("+data+")");
				for(var i=0;i<json.length;i++){
					optionStr += "<option value='"+json[i].cityid+"'>"+json[i].city+"</option>";
				}
				$("#city").append(optionStr);
			}
		});
		
	});
	
	$("#city").change(function(){
		$.ajax({
			type:"post",
			data:"cityId="+$("#city").val(),
			url:"address/getAreaByCityId",
			success:function(data){
				$("#area").empty(); //清空
				var optionStr = "";
				var json = eval("("+data+")");
				for(var i=0;i<json.length;i++){
					optionStr += "<option value='"+json[i].areaid+"'>"+json[i].area+"</option>";
				}
				$("#area").append(optionStr);
			}
		});
		
	});
</script>
</body>
</html>
