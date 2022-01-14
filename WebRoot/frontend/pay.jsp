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
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>结算页面</title>
<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/basic/css/demo.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/cartstyle.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/jsstyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mycss.css" />
<script type="text/javascript" src="js/address.js"></script>
</head>
<body>
	<!-- header -->
	<c:import url="goodsheader.jsp"></c:import>
	<!-- header -->

	<div class="concent">
		<!--地址 -->
		<div class="paycont">
			<div class="address">
				<h3>确认收货地址</h3>
				<div class="control">
				</div>
				<div class="clear"></div>
				<ul>
					<!--  遍历收货地址开始 -->
					<c:forEach items="${addrList }" var="addr">
					<div class="per-border"></div>
					<li class="user-addresslist <c:if test='${addr.defaultShAddr==1 }'>defaultAddr</c:if>"> 
						<div class="address-left">
							<div class="user ">
							<span class="addrid" style="display:none;">${addr.id }</span>
								<span class="buy-address-detail"> 
								<span class="buy-user">${addr.consignee } </span> 
								<span class="buy-phone">${addr.phone }</span> </span>
							</div>
							<div class="default-address DefaultAddr">
								收货地址：<span class="buy-line-title buy-line-title-type addraddr">${addr.addr }</span> 
							</div>
						</div>
						<%--<div class="address-right">
							<a href="${pageContext.request.contextPath }/person/address.html"> 
								<span class="am-icon-angle-right am-icon-lg"></span>
							</a>
						</div>
						--%>
						<%--<div class="clear"></div>--%>

						<div class="new-addr-btn">
							<a href="javascript:;" class="hidden">设为默认</a> 
							<span class="new-addr-bar hidden">|</span> 
							<a href="##">编辑</a><!-- address/editAddr?id=${addr.id} --> 
							<span class="new-addr-bar">|</span> 
							<a href="javascript:;" onclick="delClick('${addr.id}');">删除</a>
						</div>	
					</li>
					</c:forEach>
					<!--  遍历收货地址结束 -->
				</ul>

				<div class="clear"></div>
			</div>
			
			<div class="clear"></div>
			
			

			<!--订单 -->
			<div class="concent">
				<div id="payTable">
					<h3>确认订单信息</h3>
					<div class="cart-table-th">
						<div class="wp">
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
							<div class="th th-oplist">
								<div class="td-inner">配送方式</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>
					<!-- 遍历商品开始 -->
					<tr class="item-list">
						<div class="bundle  bundle-last">
							<div class="bundle-main">
							<c:forEach items="${orderProductListOnPage }" var="list">
								<ul class="item-content clearfix">
									<div class="pay-phone">
										<li class="td td-item">
											<div class="item-pic">
												<a href="prod/findProductById?id=${list.pid }" class="J_MakePoint"> 
													<img src="${list.ppic }" class="itempic J_ItemImg" style="width:80px;height:80px;">
												</a>
											</div>
											<div class="item-info">
												<div class="item-basic-info">
													<a href="prod/findProductById?id=${list.pid }" class="item-title J_MakePoint" data-point="tbcart.8.11">${list.pname }</a>
												</div>
											</div>
										</li>
										<li class="td td-info">
											<div class="item-props">
												<span class="sku-line">口味：${list.taste }</span>  
											</div>
										</li>
										<input type="hidden" name="pid" class="pid" value="${list.pid }"/>
										<li class="td td-price">
											<div class="item-price price-promo-promo">
												<div class="price-content">
													<span class="J_Price price-now" id="proprice">${list.price }</span>
												</div>
											</div>
										</li>
									</div>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<span class="phone-title">购买数量</span>
												<div class="sl">
													<input id="quantity" readonly="readonly" class="text_box" name="quantity" type="text" value="${list.quantity }" style="width:30px;" /> 
												</div>
											</div>
										</div>
									</li>
									<li class="td td-sum">
										<div class="td-inner">
											<span tabindex="0"  id="tm" name="totalMoney" class="J_ItemSum number">${list.totalPrice }</span>
										</div>
									</li>
									<li class="td td-oplist">
										<div class="td-inner">
											<span class="phone-title">配送方式</span>
											<div class="pay-logis">
												包邮
											</div>
										</div>
									</li>
								</ul>
								</c:forEach>
								<div class="clear"></div>
							</div>
						</tr>
					<div class="clear"></div>
					<!-- 遍历商品结束 -->
				</div>
			</div>
			
			<div class="clear"></div>
			<div class="pay-total">
				<!--留言-->
				<div class="order-extra">
					<div class="order-user-info">
						<div id="holyshit257" class="memo">
							<label>买家留言：</label> 
							<input type="text" id="ly"
								title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）"
								placeholder="选填,建议填写和卖家达成一致的说明"
								class="memo-input J_MakePoint c2c-text-default memo-close">
							<div class="msg hidden J-msg">
								<p class="error">最多输入500个字符</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--含运费小计 -->
			

			<!--信息 -->
			<div class="order-go clearfix">
				<div class="pay-confirm clearfix">
					<div class="box">
						<div tabindex="0" id="holyshit267" class="realPay">
							<em class="t">实付款：</em> 
							<span class="price g_price "> <span>¥</span>
								<em class="style-large-bold-red sfk" id="J_ActualFee">0.00</em> 
							</span>
						</div>

						<div id="holyshit268" class="pay-address">
							<p class="buy-footer-address">
								<span class="buy-line-title buy-line-title-type">寄送至：</span> 
								<span class="buy-address-detail-addr"></span>
							</p>
							<p class="buy-footer-address">
								<span class="buy-line-title">收货人：</span> 
								<span class="buy-address-detail"> 
								<span class="buy-user shr"></span> 
								<span class="buy-phone shrphone"></span> </span>
							</p>
						</div>
					</div>

					<div id="holyshit269" class="submitOrder">
						<div class="go-btn-wrap">
						<!-- ${pageContext.request.contextPath }/frontend/success.jsp -->
							<a id="J_Go" class="btn-go" tabindex="0"
								title="点击此按钮，提交订单">确认付款</a>
								<p>${msg }</p>
						</div>
					</div>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	</div>
		<!--尾部-->
		<c:import url="goodsfooter.jsp"></c:import>
		<!--尾部结束-->
	</div>
	
	<div class="clear"></div>
	<script type="text/javascript">
			$(function(){
				$(".buy-address-detail-addr").html($("li.defaultAddr").find(".addraddr").html());
				$(".shr").html($("li.defaultAddr").find(".buy-user").html());
				$(".shrphone").html($("li.defaultAddr").find(".buy-phone").html());
				//选择地址
				$("li.user-addresslist").click(function(){
					$(".buy-address-detail-addr").html($("li.defaultAddr").find(".addraddr").html());
					$(".shr").html($("li.defaultAddr").find(".buy-user").html());
					$(".shrphone").html($("li.defaultAddr").find(".buy-phone").html());
				});
				//计算总金额
				var tot = $(".J_ItemSum");
				var sum = 0;
				for(var i=0;i<tot.length;i++){
					sum+=parseFloat($(tot[i]).html());
				}
				$("#J_ActualFee").html(sum.toFixed(2));
				//付款并跳转
				$("#J_Go").click(function(){
					if($(".shr").html()!=""){
					$.ajax({
						type: "POST",  
					    url: "order/pay",  
					    data: "addrid="+$("li.defaultAddr").find(".addrid").html()+"&sum="+$("#J_ActualFee").html(),
					    success: function(msg){  
					       window.location.href="frontend/success.jsp";
					    } 
					});
					}else{
						alert("请选择收货地址！");
						return false;
					}
				});
			});
	</script>
	
	<script type="text/javascript">
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
		
</body>
</html>
