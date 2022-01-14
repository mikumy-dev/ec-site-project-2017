<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
		<title>个人资料</title>
		<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath }/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath }/css/infstyle.css" rel="stylesheet" type="text/css">
		<script src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/amazeui.js"></script>			
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mycss.css" />
  </head>
  
  <body>
 
    <!-- header -->
    <c:import url="userheader.jsp"></c:import>    
    <!-- header -->
    
    <div class="center">
			<div class="col-main">
				<div class="main-wrap">
					<div class="user-info">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
						</div>
						<hr/>
						<!--头像 -->
						<div class="user-infoPic">

							<form action="user/changeAvatar" enctype="multipart/form-data" method="post">
							<div class="filePic">
								<input type="file" name="avatarfile" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*">
								<img class="am-circle am-img-thumbnail" src="${pageContext.request.contextPath }/${user.avatar }" alt="点击头像，选择文件，修改头像" />
							</div>

							<p class="am-form-help">头像</p>

							<div class="info-m">
								<div><b>用户名：<i>${sessionScope.user.username }</i></b></div>
								<div class="vip">
                                      <span></span><a href="#">会员专享</a>
								</div>
								<input type="submit" value="修改头像">
							</div>
							</form>
						</div>

						<!--个人信息 -->
						<div class="info-main">
							<form class="am-form am-form-horizontal" action="user/updateUser" method="post">
								<input type="hidden" name="uid" value="${sessionScope.user.uid }"/>
								<div class="am-form-group">
									<label for="user-name2" class="am-form-label">昵称</label>
									<div class="am-form-content">
										<input type="text" id="user-name2" name="nickname" placeholder="nickname" value="${sessionScope.user.nickname }">
                                          <small>昵称长度不能超过40个汉字</small>
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-name" class="am-form-label">姓名</label>
									<div class="am-form-content">
										<input type="text" id="user-name2" name="realname" placeholder="name" value="${sessionScope.user.realname }" >
                                         
									</div>
								</div>

								<div class="am-form-group">
									<label class="am-form-label">性别</label>
									<div class="am-form-content sex">
										<label class="am-radio-inline">
											<input  name="sex" value="${sessionScope.user.sex }" />
										</label>
									</div>
								</div>

								<div class="am-form-group">
									<label for="user-birth" class="am-form-label">生日</label>
									<div class="am-form-content birth">
										<input type="text" id="birthday" name="birthday" value="${sessionScope.user.birthday }"  placeholder="yyyy-MM-dd">
									</div>
							
								</div>
								<div class="am-form-group">
									<label for="user-phone" class="am-form-label">电话</label>
									<div class="am-form-content">
										<input id="user-phone" name="phone" value="${sessionScope.user.phone }" placeholder="telephonenumber" type="tel">

									</div>
								</div>
								<div class="am-form-group">
									<label for="user-email" class="am-form-label">电子邮件</label>
									<div class="am-form-content">
										<input id="user-email" name="email" value="${sessionScope.user.email }"  placeholder="Email" type="email">

									</div>
								</div>
								<div class="info-btn">
									<input type="submit" value="保存修改" class="am-btn am-btn-danger" />
								</div>
							</form>
						</div>
					</div>
				</div>
				<!--底部-->
				<c:import url="userfooter.jsp"></c:import>
				<!--底部-->
			</div>
			<!-- aside -->
			<c:import url="userleft.jsp"></c:import>
			<!-- aside -->
		</div>
  </body>
</html>
