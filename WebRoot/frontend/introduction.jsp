<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>商品详情页面</title>
<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/basic/css/demo.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="${pageContext.request.contextPath }/css/optstyle.css" rel="stylesheet" />
<link type="text/css" href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/mycss.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/basic/js/jquery-1.7.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/basic/js/quick_links.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.imagezoom.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.flexslider.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/list.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/introduction.js"></script>

<style>
.tb-taglist-li, .am-nav-tabs li a span{
cursor:pointer;
}
.current{
color:red;
}
</style>

</head>
<body>
	<!-- header -->
	<c:import url="goodsheader.jsp"></c:import>
	<!-- header -->
	<b class="line"></b>
	<div class="listMain">
		<!--分类-->
		<div class="nav-table">
			<c:import url="goodsheader1.jsp"></c:import>
		</div>
		<ol class="am-breadcrumb am-breadcrumb-slash">
			<li>
				<a href="prod/init">首页</a>
			</li>
			<li>
				<a href="#">分类</a>
			</li>
			<li class="am-active">内容</li>
		</ol>
		<div class="scoll">
			<section class="slider">
			<div class="flexslider">
				<ul class="slides">
					<li><img src="${pageContext.request.contextPath }/images/01.jpg" title="pic" /></li>
					<li><img src="${pageContext.request.contextPath }/images/02.jpg" /></li>
					<li><img src="${pageContext.request.contextPath }/images/03.jpg" /></li>
				</ul>
			</div>
			</section>
		</div>

		<!--放大镜-->
		<div class="item-inform">
			<div class="clearfixLeft" id="clearcontent">
				<div class="box">
					<div class="tb-booth tb-pic tb-s310">
						<a href="${product.productPictureBig }">
						<img src="${product.productPictureMid }"
							alt="细节展示放大镜特效" rel="${product.productPictureBig }" class="jqzoom" />
						</a>
					</div>
					<ul class="tb-thumb" id="thumblist">
						<li class="tb-selected">
							<div class="tb-pic tb-s40">
								<a href="#"><img src="${product.productPictureSmall }"
									mid="${product.productPictureMid }" big="${product.productPictureMid }">
								</a>
							</div>
						</li>
					</ul>
				</div>

				<div class="clear"></div>
			</div>

			<div class="clearfixRight">
				<!--规格属性-->
				<!--名称-->
				<input type="hidden" name="pid" id="pid" value="${product.id }" />
				<div class="tb-detail-hd">
					<h1>${product.productName }</h1>
				</div>
				<div class="tb-detail-list">
					<!--价格-->
					<div class="tb-detail-price">
						<li class="price iteminfo_price">
							<dt>价格</dt>
							<dd>
								<em>¥</em><b class="sys_item_price">${product.price }</b>
								<input type="hidden" name="spprice" value="${product.price }" />
							</dd>
						</li>
					<div class="clear"></div>
				</div>

					<!--销量-->
					<ul class="tm-ind-panel">
						<li class="tm-ind-item tm-ind-sellCount canClick">
							<div class="tm-indcon">
								<span class="tm-label">月销量</span><span class="tm-count">1015</span>
							</div>
						</li>
						<li class="tm-ind-item tm-ind-sumCount canClick">
							<div class="tm-indcon">
								<span class="tm-label">累计销量</span><span class="tm-count">6015</span>
							</div>
						</li>
						<li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
							<div class="tm-indcon">
								<span class="tm-label">累计评价</span><span class="tm-count">640</span>
							</div>
						</li>
					</ul>
					<div class="clear"></div>
					<!--各种规格-->
					<dl class="iteminfo_parameter sys_item_specpara">
						<dt class="theme-login">
							<div class="cart-title">
								可选规格<span class="am-icon-angle-right"></span>
							</div>
						</dt>
						<dd>
							<!--操作页面-->
						<div class="theme-popover-mask"></div>

						<div class="theme-popover">
							<div class="theme-span"></div>
							<div class="theme-poptit">
								<a href="javascript:;" title="关闭" class="close">×</a>
							</div>
							<div class="theme-popbod dform">
								<form class="theme-signin" name="loginform" action="" method="post">
									<div class="theme-signin-left">
										<div class="theme-options">
											<div class="cart-title">口味</div>											
											<ul>
											<!-- 遍历口味 -->
											<c:forEach var="taste" items="${tastes }">
											<li class="sku-line" value="${taste.id }">${taste.name }<i></i> </li>
											</c:forEach>
											<!-- 遍历口味 结束-->
											</ul>											
										</div>										
										
										<div class="theme-options">
											<div class="cart-title number">数量</div>
											<dd>
												<input id="min" class="am-btn am-btn-default operator" name="" type="button" value="-" /> 
												<input id="quantity1" name="num" type="text" value="1" style="width:30px;" /> 
												<input id="add" class="am-btn am-btn-default operator" type="button" value="+" /> 
												<span id="Stock" class="tb-hidden">库存
													<span class="stock">${product.inventory }</span>件
												</span>
											</dd>
										</div>
										<div class="clear"></div>

										<div class="btn-op">
											<div class="btn am-btn am-btn-warning">确认</div>
											<div class="btn close am-btn am-btn-warning">取消</div>
										</div>
									</div>
									<div class="theme-signin-right">
										<div class="img-info">
											<img src="${pageContext.request.contextPath }/images/songzi.jpg" />
										</div>
										<div class="text-info">
											<span class="J_Price price-now">¥39.00</span> 
											<span id="Stock" class="tb-hidden">库存<span class="stock">1000</span>件</span>
										</div>
									</div>
								</form>
							</div>
						</div>
					</dd>
				</dl>

		<div class="clear"></div>
				</div>
				<c:if test="${user==null }">
				<div class="pay">
					<li>
						<div class="clearfix tb-btn tb-btn-buy theme-login">
							<a href="javascript:login()">立即购买</a>
						</div>
					</li>
					<li>
						<div class="clearfix tb-btn tb-btn-basket theme-login">
							<a href="javascript:login()">加入购物车</a>
						</div>
					</li>
					
					<li>
						<div class="clearfix tb-btn tb-btn-buy theme-login">
							<a href="javascript:login()">加入收藏夹</a>
						</div>
					</li>
				</div>
				</c:if>
				<c:if test="${user!=null }">
				<div class="pay">
					<li>
						<div class="clearfix tb-btn tb-btn-buy theme-login">
							<a id="LikeBuy">立即购买</a>
						</div>
					</li>
					<li>
						<div class="clearfix tb-btn tb-btn-basket theme-login">
							<a id="LikBasket">加入购物车</a>
						</div>
					</li>
					<li>
						<div class="clearfix tb-btn tb-btn-buy theme-login">
							<a class="addCollection">加入收藏夹</a>
						</div>
					</li>
				</div>
				</c:if>
			</div>
			<script type="text/javascript">
			
			$(function(){
				//加减号
				$(".operator").click(function(){
					var operator = $(this).val();
					var num = parseInt($("#quantity1").val());
						if(operator=="+"){
							num+=1;
						}
						if(operator=="-"){
							if(num>1){
								num--;
							}else{
								num=1;
							}
						}
					$("#quantity1").val(num);
				});
				
				//立即购买
				$("#LikeBuy").click(function(){
					var orderScheduleList = new Array();
					//获取商品的id、口味、数量
					var obj = {
						productid: parseInt($("#pid").attr("value")),
						taste: parseInt($(".selected").attr("value")),
						num: parseInt($("#quantity1").attr("value"))
					};
					orderScheduleList.push(obj);
					$.ajax({  
					    type: "POST",  
					    url: "order/shopcartOrder",  
					    data: JSON.stringify(orderScheduleList),//将对象序列化成JSON字符串  
					    dataType:"json",  
					    contentType : 'application/json;charset=utf-8', //设置请求头信息  
					    success: function(msg){  
					       window.location.href="frontend/pay.jsp";
					    } 
					     
					}); 
				});
				
			
				//加入购物车
				$("#LikBasket").on("click",function(){
					 $.ajax({
						type:"POST",
						url:"shopcart/addToShopCart",
						data :"pid=${product.id}&tasteid="+$(".selected").attr("value")+"&quantity="+$("#quantity1").attr("value"),
						success:function(msg){
							if(msg=="1"){
								alert("加入购物车成功");
							}
						}
					}); 
				});
				//添加收藏
				$(".addCollection").on("click",function(){
					$.ajax({
						type:"POST",
						url:"collection/addCollection",
						data:"productid=${product.id}&userid=${user.uid}&createdBy=${user.username}",
						success:function(msg){
							if(msg=="1"){
								alert("添加收藏成功！");
							}else{
								alert("您已收藏！");
							}
						}
					});
				});
			});
			</script>
			<div class="clear"></div>
		</div>
		<div class="clear"></div>
		<!-- introduce-->
		<div class="introduce">
			<div class="browse">
				<div class="mc">
					<ul>
						<div class="mt">
							<h2>看了又看</h2>
						</div>
						<!-- 遍历看了又看 -->
						<li class="first">
							<div class="p-img">
								<a href="javascript:;"> 
									<img class="" src="${pageContext.request.contextPath }/images/browse1.jpg">
								</a>
							</div>
							<div class="p-name">
								<a href="javascript:;"> 【三只松鼠_开口松子】零食坚果特产炒货东北红松子原味 </a>
							</div>
							<div class="p-price">
								<strong>￥35.90</strong>
							</div>
						</li>
						<!-- 遍历看了又看结束 -->
					</ul>
				</div>
			</div>
			
			<div class="introduceMain">
				<div class="am-tabs" data-am-tabs>
					<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
						<li class="am-active">
							<a href="javascript:;"> <span class="index-needs-dt-txt">宝贝详情</span></a>
						</li>
						<li>
							<a href=""> <span class="index-needs-dt-txt" id="comments">全部评价</span></a>
						</li>
						<li>
							<a href="javascript:;"> <span class="index-needs-dt-txt">猜你喜欢</span></a>
						</li>
					</ul>
					<div class="am-tabs-bd">
						<div class="am-tab-panel am-fade am-in am-active">
							<div class="J_Brand">
								<div class="attr-list-hd tm-clear">
									<h4>产品参数：</h4>
								</div>
								<div class="clear"></div>
								<ul id="J_AttrUL">
									<li title="">产品类型:&nbsp;${product.productType }</li>
									<li title="">原料产地:&nbsp;${product.materialAddr }</li>
									<li title="">产地:&nbsp;${product.produceAddr }</li>
									<li title="">配料表:&nbsp;${product.ingredients }</li>
									<li title="">产品规格:&nbsp;${product.specifications }g</li>
									<li title="">保质期:&nbsp;${product.expirationTime }</li>
									<li title="">产品标准号:&nbsp;${product.standardNo }</li>
									<li title="">生产许可证编号：&nbsp;${product.productionLicense }</li>
									<li title="">储存方法：&nbsp;${product.storage }</li>
									<li title="">食用方法：&nbsp;${product.edibleMethods }</li>
								</ul>
								<div class="clear"></div>
							</div>

							<div class="details">
								<div class="attr-list-hd after-market-hd">
									<h4>商品细节</h4>
								</div>
								<div class="twlistNews">
									${product.productDetails }
								</div>
							</div>
							<div class="clear"></div>
						</div>
						<div class="am-tab-panel am-fade">
							<div class="actor-new">
								<div class="rate">
									<strong>
									</strong><br> <span>好评度</span>
								</div>

							</div>
							<div class="clear"></div>
							<div class="tb-r-filter-bar">
								<ul class=" tb-taglist am-avg-sm-4">
									<li class="tb-taglist-li tb-taglist-li-current current">
										<div class="comment-info">
											<span>全部评价</span> <span class="tb-tbcr-num" id="allcom"></span>
										</div>
									</li>

									<li class="tb-taglist-li tb-taglist-li-1">
										<div class="comment-info">
											<span>好评</span> <span class="tb-tbcr-num" id="acom"></span>
										</div>
									</li>

									<li class="tb-taglist-li tb-taglist-li-0">
										<div class="comment-info">
											<span>中评</span> <span class="tb-tbcr-num" id="bcom"></span>
										</div>
									</li>

									<li class="tb-taglist-li tb-taglist-li--1">
										<div class="comment-info">
											<span>差评</span> <span class="tb-tbcr-num" id="ccom"></span>
										</div>
									</li>
								</ul>
							</div>
							<div class="clear"></div>
							<!-- 放评论的地方 -->
							<ul class="am-comments-list am-comments-list-flip"></ul>
							<!-- 放评论的地方 -->
							<div class="clear"></div>

							<!--分页 -->
							
							<div class="clear"></div>

							<div class="tb-reviewsft">
								<div class="tb-rate-alert type-attention">
									购买前请查看该商品的 <a href="#" target="_blank">购物保障</a>，明确您的售后保障权益。
								</div>
							</div>

						</div>

						<div class="am-tab-panel am-fade">
							<div class="like">
								<ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
								<!-- 遍历推荐物品开始 -->
									<li>
										<div class="i-pic limit">
											<img src="${pageContext.request.contextPath }/images/imgsearch1.jpg" />
											<p>
												【良品铺子_开口松子】零食坚果特产炒货 <span>东北红松子奶油味</span>
											</p>
											<p class="price fl">
												<b>¥</b> <strong>298.00</strong>
											</p>
										</div>
									</li>
								<!-- 遍历推荐物品结束 -->
								</ul>
							</div>
							<div class="clear"></div>

							<!--分页 -->
							<ul class="am-pagination am-pagination-right">
								<li class="am-disabled">
									<a href="javascript:;">&laquo;</a>
								</li>
								<li class="am-active">
									<a href="javascript:;">1</a>
								</li>
								<li>
									<a href="#">2</a>
								</li>
								<li>
									<a href="javascript:;">&raquo;</a>
								</li>
							</ul>
							<div class="clear"></div>
						</div>
					</div>
				</div>
				<div class="clear"></div>
				<!--尾部-->
				<c:import url="goodsfooter.jsp"></c:import>
				<!--尾部结束-->
			</div>
		</div>
	</div>
	<!--菜单 -->
	<c:import url="goodsright.jsp"></c:import>
	
	<script>
					var objArr = [];
					var goodComments=[];
					var normalComments=[];
					var badComments=[];
					var attrs=['avatar','username','createdDayStr','content','tastename'];
					$(function(){						
						$("#comments").on("click",function(){
							
							if($(".am-comments-list").html()==""){
							$.ajax({
								type:"POST",
								url:"comment/selectByProductId",
								data:"productid=${product.id }",
								success:function(msg){
									//alert(msg);
									objArr = eval('('+msg+')');
									
									//console.log(objArr);									
									for (var obj of objArr){
										if(obj.status=="A"){
											goodComments.push(obj);
										}
										if(obj.status=="B"){
											normalComments.push(obj);
										}
										if(obj.status=="C"){
											badComments.push(obj);
										}
									}
									$("#allcom").text("("+objArr.length+")");
									$("#acom").text("("+goodComments.length+")");
									$("#bcom").text("("+normalComments.length+")");
									$("#ccom").text("("+badComments.length+")");
									$(".rate strong").text(Math.floor(goodComments.length*100/objArr.length)+"%");
									
									addCommentArrToHTML(objArr);
								}
							});
							}
						});
						$(".tb-taglist-li-current").on("click",function(){
							$(this).addClass("current").siblings().removeClass("current");
							$(".am-comments-list").empty();
							addCommentArrToHTML(objArr);
						});
						$(".tb-taglist-li-1").on("click",function(){
							$(this).addClass("current").siblings().removeClass("current");
							$(".am-comments-list").empty();
							addCommentArrToHTML(goodComments);
						});
						$(".tb-taglist-li-0").on("click",function(){
							$(this).addClass("current").siblings().removeClass("current");
							$(".am-comments-list").empty();
							addCommentArrToHTML(normalComments);
						});
						$(".tb-taglist-li--1").on("click",function(){
							$(this).addClass("current").siblings().removeClass("current");
							$(".am-comments-list").empty();
							addCommentArrToHTML(badComments);
						});
						
					});
					function heredoc(fn) {
					    return fn.toString().split('\n').slice(1,-1).join('\n') + '\n';
					}
					
					function addCommentArrToHTML(objArrs){
						var commenthtml="";
						for(var obj of objArrs){
						var temp = heredoc(function(){/*
							<li class="am-comment">
							<!-- 评论容器 --> 
							<a href="javascript:;"> 
								<!-- 评论者头像 -->
								<img class="am-comment-avatar" src="cl.avatar" />
							</a>

							<div class="am-comment-main">
								<!--评论标题-->
								<header class="am-comment-hd"> 
								<div class="am-comment-meta">
									<!-- 评论元数据 用户名-->
									<a href="#link-to-user" class="am-comment-author">cl.username</a>
									<!-- 评论时间 -->
									评论于
									<time datetime="">cl.createdDayStr</time>
								</div>
								</header>

								<div class="am-comment-bd">
									<div class="tb-rev-item " data-id="255776406962">
										<div class="J_TbcRate_ReviewContent tb-tbcr-content ">
										<!-- 评论内容 -->
											cl.content
										</div>
										<!-- 评论者所买的商品 -->
										<div class="tb-r-act-bar">口味：cl.tastename</div>
									</div>
								</div>
							</div>
						</li>
						*/});
						for(var i=0;i<attrs.length;i++){
							temp=temp.replace("cl."+attrs[i], obj[attrs[i]]);
						}
						commenthtml+=temp;
						}
						
						$(".am-comments-list").append(commenthtml);
					}
					</script>
					
</body>
</html>
