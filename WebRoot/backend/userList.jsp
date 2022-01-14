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

	<title>账户明细</title>
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
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">用户管理</strong> </div>
                </div>
                <hr>
                <a href="../backend/userAdd.jsp"><button>添加用户</button></a>
                <br><br>
                <table>
                	<thead>
                		<th>用户名</th>
                		<th>用户状态</th>
                		<th>注册时间</th>
                		<th>操作</th>
                	</thead>
                	<tbody>
                		
                		<c:forEach items="${pageUtil.data }" var="ul">
                			<tr>
                			<td>${ul.username }</td>
                			<td>${ul.status=='1'?'正常':'冻结'}</td>
                			<td>${ul.createdDate }</td>
                			<td>
                				<a href="adminuser/findByid?id=${ul.uid }">修改</a>
                				<a href="adminuser/deleteByid?id=${ul.uid }">删除</a>
                			</td>
                			</tr>
                		</c:forEach>
                		
                	</tbody>
                	<td colspan="4">总共【${pageUtil.totalPage}】页
						&nbsp;&nbsp;${pageUtil.pageNo}/${pageUtil.totalPage}&nbsp;&nbsp; <a
						href="adminuser/selectAllUsers?pageNo=1">首页</a> 
						<c:choose>
							<c:when test="${pageUtil.pageNo > 1}">
								<a href="adminuser/selectAllUsers?pageNo=${pageUtil.pageNo-1}">上一页</a>
							</c:when>
							<c:otherwise>
                       	 		上一页
                    		</c:otherwise>
						</c:choose> 
						<c:choose>
							<c:when test="${pageUtil.pageNo < pageUtil.totalPage}">
								<a href="adminuser/selectAllUsers?pageNo=${pageUtil.pageNo+1}">下一页</a>
							</c:when>
							<c:otherwise>
                       			 下一页
                    		</c:otherwise>
						</c:choose> 
						
						<a href="adminuser/selectAllUsers?pageNo=${pageUtil.totalPage}">尾页</a>
					</td>
                </table>
            </div>
            <!--底部-->
            
        </div>
       
          <c:import url="userleft.jsp"></c:import>
    </div>
    
  </body>
</html>
