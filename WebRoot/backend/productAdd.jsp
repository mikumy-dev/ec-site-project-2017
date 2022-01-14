<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>添加商品</title>
    <link href="AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="css/personal.css" rel="stylesheet" type="text/css">
    <link href="css/wallet.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="css/mycss.css" />
    <script src="AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
    
	<script type="text/javascript" charset="utf-8" src="ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="ueditor/ueditor.all.min.js"> </script>    
    <script type="text/javascript" charset="utf-8" src="ueditor/lang/zh-cn/zh-cn.js"></script>

<style>
.red{
color:red;
}
</style>
  </head>
  
  <body>
   
    <div class="center">
        <div class="col-main">
            <div class="main-wrap">
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">添加商品</strong> </div>
                </div>
                <hr>
            
                <br><br>
                <p>带<span class="red">(*)</span>的为必填项</p>
               <form action="product/saveProduct" method="post" enctype="multipart/form-data" >
                   <table>
                       <tbody>
                           <tr>
                               <th>商品名称：<span class="red">(*)</span></th>
                               <td><input type="text" maxlength="16" required="required" name="productName"></td>
                           </tr>
                            <tr>
                               <th>库存：</th>
                               <td><input type="text" name="inventory"></td>
                           </tr>
                           <tr>
                               <th>单价：</th>
                               <td><input type="text" name="price"></td>
                           </tr>
                           <tr>
                           		<th>商品图片（大）：<span class="red">(*)</span></th>
                           		<td><input type="file" required="required" name="bigpic"> </td>
                           </tr>
                            <tr>
                           		<th>商品图片（中）：<span class="red">(*)</span></th>
                           		<td><input type="file" required="required" name="midpic"> </td>
                           </tr>
                            <tr>
                           		<th>商品图片（小）：<span class="red">(*)</span></th>
                           		<td><input type="file" required="required" name="smallpic"> </td>
                           </tr>
                           
                            <tr>
                               <th>产品类型：</th>
                               <td>
                               <select name="productType" >
                               	<c:forEach var="type" items="${types}">
                               		<option value="${type.id}">${type.typeName}</option>
                               	</c:forEach>
                               </select>
         
                               </td>
                           </tr>
                           <tr>
                               <th>原料产地：</th>
                               <td><input type="text" name="materialAddr"></td>
                           </tr>
                           <tr>
                               <th>生产产地：</th>
                               <td><input type="text" name="produceAddr"></td>
                           </tr>
                           <tr>
                               <th>配料表：</th>
                               <td><input type="text" name="ingredients"></td>
                           </tr>
                            <tr>
                               <th>产品规格：</th>
                               <td><input type="text" name="specifications">(单位：g)</td>
                           </tr>
                            <tr>
                               <th>保质期：</th>
                               <td><input type="text" name="expirationTime"></td>
                           </tr>
                            <tr>
                               <th>产品标准号：</th>
                               <td><input type="text" name="standardNo"></td>
                           </tr>
                            <tr>
                               <th>生产许可证编号：</th>
                               <td><input type="text" name="productionLicense"></td>
                           </tr>
                           <tr>
                               <th>储存方式：</th>
                               <td><input type="text" name="storage"></td>
                           </tr>
                           <tr>
                               <th>食用方法：</th>
                               <td><input type="text" name="edibleMethods"></td>
                           </tr>
                           	<tr>
                           		<th>口味</th>
                           		<td>
	                           		<c:forEach var="taste" items="${tastes}">
	                           			<input type="checkbox" name="tasteid" value="${taste.id }" > ${taste.name}
	                           		</c:forEach>
                           		</td>
                           	</tr>
                           	<tr>
                               <th>商品细节：<span class="red">(*)</span></th>
                               <td><script id="editor" name="productDetails" type="text/plain" style="width:800px;height:400px;"></script></td>
                           </tr>
                          
                           <tr>
                               <th></th>
                               <td>
                               <input  type="submit">
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
   <script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
    
    
</script>
   
  </body>
</html>
