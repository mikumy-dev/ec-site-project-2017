<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>搜索页面</title>

<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css" />

<link href="${pageContext.request.contextPath }/basic/css/demo.css" rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath }/css/seastyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mycss.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/basic/js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/script.js"></script>
</head>

<body>
	<!-- header -->
	<c:import url="goodsheader.jsp"></c:import>
	<!-- header -->
	<b class="line"></b>
	<div class="search">
		<div class="search-list">
			<div class="nav-table">
				<c:import url="goodsheader1.jsp"></c:import>
			</div>


			<div class="am-g am-g-fixed">
				<div class="am-u-sm-12 am-u-md-12">
					<div class="theme-popover">
						<div class="searchAbout">
							
						</div>
						<ul class="select">
							<p class="title font-normal">
								 <span class="total fl">搜索到<strong
									class="num">${pageUtil.totalCount}</strong>件相关商品</span>
								
							</p>
							<div class="clear"></div>
						</ul>
						<div class="clear"></div>
					</div>
					<div class="search-content">
					<span id="orderby" style="display:none;">${condition.orderByCondition }</span>
						<ul class="sort">
							<li ><a href="prod/findProductBySearchCondition?orderByCondition=id" title="综合">综合排序</a>
							</li>
							<li><a href="prod/findProductBySearchCondition?orderByCondition=salesVolume" title="销量">销量排序</a>
							</li>
							<li><a href="prod/findProductBySearchCondition?orderByCondition=price" title="价格">价格优先</a>
							</li>
							<li class="big"><a href="prod/findProductBySearchCondition?orderByCondition=goodCommentRatio" title="评价" href="#">评价为主</a>
							</li>
						</ul>
						<script>
						$(function(){
							var orderby = $("#orderby").text();
							if(orderby=="id"){
								$("ul.sort li:eq(0)").addClass("first").sibilings().removeClass("first");
							}
							if(orderby=="salesVolume"){
								$("ul.sort li:eq(1)").addClass("first").sibilings().removeClass("first");
							}
							if(orderby=="price"){
								$("ul.sort li:eq(2)").addClass("first").sibilings().removeClass("first");
							}
							if(orderby=="goodCommentRatio"){
								$("ul.sort li:eq(3)").addClass("first").sibilings().removeClass("first");
							}
						});
						</script>
						<div class="clear"></div>

						<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
						<c:forEach var="product" items="${pageUtil.data}">
							<li><a href="prod/findProductById?id=${product.id }">
								<div class="i-pic limit">
									<img src="${product.productPictureMid }" style="width:218px;height:218px;" />
									<p class="title fl">${product.productName }</p>
									<p class="price fl">
										<b>¥</b> <strong>${product.price }</strong>
									</p>
									<p class="number fl">
										销量<span>${product.salesVolume }</span>
									</p>
								</div></a></li>
						</c:forEach>
							
								
						</ul>
					</div>
					<div class="search-side">

						<div class="side-title">经典搭配</div>

						<li>
							<div class="i-pic check">
								<img src="${pageContext.request.contextPath }/images/cp.jpg" />
								<p class="check-title">萨拉米 1+1小鸡腿</p>
								<p class="price fl">
									<b>¥</b> <strong>29.90</strong>
								</p>
								<p class="number fl">
									销量<span>1110</span>
								</p>
							</div></li>
						<li>
							<div class="i-pic check">
								<img src="${pageContext.request.contextPath }/images/cp2.jpg" />
								<p class="check-title">ZEK 原味海苔</p>
								<p class="price fl">
									<b>¥</b> <strong>8.90</strong>
								</p>
								<p class="number fl">
									销量<span>1110</span>
								</p>
							</div></li>
						<li>
							<div class="i-pic check">
								<img src="${pageContext.request.contextPath }/images/cp.jpg" />
								<p class="check-title">萨拉米 1+1小鸡腿</p>
								<p class="price fl">
									<b>¥</b> <strong>29.90</strong>
								</p>
								<p class="number fl">
									销量<span>1110</span>
								</p>
							</div></li>

					</div>
					<div class="clear"></div>
					<!--分页 -->
					<div class="am-pagination am-pagination-right">
						总共【${pageUtil.totalPage}】页
						&nbsp;&nbsp;${pageUtil.pageNo}/${pageUtil.totalPage}&nbsp;&nbsp; <a
						href="prod/findProductBySearchCondition?pageNo=1">首页</a> 
						<c:choose>
							<c:when test="${pageUtil.pageNo > 1}">
								<a href="prod/findProductBySearchCondition?pageNo=${pageUtil.pageNo-1}">上一页</a>
							</c:when>
							<c:otherwise>
                       	 		上一页
                    		</c:otherwise>
						</c:choose> 
						<c:choose>
							<c:when test="${pageUtil.pageNo < pageUtil.totalPage}">
								<a href="prod/findProductBySearchCondition?pageNo=${pageUtil.pageNo+1}">下一页</a>
							</c:when>
							<c:otherwise>
                       			 下一页
                    		</c:otherwise>
						</c:choose> 
						
						<a href="prod/findProductBySearchCondition?pageNo=${pageUtil.totalPage}">尾页</a>
					</div>

				</div>
			</div>
			<c:import url="goodsfooter.jsp"></c:import>
		</div>

	</div>
	<div class="navCir">
		<li><a href="home2.html"><i class="am-icon-home "></i>首页</a>
		</li>
		<li><a href="sort.html"><i class="am-icon-list"></i>分类</a>
		</li>
		<li><a href="shopcart.html"><i
				class="am-icon-shopping-basket"></i>购物车</a>
		</li>
		<li><a href="${pageContext.request.contextPath }/person/index.html"><i class="am-icon-user"></i>我的</a>
		</li>
	</div>
	<!--菜单 -->
	<c:import url="goodsright.jsp"></c:import>
</body>
</html>
