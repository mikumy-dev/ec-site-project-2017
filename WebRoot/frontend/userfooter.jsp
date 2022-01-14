<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">



</head>

<body>
	<div class="footer">
                <div class="footer-nav">
                    <div class="footer-nav-head">购物指南</div>
                    <ul>
                        <li><a href="">购物流程</a>
                        </li>
                        <li><a href="">会员介绍</a>
                        </li>
                        <li><a href="">发现美食</a>
                        </li>
                        <li><a href="">常见问题</a>
                        </li>
                        <li><a href="">联系客服</a>
                        </li>
                    </ul>
                </div>
                <div class="footer-nav">
                    <div class="footer-nav-head">配送方式</div>
                    <ul>
                        <li><a href="">上门自提</a>
                        </li>
                        <li><a href="">限时送达</a>
                        </li>
                        <li><a href="">配送查询</a>
                        </li>
                        <li><a href="">配送费用</a>
                        </li>
                        <li><a href="">海外配送</a>
                        </li>
                    </ul>
                </div>
                <div class="footer-nav">
                    <div class="footer-nav-head">支付方式</div>
                    <ul>
                        <li><a href="">货到付款</a>
                        </li>
                        <li><a href="">在线支付</a>
                        </li>
                        <li><a href="">分期付款</a>
                        </li>
                        <li><a href="">邮局汇款</a>
                        </li>
                        <li><a href="">公司转账</a>
                        </li>
                    </ul>
                </div>
                <div class="footer-nav">
                    <div class="footer-nav-head">售后服务</div>
                    <ul>
                        <li><a href="">售后政策</a>
                        </li>
                        <li><a href="">价格保护</a>
                        </li>
                        <li><a href="">退款说明</a>
                        </li>
                        <li><a href="">退货换货</a>
                        </li>
                        <li><a href="">取消订单</a>
                        </li>
                    </ul>
                </div>
                <hr>
                <div class="copy-right-links">
                	<a href="">关于我们</a>
                	<span>|</span>
                	<a href="">联系我们</a>
                	<span>|</span>
                	<a href="">联系客服</a>
                	<span>|</span>
                	<a href="">合作招商</a>
                	<span>|</span>
                	<a href="">商家帮助</a>
                	<span>|</span>
                	<a href="">营销中心</a>
                	<span>|</span>
                	<a href="">手机APP</a>
                	<span>|</span>
                	<a href="">友情链接</a>
                	<span>|</span>
                	<a href="">销售联盟</a>
                	<span>|</span>
                	<a href="">购物社区</a>
                	<span>|</span>
                	<a href="">风险监测</a>
                	<span>|</span>
                	<a href="">隐私政策</a>
                	<span>|</span>
                	<a href="">企业公益</a>
                </div>
                <br><br>
                <div class="copy-right-info">
                	<p>
                		<span>京公网安备 11000002xxxxxx号</span>
                		<span>|</span>
                		<span>京ICP证xxxxxx号</span>
                		<span>|</span>
                		<span>互联网食品信息服务资格证编号(京)-经营性-2014-xxxx</span>
                		<span>|</span>
                		<span>新出发京零 字第大xxxxxx号</span>
                	</p>
                	<p>
                		<span>Copyright © 2004 - 2017   版权所有</span>
                		<span>|</span>
                		<span>消费者维权热线：4006067733</span>
                		<span>|</span>
                		<span>经营证照</span> 
                		<span>|</span>
                		<span>违法和不良信息举报电话：4006561155</span>
                	</p>                	              	
                </div>
                <br>
                <div class="copy-right-auth">                	                		
                	<a href="http://www.hd315.gov.cn/beian/view.asp?bianhao=010202007080200026" target="_blank">
                	<img src="${pageContext.request.contextPath }/images/icon1.png" alt="">
                	经营性网站备案中心
                	</a>
                	<a href="https://ss.knet.cn/verifyseal.dll?sn=2008070300100000031&amp;ct=df&amp;pa=294005" target="_blank"><img src="${pageContext.request.contextPath }/images/icon2.png" alt="">可信网站信用评估</a>
                	<a href="http://www.bj.cyberpolice.cn/index.do" target="_blank"><img src="${pageContext.request.contextPath }/images/icon3.png" alt="">网络警察提醒你</a>
                	<a href="https://search.szfw.org/cert/l/CX20120111001803001836" target="_blank" ><img src="${pageContext.request.contextPath }/images/icon4.png" alt="">诚信网站</a>
                	<a href="http://jubao.12377.cn:13225/reportinputcommon.do" target="_blank"><img src="${pageContext.request.contextPath }/images/icon5.png" alt="">中国互联网举报中心</a>
                	<a href="http://www.12377.cn/node_548446.htm" target="_blank"><img src="${pageContext.request.contextPath }/images/icon6.png" alt="">网络举报APP下载</a>
                </div>
            </div>
</body>
</html>
