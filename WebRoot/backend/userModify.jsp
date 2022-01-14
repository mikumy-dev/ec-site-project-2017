<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>/backend">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>账户明细</title>
<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">
<link href="../css/personal.css" rel="stylesheet" type="text/css">
<link href="../css/wallet.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../css/mycss.css" />
<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"
	type="text/javascript"></script>
<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"
	type="text/javascript"></script>
</head>

<body>

	<div class="center">
		<div class="col-main">
			<div class="main-wrap">
				<div class="am-cf am-padding">
					<div class="am-fl am-cf">
						<strong class="am-text-danger am-text-lg">用户修改</strong>
					</div>
				</div>
				<hr>

				<br>
				<br>
				<form action="adminuser/saveUser" method="post">
					<table>
						<tbody>
							<tr>
								<th>用户id：</th>
								<td><input type="text" name="uid" value="${user.uid }" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th>用户名：</th>
								<td><input type="text" name="username" value="${user.username }" readonly="readonly">
								</td>
							</tr>

							<tr>
								<th>用户状态：</th>
								<td><input type="radio" value="1" name="status" ${user.status==1?'checked="checked"':''} >正常
									<input type="radio" value="0" name="status" ${user.status==0?'checked="checked"':'' }>冻结</td>
							</tr>
							<tr>
								<th></th>
								<td><input type="submit"> <a href="javascript:history.go(-1);">返回</a></td>
							</tr>
						</tbody>
					</table>
				</form>

			</div>
			<!--底部-->

		</div>

		<c:import url="userleft.jsp"></c:import>
	</div>

</body>
</html>
