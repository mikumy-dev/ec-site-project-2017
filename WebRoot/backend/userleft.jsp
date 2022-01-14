<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
  </head>
  <body>
   <aside class="menu">
            <ul>
                <li class="person active">
                    <a href=""><i class="am-icon-user"></i>后台管理</a>
                </li>
                 <li class="person">
                    <a href="adminuser/selectAllUsers?pageNo=1">用户管理</a>
                </li>
                <li class="person">
                    <a href="product/findProduct?pageNo=1">商品管理</a>
                </li>
                <li class="person">
					<a href="taste/init?pageNo=1">口味管理</a>
				</li>
                <li class="person">
                    <a href="type/init?pageNo=1">分类管理</a>
                </li>
                <li class="person">
                    <a href="orderProduct/init?pageNo=1">订单查看</a>
                </li>
                 <li class="person">
                    <a href="comment/findComment?pageNo=1">评论查看</a>
                </li>
               	 <li class="person">
                    <a href="adminuser/logout">退出系统</a>
                </li>
            </ul>
        </aside>
  </body>
</html>
