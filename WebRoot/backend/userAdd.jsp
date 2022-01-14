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

	<title>添加用户</title>
    <link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
    <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="../css/personal.css" rel="stylesheet" type="text/css">
    <link href="../css/wallet.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="../css/mycss.css" />
    <script src="../AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="../AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
    
 	<script type="text/javascript" src="../js/jquery.form.min.js"></script></head>
  
  <body>
   
    <div class="center">
         <div class="col-main">
            <div class="main-wrap">
                <div class="am-cf am-padding">
                    <div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">添加用户</strong> </div>
                </div>
                <hr>
                
                <br><br>
               <form action="adminuser/addUser" enctype="multipart/form-data" 
               method="post" id="formid" onsubmit="return checkUserInfo();">
                   <table>
                       <tbody>
                           <tr>
                               <th>用户名：</th>
                               <td><input type="text" name="username" id="username"></td>
                           </tr>
                           <tr>
                               <th>密码：</th>
                               <td><input type="password" name="loginpwd" id="pwd"></td>
                           </tr>
                           <tr>
                               <th>确认密码：</th>
                               <td><input type="password" id="pwd1"></td>
                           </tr>
                           <tr>
                               <th>头像：</th>
                               <td><input type="file" name="avatarfile"></td>
                           </tr>
                           <tr>
                               <th>用户权限：</th>
                               <td>
                               <input type="radio" value="admin" name="role">管理员
                                <input type="radio" value="user" name="role">普通用户
                               </td>
                           </tr>
                           <tr>
                               <th></th>
                               <td>
                               <input type="submit" value="提交"/>
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
    
				function checkUserInfo() {
					if($("#username").val()==""){
						alert("请输入用户名！");return false;
					}
					if($("#pwd").val()==""){
						alert("请输入密码");return false;
					}
					if($("#pwd").val()!=$("#pwd1").val()){
						alert("两次输入的密码不相同");return false;
					}
					if($("input[name='role']:checked").val()==null){
						alert("请选择用户权限");return false;
					}
					return true;
				}
	</script>
    
  </body>
</html>
