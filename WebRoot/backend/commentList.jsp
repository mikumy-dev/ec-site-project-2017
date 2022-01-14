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

	<title>评论明细</title>
    <link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/personal.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/css/wallet.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mycss.css" />
    <script src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
 </head>
  
  <body>
   
    <div class="center">
         <div class="col-main">
            <div class="main-wrap">
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">评论管理</strong> </div>
                </div>
                <hr>
                <table>
                	<thead>
                		<th>序号</th>
                		<th>评论内容</th>
                		<th>评论商品</th>
                		<th>评论用户</th>
                		<th>评论时间</th>
                		<th>操作</th>
                	</thead>
                	<tbody>
                		<c:forEach items="${pageUtil.data}" var="comment" varStatus="i">
                			<tr>
	                			<td>${i.index + 1 }</td>
	                			<td>${comment.content }</td>
	                			<td>${comment.productid }</td>
	                			<td>${comment.userid }</td>
	                			<td>${comment.createdDate }</td>
	                			<td>
	                				<a href="comment/deleteComment?cid=${comment.id }">删除</a>
	                			</td>
                			</tr>
                		</c:forEach>
                	
                	<td colspan="6">总共【${pageUtil.totalPage}】页
						&nbsp;&nbsp;${pageUtil.pageNo}/${pageUtil.totalPage}&nbsp;&nbsp; 
						<a href="comment/findComment?pageNo=1">首页</a> 
						<c:choose>
							<c:when test="${pageUtil.pageNo > 1}">
								<a href="comment/findComment?pageNo=${pageUtil.pageNo-1}">上一页</a>
							</c:when>
							<c:otherwise>
                       	 		上一页
                    		</c:otherwise>
						</c:choose> 
						<c:choose>
							<c:when test="${pageUtil.pageNo < pageUtil.totalPage}">
								<a href="comment/findComment?pageNo=${pageUtil.pageNo+1}">下一页</a>
							</c:when>
							<c:otherwise>
                       			 下一页
                    		</c:otherwise>
						</c:choose> 
						
						<a href="comment/findComment?pageNo=${pageUtil.totalPage}">尾页</a>
					</td>
					</tr>
					</tbody>
                </table>
            </div>
            <!--底部-->
        </div>
          <c:import url="userleft.jsp"></c:import>
    </div>
  </body>
</html>
