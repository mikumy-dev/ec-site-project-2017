<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<head>
<base href="<%=basePath%>">
</head>
<body>
<aside class="menu">
		<ul>
			<li class="person active"><a href="${pageContext.request.contextPath }/frontend/index.jsp">
				<i class="am-icon-user"></i>个人中心</a>
			</li>
			<li class="person">
				<p>
					<i class="am-icon-newspaper-o"></i>个人资料
				</p>
				<ul>
					<li><a href="${pageContext.request.contextPath }/frontend/information.jsp">个人信息</a>
					</li>
					<li><a href="${pageContext.request.contextPath }/frontend/safety.jsp">安全设置</a>
					</li>
					<li><a href="address/getAllAddress">地址管理</a>
					</li>

				</ul>
			</li>
			<li class="person">
				<p>
					<i class="am-icon-balance-scale"></i>我的交易
				</p>
				<ul>
					<li>
						<a href="order/findOrderByUserId">订单管理</a>
					</li>

					<li>
						<a href="comment/selectByUserId?userid=${user.uid }&pageNo=1">我的评价</a>
					</li>
				</ul>
			</li>

			<li class="person">
				<p>
					<i class="am-icon-tags"></i>我的收藏
				</p>
				<ul>
					<li>
						<a href="collection/selectByUserid?userid=${user.uid}">收藏</a>
					</li>
				</ul>
			</li>

		
		</ul>

	</aside>
</body>
</html>
