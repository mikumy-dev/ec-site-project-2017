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

	<title>口味修改</title>
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
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">商品分类修改</strong> </div>
                </div>
                <hr>
              
                <br><br>
                <form action="type/saveType" method="post" enctype="multipart/form-data">
                   <table>
                       <tbody>
                       		<tr>
                               <th>编号：</th>
                               <td><input type="text" readonly="readonly" name="id" value="${type.id }"></td>
                           </tr>
                           <tr>
                               <th>分类名称：</th>
                               <td><input type="text"  required="required" name="typeName" value="${type.typeName }"></td>
                           </tr>
                            <tr>
                               <th>分类头像：</th>
                               <td><input type="file"  name="iconpaths"></td>
                           </tr>
                           <tr>
                               <th></th>
                               <td>
                               <input type="submit">
                               <a href="">返回</a>
                               </td>
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
