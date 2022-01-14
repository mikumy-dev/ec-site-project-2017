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

<title>评价管理</title>

<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet"
	type="text/css">
<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet"
	type="text/css">

<link href="../css/personal.css" rel="stylesheet" type="text/css">
<link href="../css/cmstyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mycss.css" />
<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="../AmazeUI-2.4.2/assets/js/amazeui.js"></script>

</head>

<body>
	<!-- header -->
	<c:import url="userheader.jsp"></c:import>
	<!-- header -->

	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-comment">
					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">评价管理</strong> / <small>Manage&nbsp;Comment</small>
						</div>
					</div>
					<hr />

					<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

						<ul class="am-avg-sm-2 am-tabs-nav am-nav am-nav-tabs">
							<li class="am-active"><a href="#tab1">所有评价</a>
							</li>


						</ul>

						<div class="am-tabs-bd">
							<div class="am-tab-panel am-fade am-in am-active" id="tab1">

								<div class="comment-main">
									<div class="comment-list">
										<ul class="item-list">


											<div class="comment-top">
												<div class="th th-price">
													<td class="td-inner">评价</td>
												</div>

												<div class="th th-item">
													<td class="td-inner">商品</td>
												</div>

											</div>
											<c:forEach items="${pageUtil.data }" var="cl">
												<li class="td td-item">
													<div class="item-pic">
														<a href="prod/findProductById?id=${cl.productid }"
															class="J_MakePoint"> <img src="${cl.productpic }"
															class="itempic"> </a>
													</div></li>
												<li class="td td-comment">
													<div class="item-title">

														<div class="item-name">
															<a href="prod/findProductById?id=${cl.productid }">
																<p class="item-basic-info">${cl.productname }</p> </a>
														</div>
													</div>

													<div class="item-comment">${cl.content }</div>


													<div class="item-info">
														<div>
															<p class="info-little">
																<span>口味：${cl.tastename }</span>
															</p>
															<p class="info-time">
																${cl.createdDayStr } &nbsp;&nbsp; <span
																	style="color:red;"> <c:if
																		test="${cl.status=='A'}">好评</c:if> <c:if
																		test="${cl.status=='B'}">中评</c:if> <c:if
																		test="${cl.status=='C'}">差评</c:if> </span>
															</p>

														</div>
													</div></li>

												<br>
												<hr>
												<br>
											</c:forEach>
											<td colspan="4">总共【${pageUtil.totalPage}】页
												&nbsp;&nbsp;${pageUtil.pageNo}/${pageUtil.totalPage}&nbsp;&nbsp;
												<a href="comment/selectByUserId?userid=${user.uid }&pageNo=1">首页</a> <c:choose>
													<c:when test="${pageUtil.pageNo > 1}">
														<a href="comment/selectByUserId?userid=${user.uid }&pageNo=${pageUtil.pageNo-1}">上一页</a>
													</c:when>
													<c:otherwise>
						                       	 		上一页
						                    		</c:otherwise>
												</c:choose> <c:choose>
													<c:when test="${pageUtil.pageNo < pageUtil.totalPage}">
														<a href="comment/selectByUserId?userid=${user.uid }&pageNo=${pageUtil.pageNo+1}">下一页</a>
													</c:when>
													<c:otherwise>
                       									 下一页
                    								</c:otherwise>
												</c:choose> <a href="comment/selectByUserId?userid=${user.uid }&pageNo=${pageUtil.totalPage}">尾页</a></td>

										</ul>

									</div>
								</div>

							</div>

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
