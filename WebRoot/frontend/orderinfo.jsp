<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML  >
<html>
  <head>
    <base href="<%=basePath%>">
	<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
	<title>订单详情</title>
	<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath }/css/personal.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath }/css/orstyle.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mycss.css" />
	<script src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
  </head>
  
  <body>
    <!-- header -->
    <c:import url="userheader.jsp"></c:import>    
    <!-- header -->
    <div class="center">
			<div class="col-main">
				<div class="main-wrap">
					<div class="user-orderinfo">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单详情</strong> / <small>Order&nbsp;details</small></div>
						</div>
						<hr/>
						<!--进度条-->
						
						<div class="order-infoaside">
							<div class="order-logistics">
								<a href="logistics.html">
									<div class="icon-log">
										<i><img src="images/receive.png"></i>
									</div>
									
									<span class="am-icon-angle-right icon"></span>
								</a>
								<div class="clear"></div>
							</div>
							<div class="order-addresslist">
								<div class="order-address">
									<div class="icon-add">
									</div>
									<p class="new-tit new-p-re">
										<span class="new-txt">${addr1.consignee }</span>
										<span class="new-txt-rd2">${addr1.phone }</span>
									</p>
									<div class="new-mu_l2a new-p-re">
										<p class="new-mu_l2cw">
											<span class="title">收货地址：</span>
											<span class="province">${addr1.addr }</span></p>
									</div>
								</div>
							</div>
						</div>
						<div class="order-infomain">
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
									<td class="td-inner">商品操作</td>
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
								<div class="order-status3">
									<div class="order-title">
										<div class="dd-num">订单编号：<a href="javascript:;">${orderPojo.orderNum }</a></div>
										<span>成交时间：${orderPojo.turnoverTime }</span>
									</div>
									<div class="order-content">
										<div class="order-left">
										<!-- 遍历商品开始  -->
										<c:forEach items="${orderPojo.list }" var="info">
											<ul class="item-list">
												<li class="td td-item">
													<div class="item-pic">
														<a href="#" class="J_MakePoint">
															<img src="${info.pic }" class="itempic J_ItemImg">
														</a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="#">
																<p>${info.productName }</p>
															</a>
														</div>
													</div>
												</li>
												<li class="td td-price">
													<div class="item-price">
														${info.price }
													</div>
												</li>
												<li class="td td-number">
													<div class="item-number">
														<span>×</span><span class="item-num">${info.num }</span>
													</div>
												</li>
												<li class="td td-operation">
													<div class="item-operation">
														退款/退货
													</div>
												</li>
											</ul>
										</c:forEach>
										<!-- 遍历商品结束  -->
										</div>
										<div class="order-right">
											<li class="td td-amount">
												<div class="item-amount">
													总价:
													<span class="totalPrice"></span>
												</div>
											</li>
											<div class="move-right">
												<c:if test="${orderPojo.status=='0' }">
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
															<c:if test="${orderPojo.status=='1' }">
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
															<c:if test="${orderPojo.status=='2' }">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">卖家已发货</p>
																		<p class="order-info">
																			<a href="order/showOrderDetail?id=${order.id }">订单详情</a>
																		</p>
																		<p class="order-info">
																			<a href="#">延长收货</a>
																		</p>
																	</div></li>
																<li class="td td-change">
																	<a href="order/updateStatus?status=3&id=${order.id }">
																	<div class="am-btn am-btn-danger anniu">确认收货</div></a></li>
															</c:if>
															<c:if test="${orderPojo.status=='3' }">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">交易成功</p>
																		<p class="order-info">
																			<a href="order/showOrderDetail?id=${order.id }">订单详情</a>
																		</p>
																		<p class="order-info">
																			<a href="logistics.html">查看物流</a>
																		</p>
																	</div></li>
																<li class="td td-change">
																	<a href="order/commentGoodsInOrder?id=${order.id }">
																		<div class="am-btn am-btn-danger anniu">评价商品</div> </a>
																</li>
															</c:if>
															<c:if test="${orderPojo.status=='4' }">
																<li class="td td-status">
																	<div class="item-status">
																		<p class="Mystatus">交易成功</p>
																		<p class="order-info">
																			<a href="order/showOrderDetail?id=${order.id }">订单详情</a>
																		</p>
																		<p class="order-info">
																			<a href="logistics.html">查看物流</a>
																		</p>
																	</div></li>
																<li class="td td-change">
																	<div class="am-btn am-btn-danger anniu">删除订单</div></li>
															</c:if>
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
				
					var sum = 0;
					//一个订单下面的商品列表
					var items = $(".item-list");
					//循环订单下的商品列表
					for(var j=0;j<items.length;j++){
						var price = parseFloat($(items[j]).find(".item-price").text());
						var num = parseInt($(items[j]).find(".item-num").text());
						sum = sum + price*num;
					}
					$(".totalPrice").text(sum);
				
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
