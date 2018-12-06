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
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/count/yearplace?year=1&student_id=11";
}
function adduser()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/user/exceldemo";
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
 <div class="container">
    <div id="toolbar" class="btn-group">
    <div>
       <a id="export" class="btn btn-default" href="${pageContext.request.contextPath}/count/exports1">
            <span class="glyphicon glyphicon-export" aria-hidden="true"></span>导出教师全部信息
        </a>
        </div></div></div>
</body>
</html>