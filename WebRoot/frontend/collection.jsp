<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
	<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>我的收藏</title>

		<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="${pageContext.request.contextPath }/css/personal.css" rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath }/css/colstyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mycss.css" />
  </head>
  
  <body>
    <!-- header -->
    <c:import url="userheader.jsp"></c:import>    
    <!-- header -->
    
    <div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-collection">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">我的收藏</strong> / <small>My&nbsp;Collection</small></div>
						</div>
						<hr/>

						<div class="you-like">
							<div class="s-bar">
								我的收藏
								
							</div>
							<div class="s-content">
							<c:forEach items="${collectionList }" var="cl">
								<div class="s-item-wrap">
									<div class="s-item">

										<div class="s-pic">
											<a href="findProductById?id=${cl.productid }" class="s-pic-link">
												<img src="${cl.productpic }" alt="${cl.productname }" title="${cl.productname }" class="s-pic-img s-guess-item-img">
											</a>
										</div>
										<div class="s-info">
											<div class="s-title"><a href="#" title="${cl.productname }">${cl.productname }</a></div>
											<div class="s-price-box">
												<span class="s-price"><em class="s-price-sign">¥</em><em class="s-value">${cl.price }</em></span>
											</div>											
										</div>
										<div class="s-tp">											
											<p>
												<a href="collection/delete?id=${cl.id }" class="c-nodo J_delFav_btn">取消收藏</a>
											</p>
										</div>
									</div>
								</div>

								</c:forEach>
							</div>
										<div>
										<a href="collection/selectByUserId?pageNum=1&userid=${user.uid}">首页</a>&nbsp;
										<c:choose>
											<c:when test="${page.pageNum>1}">
											<a href="collection/selectByUserId?pageNum=${page.pageNum-1}&userid=${user.uid}">上一页</a>&nbsp;
											</c:when>
											<c:otherwise>
											上一页
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${page.pageNum<page.totalPages}">
											<a href="collection/selectByUserId?pageNum=${page.pageNum+1}&userid=${user.uid}">下一页</a>&nbsp;
											</c:when>
											<c:otherwise>
											下一页
											</c:otherwise>
										</c:choose>
										<a href="collection/selectByUserId?pageNum=${page.totalPages}&userid=${user.uid}">末页</a>&nbsp;
										共${page.totalPages }页
										</div>

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
