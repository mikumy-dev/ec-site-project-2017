<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>/frontend">
	<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>注册</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="../AmazeUI-2.4.2/assets/css/amazeui.min.css" />
    <link href="../css/dlstyle.css" rel="stylesheet" type="text/css">
    <script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="../AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mycss.css" />
  </head>
  <body>
    <div class="login-boxtitle">
        <a href="home/demo.html"><img alt="" src="../images/logobig.png" /></a>
    </div>
    <div class="res-banner">
        <div class="res-main">
            <div class="login-banner-bg"><span></span><img src="../images/big.jpg" /></div>
            <div class="login-box">
                <div class="am-tabs" id="doc-my-tabs">
                    <ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
                        <li class="am-active"><a href="">用户注册</a></li>
                    </ul>
                    <div class="am-tabs-bd">
                        <div class="am-tab-panel am-active">
                            <form action="user/register" method="post" onsubmit="return checkpwd();">
                                <div class="user-name">
                                    <label for="username"><i class="am-icon-envelope-o"></i></label>
                                    <input type="text" required="required" name="username" id="username" placeholder="请输入用户名">
                                </div>
                                <div class="user-pass">
                                    <label for="password"><i class="am-icon-lock"></i></label>
                                    <input type="password" required="required" name="loginpwd" id="pwd" placeholder="设置密码">
                                </div>
                                <div class="user-pass">
                                    <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
                                    <input type="password" required="required" name="loginpwd1" id="pwd1" placeholder="确认密码">
                                </div>
                            
                               
                            <div class="am-cf">
                                <input type="submit" id="regBtn" disabled="disabled" name="" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
                            </div>
                            </form>
                                 <input  id="regText" required="required" type="checkbox"> 点击表示您同意商城《服务协议》
                             <br><br><a href="../frontend/login.jsp">已有账号？立即登录</a>
                             <p style="color:red;">${reg_msg }</p>
                        </div>
                       
                        
   <script>
   function checkpwd(){
   	if($("#pwd").val()!=$("#pwd1").val()){
   		alert("两次输入的密码不相同！");
   		return false;
   	}
   }
   $(function() {
       $('#doc-my-tabs').tabs();
   });
                      

$(function(){
    var regBtn = $("#regBtn");
    $("#regText").change(function(){
        var that = $(this);
        that.prop("checked",that.prop("checked"));
        if(that.prop("checked")){
            regBtn.prop("disabled",false);
        }else{
            regBtn.prop("disabled",true);
        }
    });
});

    </script>
                    </div>
                </div>
            </div>
        </div>
        	<c:import url="goodsfooter.jsp"></c:import>
</body>
  
  </html>
