<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>/frontend">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet" href="../AmazeUI-2.4.2/assets/css/amazeui.css" />
<link href="../css/dlstyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mycss.css" />
</head>
<body>
	<div class="login-boxtitle">
		<a href="../frontend/index.jsp"><img alt="logo" src="../images/logobig.png" />
		</a>
	</div>

	<div class="login-banner">
		<div class="login-main">
			<div class="login-banner-bg">
				<span></span><img src="../images/big.jpg" />
			</div>
			<div class="login-box">

				<h3 class="title">登录商城</h3>

				<div class="clear"></div>

				<div class="login-form">
					<form action="user/login" method="post">
						<div class="user-name">
							<label for="user"><i class="am-icon-user"></i>
							</label> <input type="text" name="username" id="user" placeholder="用户名">
						</div>
						<div class="user-pass">
							<label for="password"><i class="am-icon-lock"></i>
							</label> <input type="password" name="loginpwd" id="password" placeholder="请输入密码">
						</div>
						<input type="text" name="url" style="display:none;" id="url" value="">
						<input type="submit" name="" value="登 录"
						class="am-btn am-btn-primary am-btn-sm">
					</form>
				</div>

				<div class="login-links">
					<a href="../frontend/register.jsp" class="zcnext am-fr am-btn-default">注册</a> <br />
				</div>
				
				<span style="color:red;">${msg }</span>
<script type="text/javascript">

function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}
window.onload=function(){
document.getElementById("url").value=GetQueryString("url");

};
</script>

			</div>
		</div>
	</div>

	<c:import url="goodsfooter.jsp"></c:import>
</body>
</html>
