<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
</head>

<body>

	<div class="long-title">
		<span class="all-goods">全部分类</span>
	</div>
	<div class="nav-cont">
		<ul>
			<li class="index"><a href="prod/init">首页</a></li>
		</ul>
	</div>

</body>
</html>
