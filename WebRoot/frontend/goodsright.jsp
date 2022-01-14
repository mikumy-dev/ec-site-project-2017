<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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



</head>

<body>
	<div class=tip>
		<div id="sidebar">
			<div id="wrap">
				<div id="prof" class="item">
					<a href="#"> <span class="setting"></span> </a>
					<c:if test="${user==null }">
						<div class="ibar_login_box status_login">
							<div class="avatar_box">
								<p class="avatar_imgbox">
									<img src="images/no-img_mid_.jpg" />
								</p>
								<ul class="user_info">
									<li><a
										href="${pageContext.request.contextPath }/frontend/login.jsp">登录</a>
									</li>
									<li><a
										href="${pageContext.request.contextPath }/frontend/register.jsp">注册</a>
									</li>
								</ul>
							</div>
							<div class="login_btnbox">
								<a href="javascript:login()" class="login_order">我的订单</a> <a
									href="javascript:login()" class="login_favorite">我的收藏</a>
							</div>
							<i class="icon_arrow_white"></i>
						</div>
				</div>
				<div id="shopCart" class="item">
					<a href="javascript:login()"> <span class="message"></span> </a>
					<p>购物车</p>
					<p class="cart_num">0</p>
				</div>
				<div id="brand" class="item">
					<a href="javascript:login()"> <span class="wdsc"><img
							src="images/wdsc.png" />
					</span> </a>
					<div class="mp_tooltip">
						我的收藏 <i class="icon_arrow_right_black"></i>
					</div>
				</div>
				</c:if>

				<c:if test="${user!=null }">
					<div class="ibar_login_box status_login">
						<div class="avatar_box">

							<p class="avatar_imgbox">
								<img src="${user.avatar }" />
							</p>
							<ul class="user_info">
								<li>欢迎您！${user.username }</li>
							</ul>

						</div>
						<div class="login_btnbox">
							<a href="order/findOrderByUserId" class="login_order">我的订单</a> <a
								href="collection/selectByUserid?userid=${user.uid}"
								class="login_favorite">我的收藏</a>
						</div>
						<i class="icon_arrow_white"></i>
					</div>
			</div>
			<div id="shopCart" class="item">
				<a href="shopcart/findall"> <span class="message"></span> </a>
				<p>购物车</p>
				<p class="cart_num">${fn:length(shopcartList)}</p>
			</div>
			<div id="brand" class="item">
				<a href="collection/selectByUserid?userid=${user.uid}"> <span
					class="wdsc"><img src="images/wdsc.png" />
				</span> </a>
				<div class="mp_tooltip">
					我的收藏 <i class="icon_arrow_right_black"></i>
				</div>
			</div>
			</c:if>
			<!--回到顶部 -->
			<div id="quick_links_pop" class="quick_links_pop hide"></div>
		</div>
	</div>
	<div id="prof-content" class="nav-content">
		<div class="nav-con-close">
			<i class="am-icon-angle-right am-icon-fw"></i>
		</div>
		<div>我</div>
	</div>
	<div id="shopCart-content" class="nav-content">
		<div class="nav-con-close">
			<i class="am-icon-angle-right am-icon-fw"></i>
		</div>
		<div>购物车</div>
	</div>


	<div id="brand-content" class="nav-content">
		<div class="nav-con-close">
			<i class="am-icon-angle-right am-icon-fw"></i>
		</div>
		<div>收藏</div>
	</div>

	</div>

</body>
</html>
