<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":"+request.getServerPort()+path + "/";
%>

<!DOCTYPE HTML >
<html>
<head>
<base href="<%=basePath%>">
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
<title>购物车页面</title>

<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/basic/css/demo.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/cartstyle.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/optstyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mycss.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
</head>
<body>
	<!-- header -->
	<c:import url="goodsheader.jsp"></c:import>
	<!-- header -->
	<div class="concent">
		<div id="cartTable">
			<div class="cart-table-th" >
				<div class="wp" >
					<div class="th th-chk">
						<div id="J_SelectAll1" class="select-all J_SelectAll"></div>
					</div>
					<div class="th th-item">
						<div class="td-inner">商品信息</div>
					</div>
					<div class="th th-price">
						<div class="td-inner">单价</div>
					</div>
					<div class="th th-amount">
						<div class="td-inner">数量</div>
					</div>
					<div class="th th-sum">
						<div class="td-inner">金额</div>
					</div>
					<div class="th th-op">
						<div class="td-inner">操作</div>
					</div>
				</div>
			</div>

			<tr class="item-list" >
				<div class="bundle  bundle-last ">
					<div class="bundle-main">
						<!-- 遍历购物车开始 -->
						<c:forEach items="${shopcartListOnPage }" var="map">
						<ul class="item-content clearfix">
							<li class="td td-chk">
								<div class="cart-checkbox ">
									<input class="check" id="" name=""  type="checkbox"> 
								</div>
							</li>
							<input type="hidden" name="pid" id="pid" value="${map.pid }"/>
							<li class="td td-item">
								<div class="item-pic">
									<a href="#" target="_blank" data-title="${map.pname }" class="J_MakePoint" data-point="tbcart.8.12"> 
										<img src="${map.ppic }" class="itempic J_ItemImg" style="width:80px;height:80px;">
									</a>
								</div>
								<div class="item-info">
									<div class="item-basic-info">
										<a href="#" target="_blank" title="${map.pname }" class="item-title J_MakePoint" data-point="tbcart.8.11">${map.pname }</a>
									</div>
								</div>
							</li>
							<li class="td td-info">
								<div class="item-props item-props-can">
									<span class="tasteid" style="display:none;">${map.tasteid }</span>
									<span class="sku-line">${map.taste }</span> 
								</div>
							</li>
							<li class="td td-price">
								<div class="item-price price-promo-promo">
									<div class="price-content">
										<div class="price-line">
											<em class="J_Price price-now" tabindex="0">${map.price }</em>
										</div>
									</div>
								</div>
							</li>
							<li class="td td-amount">
								<div class="amount-wrapper ">
									<div class="item-amount ">
										<div class="sl">
											<input class=" am-btn" name="" type="button" value="-" />
											<input class="text_box quantity1" name="" type="text" value="${map.quantity }" style="width:30px;" /> 
											<input class=" am-btn" name="" type="button" value="+" />
										</div>
									</div>
								</div>
							</li>
							<li class="td td-sum">
								<div class="td-inner">
									<em tabindex="0" class="J_ItemSum number">${map.totalPrice }</em>
								</div>
							</li>
							<li class="td td-op">
								<div class="td-inner">
									<a title="移入收藏夹" class="btn-fav addCollection">移入收藏夹</a> 
									<a href="shopcart/delete?pid=${map.pid }&tasteid=${map.tasteid}" data-point-url="#" class="delete"> 删除</a>
								</div>
							</li>
						</ul>
						</c:forEach>
						<!-- 遍历购物车结束 -->
					
					</div>
				</div>
			</tr>
		</div>
		<div class="clear"></div>

		<div class="float-bar-wrapper">
			<div id="J_SelectAll2" class="select-all J_SelectAll">
				<div class="cart-checkbox">
					<input class="check-all check" id=""  type="checkbox"> 
				</div>
				<span>全选</span>
			</div>
			<div class="operations">
				<a href="#" hidefocus="true" class="deleteAll">删除</a> 
				<a href="#" hidefocus="true" class="J_BatchFav">移入收藏夹</a>
			</div>
			<div class="float-bar-right">
				<div class="amount-sum">
					<span class="txt">已选商品</span> <em id="chooseitems">0</em>
					<span class="txt">件</span>
					<div class="arrow-box">
						<span class="selected-items-arrow"></span> <span class="arrow"></span>
					</div>
				</div>
				<div class="price-sum">
					<span class="txt">合计:</span> <strong class="price">¥<em >0.00</em>
					</strong>
				</div>
				<div class="btn-area">
					<a href="javascript:;" id="LikBuy" class="submit-btn submit-btn-disabled"> 
						<span>结&nbsp;算</span>
					</a>
				</div>
			</div>
		</div>
		<!--尾部-->
		<c:import url="goodsfooter.jsp"></c:import>
		<!--尾部结束-->
	</div>
		<script type="text/javascript">
						$(function(){
							
							var price = $(".price-now");
							var quantity = $(".quantity1");
							var totalPrice = $(".J_ItemSum");
							for(var i=0;i<price.length;i++){
								$(totalPrice[i]).text(parseFloat($(price[i]).text())*parseFloat($(quantity[i]).val()));
							}
							//按+—改变数量和金额
							$(".am-btn").click(function(){
								var operator = $(this).val();
								var osl = $(this).parent();
								var num = parseInt(osl.children(".quantity1").val());
								var oul = $(this).parents("ul");
								var price = parseFloat(oul.find(".J_Price").html());
								var tot = parseFloat(oul.find(".J_ItemSum").html());
								var sum = parseFloat($(".price-sum").find("em").html());
								var numsum = parseInt($("#chooseitems").html());
								
								if(oul.find(".check").is(':checked')){
									if(operator=="+"){
										num+=1;
										$(".price-sum").find("em").html((sum+price).toFixed(2));
										$("#chooseitems").html(numsum+1);
									}
									if(operator=="-"){
										if(num>1){
											num--;
											$(".price-sum").find("em").html((sum-price).toFixed(2));
											$("#chooseitems").html(numsum-1);
										}else{
											num=1;
										}
									}
								}else{
									if(operator=="+"){
										num+=1;
									}
									if(operator=="-"){
										if(num>1){
											num--;
										}else{
											num=1;
										}
									}
								}
								osl.children(".quantity1").val(num);
								tot = num*price;
								oul.find(".J_ItemSum").html(tot.toFixed(2));
								
							});
							
							//添加收藏
							$(".addCollection").on("click",function(){
								var oul = $(this).parents("ul");
								var pid = oul.find("#pid").val();
								$.ajax({
									type:"POST",
									url:"collection/addCollection",
									data:"productid="+pid+"&userid=${user.uid}&createdBy=${user.username}",
									success:function(msg){
										if(msg=="1"){
											alert("添加收藏成功！");
										}else{
											alert("您已收藏！");
										}
									}
								});
							});
							
							//勾选改变总价
							$(".check").click(function(){
								
								var oul = $(this).parents("ul");
								var tot = parseFloat(oul.find(".J_ItemSum").html());
								var num = parseFloat(oul.find(".quantity1").val());
								var sum = parseFloat($(".price-sum").find("em").html());
								var numsum = parseFloat($("#chooseitems").html());
								
								if($(this).is(':checked')){
									$(".price-sum").find("em").html((sum+tot).toFixed(2));
									$("#chooseitems").html(numsum+num);
								}else{
									$(".check-all").attr("checked", false);
									$(".price-sum").find("em").html((sum-tot).toFixed(2));
									$("#chooseitems").html(numsum-num);
								}
								
							});
							
							//全选
							$(".check-all").click(function(){
								var oTot = $(".J_ItemSum");
								var oNum = $(".quantity1");
								var sum = 0;
								var numsum = 0;
								
								if($(this).is(':checked')){
									for(var i=0;i<oTot.length;i++){
										numsum+=parseFloat($(oNum[i]).val());
										sum+=parseFloat($(oTot[i]).text());
									}
									$(":checkbox").attr("checked", true); 
									$(".price-sum").find("em").html(sum.toFixed(2));
									$("#chooseitems").html(numsum);
								}else{
									$(":checkbox").attr("checked", false);
									$(".price-sum").find("em").html(0);
									$("#chooseitems").html(0);
								}								
							});
							
							//结算
							$("#LikBuy").click(function(){
								var orderScheduleList = new Array();
								//获取勾选商品的id、口味、数量
								var ullist = $(".item-content");
								for (var i=0;i<ullist.length;i++){
									if($(ullist[i]).find(".check").is(':checked')){
										var obj = {
											productid: parseInt($(ullist[i]).find("#pid").val()),
											taste: parseInt($(ullist[i]).find(".tasteid").html()),
											num: parseInt($(ullist[i]).find(".quantity1").val())
										};
										orderScheduleList.push(obj);
									}
								}
								if(orderScheduleList.length>0){
								$.ajax({  
								    type: "POST",  
								    url: "order/shopcartOrder",  
								    data: JSON.stringify(orderScheduleList),//将对象序列化成JSON字符串  
								    dataType:"json",  
								    contentType : 'application/json;charset=utf-8', //设置请求头信息  
								    success: function(msg){  
								    	window.location.href="frontend/pay.jsp";
								    } 
								     
								}); 
								}else{
									alert("请勾选商品！");
									return false;
								}
							});
							
						});
						
						</script>
</body>
</html>
