<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML >
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
<title>订单管理</title>
<link
	href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/personal.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/orstyle.css"
	rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mycss.css" />
<script
	src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
</head>
<body>
	<!-- header -->
	<c:import url="userheader.jsp"></c:import>
	<!-- header -->

	<div class="center">
		<div class="col-main">
			<div class="main-wrap">
				<div class="user-order">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">订单管理</strong> / <small>Order</small>
						</div>
					</div>
					<hr />
					<span style="display:none;" id="statusTag">${statusTag }</span>
					<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>
						<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
							<li class="am-active"><a href="#tab0">所有订单</a>
							</li>
							<li><a href="#tab1">待付款</a>
							</li>
							<li><a href="#tab2">待发货</a>
							</li>
							<li><a href="#tab3">待收货</a>
							</li>
							<li><a href="#tab4">待评价</a>
							</li>
						</ul>
						

						<div class="am-tabs-bd">
							<div class="am-tab-panel am-fade am-in am-active" id="tab${statusTag==null ? 0:statusTag }">
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>
									<div class="th th-operation">
										<td class="td-inner">&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</div>
									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
									<div class="th th-status">
										<td class="td-inner">交易状态</td>
									</div>
									<div class="th th-change">
										<td class="td-inner">交易操作</td>
									</div>
								</div>

								<div class="order-main">
									<div class="order-list">
										<!--交易成功-->
										<c:forEach items="${orderPojoList }" var="order">
											<div class="order-status5">
												<div class="order-title">
													<div class="dd-num">
														订单编号：<a href="javascript:;">${order.orderNum }</a>
													</div>
													<span>成交时间：${order.turnoverTime!=null ? order.turnoverTime : "尚未成交"}</span>
												</div>
												<div class="order-content">
													<div class="order-left">
														<!-- 遍历一个订单中的所有商品 开始-->
														<c:forEach items="${order.list }" var="prod">
															<ul class="item-list">
																<li class="td td-item">
																	<div class="item-pic">
																		<a href="findProductById?id=${prod.productid }"
																			class="J_MakePoint"> <img src="${prod.pic }"
																			class="itempic J_ItemImg"> </a>
																	</div>
																	<div class="item-info">
																		<div class="item-basic-info">
																			<a href="findProductById?id=${prod.productid }">
																				<p>${prod.productName }</p> </a>
																		</div>
																	</div></li>
																<li class="td td-price">
																	<div class="item-price">${prod.price }</div></li>
																<li class="td td-number">
																	<div class="item-number">
																		×<span class="item-num">${prod.num }</span>
																	</div></li>
															</ul>
														</c:forEach>
														<!-- 遍历一个订单中的所有商品 结束-->
													</div>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">合计：<span class="totalPrice"></span></div></li>
														<div class="move-right">
															<c:if test="${order.status=='1' }">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">等待买家付款</p>
																		<p class="order-info">
																			<a href="order/delete?id=${order.id }">取消订单</a>
																		</p>
																	</div></li>
																<li class="td td-change"><a href="order/gotopay?id=${order.id }">
																		<div class="am-btn am-btn-danger anniu">去支付</div>
																</a></li>
															</c:if>
															<c:if test="${order.status=='2' }">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">买家已付款</p>
																		<p class="order-info">
																			<a href="order/showOrderDetail?id=${order.id }">订单详情</a>
																		</p>
																	</div></li>
																<li class="td td-change">
																	<div class="am-btn am-btn-danger anniu">提醒发货</div></li>
															</c:if>
															<c:if test="${order.status=='3' }">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">卖家已发货</p>
																		<p class="order-info">
																			<a href="order/showOrderDetail?id=${order.id }">订单详情</a>
																		</p>
																	</div></li>
																<li class="td td-change">
																	<a href="order/updateStatus?status=4&id=${order.id }">
																	<div class="am-btn am-btn-danger anniu">确认收货</div></a></li>
															</c:if>
															<c:if test="${order.status=='4' }">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">交易成功</p>
																		<p class="order-info">
																			<a href="order/showOrderDetail?id=${order.id }">订单详情</a>
																		</p>
																	</div></li>
																<li class="td td-change"><a href="order/commentGoodsInOrder?id=${order.id }">
																		<div class="am-btn am-btn-danger anniu">评价商品</div> </a></li>
															</c:if>
															<c:if test="${order.status=='0' }">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">交易成功</p>
																		<p class="order-info">
																			<a href="order/showOrderDetail?id=${order.id }">订单详情</a>
																		</p>
																	</div></li>
																<li class="td td-change">
																	<div class="am-btn am-btn-danger anniu">删除订单</div></li>
															</c:if>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										<div>
										<a href="order/findOrderByUserId?pageNum=1&status=${statusTag==null ? 0:statusTag  }">首页</a>&nbsp;
										<c:choose>
											<c:when test="${page.pageNum>1}">
											<a href="order/findOrderByUserId?status=${statusTag==null ? 0:statusTag  }&pageNum=${page.pageNum-1}">上一页</a>&nbsp;
											</c:when>
											<c:otherwise>
											上一页
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${page.pageNum<page.totalPages}">
											<a href="order/findOrderByUserId?status=${statusTag==null ? 0:statusTag  }&pageNum=${page.pageNum+1}">下一页</a>&nbsp;
											</c:when>
											<c:otherwise>
											下一页
											</c:otherwise>
										</c:choose>
										<a href="order/findOrderByUserId?status=${statusTag==null ? 0:statusTag  }&pageNum=${page.totalPages}">末页</a>&nbsp;
										共${page.totalPages }页
										</div>
									</div>
								</div>
							</div>
							
							
						</div>
					</div>
				</div>
			</div>
			<script type="text/javascript">
			$(function(){
				//订单列表
				var orderdivs = $(".order-status5");
				//循环订单列表
				for(var i=0;i<orderdivs.length;i++){
					var sum = 0;
					//一个订单下面的商品列表
					var items = $(orderdivs[i]).find(".item-list");
					//循环订单下的商品列表
					for(var j=0;j<items.length;j++){
						var price = parseFloat($(items[j]).find(".item-price").text());
						var num = parseInt($(items[j]).find(".item-num").text());
						sum = sum + price*num;
					}
					$(orderdivs[i]).find(".totalPrice").text(sum.toFixed(2));
				}
				
				$(".am-avg-sm-5 li").click(function(){
					var status=null;
					for(var i=0;i<$(".am-avg-sm-5 li").length;i++){
						if($(this).html()==$(".am-avg-sm-5 li").eq(i).html()){
							status=i;
						}
					}
					
					window.location.href="order/findOrderByUserId?status="+status;
				});
				
				var statusTag = parseInt($("#statusTag").text());
				$(".am-avg-sm-5 li").eq(statusTag).addClass("am-active")
				.siblings().removeClass("am-active");
			});
			
			</script>
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
