<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script type="text/javascript">
function login(){
	var loginpath="${pageContext.request.contextPath }/frontend/login.jsp?url="+document.URL;	
	window.location.href=loginpath;
}
</script>
<body>
<!--顶部导航条 -->
	<div class="am-container header">
		<ul class="message-l">
			<div class="topMessage">
			<c:if test="${user==null }">
				<div class="menu-hd">
					<a href="javascript:login()" target="_top" class="h">亲，请登录</a> 
					<a href="${pageContext.request.contextPath }/frontend/register.jsp" target="_top">免费注册</a>
				</div>
			</c:if>	
			<c:if test="${user!=null }">
			<span>欢迎您！${user.username }</span>
			
			</c:if>
			</div>
		</ul>
		<ul class="message-r">
			<div class="topMessage home">
				<div class="menu-hd">
					<a href="prod/init" target="_top" class="h">商城首页</a>
				</div>
			</div>
			<c:if test="${user!=null }">
			<div class="topMessage my-shangcheng">
				<div class="menu-hd MyShangcheng">
					<a href="${pageContext.request.contextPath }/frontend/information.jsp" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
				</div>
			</div>
			<div class="topMessage mini-cart">
				<div class="menu-hd">
					<a id="mc-menu-hd" href="shopcart/findall" target="_top">
					<i class="am-icon-shopping-cart  am-icon-fw"></i>
						<span>购物车</span>
						<strong id="J_MiniCartNum" class="h">${fn:length(shopcartList)}</strong>
					</a>
				</div>
			</div>
			<div class="topMessage favorite">
				<div class="menu-hd">
				
					<a href="collection/selectByUserid?userid=${user.uid}" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span>
					</a>
				</div>
			</div>
			<div class="topMessage favorite">
				<div class="menu-hd">					
				<a href="user/logout" target="_top">安全退出</a>
				</div>
			</div>
			</c:if>
			<c:if test="${user==null }">
			<div class="topMessage my-shangcheng">
				<div class="menu-hd MyShangcheng">
					<a href="javascript:login()" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a>
				</div>
			</div>
			<div class="topMessage mini-cart">
				<div class="menu-hd">
					<a id="mc-menu-hd" href="javascript:login()" target="_top">
					<i class="am-icon-shopping-cart  am-icon-fw"></i>
						<span>购物车</span>
						<strong id="J_MiniCartNum" class="h">0</strong>
					</a>
				</div>
			</div>
			<div class="topMessage favorite">
				<div class="menu-hd">	
					<a href="javascript:login()" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span>
					</a>				
				</div>
			</div>
			</c:if>
		</ul>
	</div>
	<!--悬浮搜索框-->
	<div class="nav white">
		<div class="logo"><img src="${pageContext.request.contextPath }/images/logo.png" /></div>
		<div class="logoBig">
			<li><img src="${pageContext.request.contextPath }/images/logobig.png" /></li>
		</div>
		<div class="search-bar pr">
			<a name="index_none_header_sysc" href="#"></a>
			<form action="prod/findProductBySearchCondition" method="post">
				<input id="searchInput" name="keyword" type="text" placeholder="搜索" autocomplete="off">
				<input id="ai-topsearch" class="submit am-btn"  value="搜索" index="1" type="submit">
			</form>
		</div>
	</div>
	<div class="clear"></div>
</body>
</html>
