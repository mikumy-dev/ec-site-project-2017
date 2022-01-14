<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>/frontend">
	<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>发表评论</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/appstyle.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mycss.css" />
		<script type="text/javascript" src="../js/jquery-1.7.2.min.js"></script>

  </head>
  
  <body>
    <!-- header -->
    <c:import url="userheader.jsp"></c:import>    
    <!-- header -->
    
    <div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-comment">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">发表评论</strong> / <small>Make&nbsp;Comments</small></div>
						</div>
						<hr/>

						<div class="comment-main">
						<span style="display:none;" class="uid">${user.uid }</span>
						<c:forEach items="${orderPojo.list }" var="info">
							<div class="comment-list">
								<div class="item-pic">
									<a href="#" class="J_MakePoint">
										<img src="${info.pic }" class="itempic">
									</a>
								</div>

								<div class="item-title">

									<div class="item-name">
										<a href="#">
											<p class="item-basic-info">${info.productName }</p>
										</a>
									</div>
									<div class="item-info">
										<div class="info-little">
										<span style="display:none;" class="tid">${info.tasteid }</span>
											<span>口味：${info.tasteName }</span>
											<span>数量：${info.num }</span>
										</div>
										<div class="item-price">
											价格：<strong>${info.price }元</strong>
										</div>										
									</div>
								</div>
								<div class="clear"></div>
								<span style="display:none;" class="pid">${info.productid }</span>
								<div class="item-comment">
									<textarea placeholder="请写下对宝贝的感受吧，对他人帮助很大哦！"></textarea>
								</div>
								
								<div class="item-opinion">
									<li><i class="op1" value="A"></i>好评</li>
									<li><i class="op2" value="B"></i>中评</li>
									<li><i class="op3" value="C"></i>差评</li>
								</div>
							</div>
						</c:forEach>	
							
								<div class="info-btn">
									<div class="am-btn am-btn-danger">发表评论</div>
								</div>							
					<script type="text/javascript">
						$(document).ready(function() {
							$(".comment-list .item-opinion li").click(function() {	
								$(this).prevAll().children('i').removeClass("active");
								$(this).nextAll().children('i').removeClass("active");
								$(this).children('i').addClass("active");
								
							});
							$(".am-btn").click(function(){
								var commentList = new Array();
								//获取商品的id、评价内容、好评中评差评
								var commentListDivs = $(".comment-list");
								for (var i=0;i<commentListDivs.length;i++){
									if($(commentListDivs[i]).find("textarea").val()=="" || $(commentListDivs[i]).find(".active")==null){
										alert("请选取评价等级并填写评论内容！");
										return false;
									}else{
										var obj = {
											productid: parseInt($(commentListDivs[i]).find(".pid").text()),
											content: $(commentListDivs[i]).find("textarea").val(),
											status: $(commentListDivs[i]).find(".active").attr('value'),
											tasteid: parseInt($(commentListDivs[i]).find(".tid").text()),
											userid: parseInt($(".uid").text())
										};
										commentList.push(obj);
									}
								}
								
								$.ajax({  
								    type: "POST",  
								    url: "comment/addComment",  
								    data: JSON.stringify(commentList),//将对象序列化成JSON字符串  
								    dataType:"json",  
								    contentType : 'application/json;charset=utf-8', //设置请求头信息  
								    success: function(msg){  
								    	window.location.href="comment/selectByUserId?pageNo=1&userid="+$(".uid").text();
								    } 
								     
								}); 
							});
				     })
					</script>					
					
												
							
						</div>

					</div>

				</div>
				
				<!--底部-->
				<c:import url="userfooter.jsp"></c:import>
				<!--底部-->
			</div>

			<!-- aside -->
			<c:import url="userleft.jsp"></c:import>
			<!-- aside -->
			
		</div>
  
  </body>
</html>
