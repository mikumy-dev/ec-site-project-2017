<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>订单列表</title>
<link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">
<link href="css/personal.css" rel="stylesheet" type="text/css">
<link href="css/wallet.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="css/mycss.css" />
<script src="AmazeUI-2.4.2/assets/js/jquery.min.js"
	type="text/javascript"></script>
<script src="AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>

</head>

<body>

	<div class="center">
		<div class="col-main">
			<div class="main-wrap">
				<div class="am-cf am-padding">
					<div class="am-fl am-cf">
						<strong class="am-text-danger am-text-lg">订单管理</strong>
					</div>
				</div>
				<hr>
				<br>
				<table>
					<thead>
						<th>订单id</th>
						<th>订单编号</th>
						<th>用户名称</th>
						<th>订单创建时间</th>
						<th>商品信息</th>
						<th width="150px">收件地址</th>
						<th>操作</th>
					</thead>
					<tbody>
						<c:forEach var="orderPojo" items="${pageUtil.data}">
							<tr>
							<td>${orderPojo.id }</td>
							<td>${orderPojo.orderNum }</td>
							<td>${orderPojo.realname }</td>
							<td>${orderPojo.turnoverTime }</td>
							<td>
							<table>
								<thead>
									<th>商品名称</th>
									<th>商品价格</th>
									<th>数量</th>
									<th>口味</th>
								</thead>
								<c:forEach items="${orderPojo.list }" var="list">
								<tr>
									<td>${list.productName }</td>
									<td>${list.price }</td>
									<td>${list.num }</td>
									<td>${list.tasteName }</td>
								</tr>
								</c:forEach>
							</table>
							</td>
							<td width="150px">${orderPojo.addr }</td>
							<td>
							<c:if test="${orderPojo.status=='1' }">
								未付款
							</c:if>
							<c:if test="${orderPojo.status=='2' }">
							<a href="orderProduct/updateStatus?id=${orderPojo.id}">确认发货</a>
							</c:if>
							<c:if test="${orderPojo.status!='1' && orderPojo.status!='2'}">
							已发货
							</c:if>
							</td>
							</tr>
						</c:forEach>
				
					<td colspan="7">总共【${pageUtil.totalPage}】页
						&nbsp;&nbsp;${pageUtil.pageNo}/${pageUtil.totalPage}&nbsp;&nbsp; <a
						href="orderProduct/init?pageNo=1">首页</a> 
						<c:choose>
							<c:when test="${pageUtil.pageNo > 1}">
								<a href="orderProduct/init?pageNo=${pageUtil.pageNo-1}">上一页</a>
							</c:when>
							<c:otherwise>
                       	 		上一页
                    		</c:otherwise>
						</c:choose> 
						<c:choose>
							<c:when test="${pageUtil.pageNo < pageUtil.totalPage}">
								<a href="orderProduct/init?pageNo=${pageUtil.pageNo+1}">下一页</a>
							</c:when>
							<c:otherwise>
                       			 下一页
                    		</c:otherwise>
						</c:choose> 
						
						<a href="orderProduct/init?pageNo=${pageUtil.totalPage}">尾页</a>
					</td>
					</tr>
				</tbody>
				</table>
			</div>
			<!--底部-->

		</div>
		<c:import url="userleft.jsp"></c:import>
	</div>

</body>
</html>
