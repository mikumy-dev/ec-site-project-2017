<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>/backend">
	<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

	<title>口味管理</title>
    <link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="../css/personal.css" rel="stylesheet" type="text/css">
    <link href="../css/wallet.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="../css/mycss.css" />
    <script src="../AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="../AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
 </head>
  
  <body>
   
    <div class="center">
         <div class="col-main">
            <div class="main-wrap">
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">口味管理</strong> </div>
                </div>
                <hr>
                <a href="../backend/tasteAdd.jsp"><button>添加口味</button></a>
                <br><br>
                <table>
                	<thead>
                		<th>编号</th>
                		<th>口味名称</th>
                		<th>操作</th>
                	</thead>
                	<tbody>
                		
                		<c:forEach items="${pageUtil.data}" var="taste">
                			<tr>
                			<td>${taste.id}</td>
                			<td>${taste.name }</td>
                			<td>
                				<a href="taste/modifyTaste?id=${taste.id}">修改</a>
                				<a href="taste/deleteTaste?id=${taste.id }">删除</a>
                			</td>
                			</tr>
                		</c:forEach>
                		
                	</tbody>
                	<td colspan="3">总共【${pageUtil.totalPage}】页
						&nbsp;&nbsp;${pageUtil.pageNo}/${pageUtil.totalPage}&nbsp;&nbsp; <a
						href="taste/init?pageNo=1">首页</a> 
						<c:choose>
							<c:when test="${pageUtil.pageNo > 1}">
								<a href="taste/init?pageNo=${pageUtil.pageNo-1}">上一页</a>
							</c:when>
							<c:otherwise>
                       	 		上一页
                    		</c:otherwise>
						</c:choose> 
						<c:choose>
							<c:when test="${pageUtil.pageNo < pageUtil.totalPage}">
								<a href="taste/init?pageNo=${pageUtil.pageNo+1}">下一页</a>
							</c:when>
							<c:otherwise>
                       			 下一页
                    		</c:otherwise>
						</c:choose> 
						
						<a href="taste/init?pageNo=${pageUtil.totalPage}">尾页</a>
					</td>
					</tr>
                </table>
               
            </div>
            <!--底部-->
            
        </div>
       
          <c:import url="userleft.jsp"></c:import>
    </div>
    
  </body>
</html>
