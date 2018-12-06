<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- Custom Theme files -->
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!--js-->
<script src="${pageContext.request.contextPath }/js/jquery-2.1.1.min.js"></script> 
<!--icons-css-->
<link href="${pageContext.request.contextPath }/css/font-awesome.css" rel="stylesheet"> 
<!--Google Fonts-->
<link href='https://fonts.googleapis.com/css?family=Carrois+Gothic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Work+Sans:400,500,600' rel='stylesheet' type='text/css'>
<!--static chart-->
<script src="${pageContext.request.contextPath }/js/Chart.min.js"></script>
<!--//charts-->
<!-- geo chart -->
    <script src="http://cdn.jsdelivr.net/modernizr/2.8.3/modernizr.min.js" type="text/javascript"></script>
    <script>window.modernizr || document.write('<script src="lib/modernizr/modernizr-custom.js"><\/script>')</script>
    <!--<script src="lib/html5shiv/html5shiv.js"></script>-->
     <!-- Chartinator  -->
    <script src="${pageContext.request.contextPath }/js/chartinator.js" ></script>
<!--geo chart-->

<!--skycons-icons-->
<script src="${pageContext.request.contextPath }/js/skycons.js"></script>
<!--//skycons-icons-->
<script type="text/javascript">


function main()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/user/main";
}
function querydept()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/dept/showdepts";
}
function adddept()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/dept/adddemo";
}
function queryclass()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/cla/showclass";
}
function addclass()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/cla/showmajor";
}
function querystudent()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/student/showstudent";
}
function addstudent()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/student/adddemo";
}
function excelstudent()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/student/exceldemo";
}
function queryboard()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/notice/showboard";
}
function addboard()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/notice/adddemo";
}
function queryplace()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/count/showplace";
}
function querydirection()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/count/showdirection";
}
function querymajor()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/count/showmajor";
}
function history()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/count/select";
}
function adduser()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/user/exceldemo";
}
function updatepassword()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/user/password";
}
</script>
<!-- script-for sticky-nav -->
		<script>
		$(document).ready(function() {
			 var navoffeset=$(".header-main").offset().top;
			 $(window).scroll(function(){
				var scrollpos=$(window).scrollTop(); 
				if(scrollpos >=navoffeset){
					$(".header-main").addClass("fixed");
				}else{
					$(".header-main").removeClass("fixed");
				}
			 });
			 
		});
		</script>
		<!-- /script-for sticky-nav -->
</head>
<body>
<div class="page-container">	
   <div class="left-content" >
	   <div class="mother-grid-inner" >
            <!--header start here-->
				<div class="header-main" style="background:white;position: relative; width: 100%">
							<div class="logo-name" style="margin-right: 10px;width:270px;">
									 <a href="index.html"> <h1 style="font-size: 25px;">毕业生跟踪服务平台</h1>	
								   </a> 								
							</div>
						<!-- 右边管理员div -->
						 <div class="header-right">
							<!--notification menu end -->
							<div class="profile_details">		
								<ul>
									<li class="dropdown profile_details_drop">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
											<div class="profile_img">	
												<span class="prfil-img"><img src="${pageContext.request.contextPath }/images/p1.png" alt=""> </span> 
												<div class="user-name">
													<p>admin</p>
													<span>管理员</span>
												</div>
												<i class="fa fa-angle-down lnr"></i>
												<i class="fa fa-angle-up lnr"></i>
												<div class="clearfix"></div>	
											</div>	
										</a>
										<ul class="dropdown-menu drp-mnu">
											<li> <a href="#"><i class="fa fa-cog"></i> Settings</a> </li> 
											<li> <a href="#"><i class="fa fa-user"></i> Profile</a> </li> 
											<li> <a href="#"><i class="fa fa-sign-out"></i> Logout</a> </li>
										</ul>
									</li>
								</ul>
							</div>		
						</div>
						<!-- 右边管理员div -->
						
				     <div class="clearfix"> </div>	
				</div>
<!--heder end here-->

<!--inner block start here-->
   <div id="main-content" style="width: 100%;  height: 1400px;position: relative;">
     
     <iframe id="ifr" src="${pageContext.request.contextPath }/user/main" width="100%" height="100%" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
   </div>
   
</div>
</div>

<!--slider menu-->
    <div class="sidebar-menu">
		  	<div class="logo"> <a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> <a href="#"> <span id="logo" ></span> 
			     
			  </a> </div>		  
		    <div class="menu">
		      <ul id="menu" >
		        <li id="menu-home" ><a href="javascript:main();"><i class="fa fa-tachometer"></i><span>首页</span></a></li>
		        <li><a href="#"><i class="fa fa-cogs"></i><span>系部信息维护</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul>
		            <li><a href="javascript:querydept();">系部查询</a></li>
		            <li><a href="javascript:adddept();">系部添加</a></li>		            
		          </ul>
		        </li>
		        <li><a href="#"><i class="fa fa-book nav_icon"></i><span>班级信息维护</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul>
		            <li><a href="javascript:queryclass();">班级查询</a></li>
		            <li><a href="javascript:addclass();">班级添加</a></li>		            
		          </ul>
		        </li>
		        <li><a href="#"><i class="fa fa-cog"></i><span>学生信息维护</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul>
		            <li><a href="javascript:querystudent();">学生查询</a></li>
		            <li><a href="javascript:addstudent();">学生添加</a></li>	
		            <li><a href="javascript:excelstudent();">学生录入</a></li>		            
		          </ul>
		        </li>
		        
		        <li><a href="#"><i class="fa fa-file-text"></i><span>公告管理</span><span class="fa fa-angle-right" style="float: right"></span></a>
		          <ul>
		            <li><a href="javascript:queryboard();">查询公告</a></li>
		            <li><a href="javascript:addboard();">公告添加</a></li>	
		          </ul>
		        </li>
		        
		      <li><a href="#"><i class="fa fa-bar-chart"></i><span>统计分析</span><span class="fa fa-angle-right" style="float: right"></span></a>
		        	 <ul id="menu-academico-sub" >
			            <li id="menu-academico-avaliacoes" ><a href="javascript:queryplace();">工作地点分析</a></li>
			            <li id="menu-academico-boletim" ><a href="javascript:querydirection();">就业方向分析</a></li>
		                <li id="menu-academico-boletim" ><a href="javascript:querymajor();">专业分析</a></li>
		              <li id="menu-academico-boletim" ><a href="javascript:history();">历史分析</a></li>
		             </ul>
		        </li>
		         <li><a href="#"><i class="fa fa-cog"></i><span>系统管理</span><span class="fa fa-angle-right" style="float: right"></span></a>
		         	 <ul id="menu-academico-sub" >
			            <li id="menu-academico-avaliacoes" ><a href="javascript:adduser();">录入用户</a></li>
			            <li id="menu-academico-boletim" ><a href="javascript:updatepassword();">修改密码</a></li>
		             </ul>
		         </li>
		        <!--  <li><a href="#"><i class="fa fa-shopping-cart"></i><span>E-Commerce</span><span class="fa fa-angle-right" style="float: right"></span></a>
		         	<ul id="menu-academico-sub" >
			            <li id="menu-academico-avaliacoes" ><a href="product.html">Product</a></li>
			            <li id="menu-academico-boletim" ><a href="price.html">Price</a></li>
		             </ul>
		         </li> -->
		      </ul>
		    </div>
	 </div>
	<!-- <div class="clearfix"> </div> -->
</div>
<!--slide bar menu end here-->
<script>
var toggle = true;
            
$(".sidebar-icon").click(function() {                
  if (toggle)
  {
    $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
    $("#menu span").css({"position":"absolute"});
  }
  else
  {
    $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
    setTimeout(function() {
      $("#menu span").css({"position":"relative"});
    }, 400);
  }               
                toggle = !toggle;
            });
</script>
<%-- <!--scrolling js-->
		<script src="${pageContext.request.contextPath }/js/jquery.nicescroll.js"></script>
		<script src="${pageContext.request.contextPath }/js/scripts.js"></script>
		<!--//scrolling js-->
<script src="${pageContext.request.contextPath }/js/bootstrap.js"> </script>
<!-- mother grid end here--> --%>
</body>
</html>