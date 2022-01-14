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

<title>首页</title>
<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css" />
<link href="${pageContext.request.contextPath }/basic/css/demo.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/css/hmstyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mycss.css" />
<script src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
</head>

<body>
	<div class="hmtop">
		<c:import url="goodsheader.jsp"></c:import>

	</div>
	<b class="line"></b>
	<div class="shopNav">
		<div class="slideall" style="height: auto;">
			<c:import url="goodsheader1.jsp"></c:import>
			<div class="bannerTwo" >
				<!--轮播 -->
				<div class="am-slider am-slider-default scoll" data-am-flexslider
					id="demo-slider-0">
					<ul class="am-slides">
						<li class="banner1"><a href="findProductById?id=1">
						<img src="${pageContext.request.contextPath }/images/ad5.jpg" /> </a>
						</li>
						<li class="banner2"><a><img src="${pageContext.request.contextPath }/images/ad6.jpg" /> </a>
						</li>
						<li class="banner3"><a><img src="${pageContext.request.contextPath }/images/ad7.jpg" /> </a>
						</li>
						<li class="banner4"><a><img src="${pageContext.request.contextPath }/images/ad8.jpg" /> </a>
						</li>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
			<!--侧边导航 -->
			<div id="nav" class="navfull" style="position: static;">
				<div class="area clearfix">
					<div class="category-content" id="guide_2">
						<div class="category" style="box-shadow:none ;margin-top: 2px;">
							<ul class="category-list navTwo" id="js_climit_li">
								<c:forEach var="type" items="${types}">
									<li>
										<div class="category-info">
											<h3 class="category-name b-category-name">
												<i><img src="${type.iconpath }"> </i>
												<a href="prod/findProductBySearchCondition?productType=${type.id }" class="ml-22">${type.typeName }</a>
											</h3>
											<em>&gt;</em>
										</div> <b class="arrow"></b>
									</li>
								</c:forEach>
								<c:forEach var="type" items="${types}">
									<li>
										<div class="category-info">
											<h3 class="category-name b-category-name">
												<i><img src="${type.iconpath }"> </i>
												<a href="prod/findProductBySearchCondition?productType=${type.id }" class="ml-22">${type.typeName }</a>
											</h3>
											<em>&gt;</em>
										</div> <b class="arrow"></b>
									</li>
								</c:forEach>
								<c:forEach var="type" items="${types}">
									<li>
										<div class="category-info">
											<h3 class="category-name b-category-name">
												<i><img src="${type.iconpath }"> </i>
												<a href="prod/findProductBySearchCondition?productType=${type.id }" class="ml-22">${type.typeName }</a>
											</h3>
											<em>&gt;</em>
										</div> <b class="arrow"></b>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
			
			<!--导航 -->
			<script type="text/javascript">
			(function() {
			    $(".am-slider").flexslider();
			});
			$(document).ready(function() {
			    $("li").hover(function() {
			        $(".category-content .category-list li.first .menu-in").css("display", "none");
			        $(".category-content .category-list li.first").removeClass("hover");
			        $(this).addClass("hover");
			        $(this).children("div.menu-in").css("display", "block");
			    },
			    function() {
			        $(this).removeClass("hover");
			        $(this).children("div.menu-in").css("display", "none");
			    });
			});
			</script>
			
			<div class="clear"></div>
		</div>
		<script type="text/javascript">
			if ($(window).width() < 640) {
				function autoScroll(obj) {
					$(obj).find("ul").animate({
						marginTop : "-39px"
					}, 500, function() {
						$(this).css({
							marginTop : "0px"
						}).find("li:first").appendTo(this);
					});
				}
				$(function() {
					setInterval('autoScroll(".demo")', 3000);
				});
			}
		</script>
	</div>
	<div class="shopMainbg">
		<div class="shopMain" id="shopmain">
			<!--热卖商品 -->
			<div class="am-container ">
				<div class="shopTitle ">
					<h4>热卖商品</h4>


				</div>
			</div>
			<div class="am-g am-g-fixed flood method3 ">
				<ul class="am-thumbnails ">
				<c:forEach var="sellingProduct" items="${sellingProducts}">
					<li>
						<div class="list ">
							<a href="prod/findProductById?id=${sellingProduct.id }"> <img src="${pageContext.request.contextPath }/${sellingProduct.productPictureMid } " />
								<div class="pro-title ">${sellingProduct.productName }</div> <span class="e-price ">￥${sellingProduct.price}</span>
							</a>
						</div>
					</li>
				
				</c:forEach>
				</ul>

			</div>
			<div class="clear "></div>
			<div class="f1">
				<!--新点-->
				<div class="am-container ">
					<div class="shopTitle ">
						<h4 class="floor-title">新品</h4>
						<div class="floor-subtitle">
							<em class="am-icon-caret-left"></em>
							<h3>每一道新品都有一个故事</h3>
						</div>
					</div>
				</div>
				<div class="am-g am-g-fixed floodSix ">
				<c:forEach var="newestProduct" items="${newestProducts}">  
					<li>
						<div class="am-u-sm-4 am-u-md-2 am-u-lg-2 text-six">
							<div class="boxLi"></div>
							<div class="outer-con ">
								<div class="title ">${newestProduct.productName }</div>
								<div class="sub-title ">¥${newestProduct.price }</div>
							</div>
							<a href="prod/findProductById?id=${newestProduct.id }"><img src="${pageContext.request.contextPath }/${newestProduct.productPictureMid } " /> </a>
						</div>
					</li>					
				</c:forEach>
					
				</div>
				<div class="clear "></div>
			</div>


			<!--尾部-->
			<c:import url="goodsfooter.jsp"></c:import>
			<!--尾部结束-->

		</div>
	</div>
	</div>
	</div>
	<!--引导 -->
	<div class="navCir">
		<li class="active"><a href="home2.html"><i
				class="am-icon-home "></i>首页</a></li>
		<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
		<li><a href="shopcart.html"><i
				class="am-icon-shopping-basket"></i>购物车</a></li>
		<li><a href="${pageContext.request.contextPath }/person/index.html"><i class="am-icon-user"></i>我的</a>
		</li>
	</div>
	<!--菜单 -->
	<c:import url="goodsright.jsp"></c:import>
	<script>
		window.jQuery
				|| document
						.write('<script src="basic/js/jquery.min.js "><\/script>');
	</script>
	<script type="text/javascript " src="basic/js/quick_links.js "></script>

</body>
</html>
