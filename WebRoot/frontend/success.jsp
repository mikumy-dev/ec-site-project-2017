<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>付款成功页面</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css" />
<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/basic/css/demo.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mycss.css" />
<link href="${pageContext.request.contextPath }/css/sustyle.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/basic/js/jquery-1.7.min.js"></script>
</head>
<body>
	<!-- header -->
	<c:import url="goodsheader.jsp"></c:import>

	<!-- header -->
	<div class="take-delivery">
		<div class="status">
			<h2>您已成功付款</h2>
			<div class="successInfo">
				<ul>
					<li>付款金额<em>${sum }</em>
					</li>
					<div class="user-info">
						<p>收货人：${addr1.consignee } </p>
						<p>联系电话：${addr1.phone } </p>
						<p>收货地址：${addr1.addr } </p>
					</div>
					请认真核对您的收货信息，如有错误请联系客服

				</ul>
				<div class="option">
					<span class="info">您可以查看</span>
					<a href="order/findOrderByUserId"
						class="J_MakePoint"><span>已买到的宝贝</span>
					</a> 
					查看<a href="order/showOrderDetail?id=${orderid }" 
					class="J_MakePoint"><span>交易详情</span>
					</a>
				</div>
			</div>
		</div>
	</div>
	<!--尾部-->
	<c:import url="goodsfooter.jsp"></c:import>
	<!--尾部结束-->
</body>

</html>
