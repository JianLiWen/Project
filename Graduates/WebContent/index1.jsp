<%@page import="com.wjl.graduate.pojo.Student"%>
<%@page import="com.wjl.graduate.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/layui/css/layui.css" media="all">

<link href="${pageContext.request.contextPath }/css/st.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='https://fonts.googleapis.com/css?family=Montserrat+Alternates' rel='stylesheet' type='text/css'>
<!-- -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/modal.css">
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
 
<script type="text/javascript">

function main()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/user/main1";
}
function board()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/notice/bshowboard";
}
function contact()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/student/contact";
}

function personal()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/student/beforeshowall";
}
function count()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/count/classplace";
}
function countdir()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/count/classdirection";
}
function countmajor()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/count/classmajor";
}
function message()
{
	 
	document.getElementById("ifr").src="${pageContext.request.contextPath }/message/messagedemo";
}
</script>

</head>
<body>
 <%
/*  String name  =  (String)(request.getAttribute("name"));
 String id = (String)(request.getAttribute("id")); */
  String name = (String)session.getAttribute("name");
 String id = (String)session.getAttribute("id");
%> 
<div class="header-bg">
	<div class="wrap"> 
		<div class="total-box">
				<div class="total" style="	background: url('${pageContext.request.contextPath }/images/gradient.png') 0 bottom repeat-x;">
					<div class="header_top">
				     	<div class="menu">
			     			 <ul class="layui-nav">
        <li class="layui-nav-item layui-this"><a href="javascript:main();">首页</a></li>
        <li class="layui-nav-item ">
            <a>统计分析</a>
            <dl class="layui-nav-child">
                <dd><a href="javascript:count();">工作地点分析</a></dd>
                <dd><a href="javascript:countdir();">就业方向分析</a></dd>
                <dd><a href="javascript:countmajor();">专业分析</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item"><a href="javascript:message();">留言板</a></li>
        <li class="layui-nav-item">
            <a href="javascript:board();">公告栏</a>
        </li>
        <li class="layui-nav-item"><a href="javascript:contact();">通讯录</a></li>    
    </ul>
				     	</div>
		                  <ul class="follow_icon" style="margin: 5px 10px 0;color: white;font-size: 15px;">
                               <li>
                                 <span class="text">&nbsp;&nbsp;&nbsp;欢迎你， <%=name %> </span>&nbsp;
                                     <b class="caret"></b>
                               <ul class="dropdown-menu">
                              <li ><a href="javascript:personal();" style="color: white;font-size: 15px;"> 个人中心&nbsp;&nbsp;&nbsp;</a></li>
                              
                              <li><a href="${pageContext.request.contextPath }/user/logindemo" style="color: white;">退出系统</a></li>
                              </ul>
                               </li>
						</ul>
         	 <script src="${pageContext.request.contextPath }/plugins/layui/layui.js"></script>
          <script>
        layui.use('element', function() {
            var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块

            //监听导航点击
            element.on('nav(demo)', function(elem) {
                //console.log(elem)
                layer.msg(elem.text());
            });
        });
    </script>
		     			<div class="clear"></div>
		     	</div>
			     <div class="header-bottom">
					 <div class="logo">
						<h1><a href="index.html">Graduate</a></h1>
					 </div>
					<div class="search">
						   <form>
						    	<input type="text" value="">
						    	<input type="submit" value="" style="background:#FFA30C url('${pageContext.request.contextPath }/images/search.png') no-repeat 11px 13px;">
						  </form>
					</div>
					<div class="clear"></div> 
				</div>
			</div>	
		</div>
	 </div>
</div>
    
	<div class="banner-box" style="height:100%;background-color: #FDF4E8;">
		<div class="wrap" style="background-color: green">
			<div class="main-top" style="background-color: white">
				<div class="main" style="height:1400px;   ">
				 <iframe id="ifr"  src="${pageContext.request.contextPath }/user/main1" width="100%" height="100%" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>					
				</div>
			</div>
		</div>
		</div>
		
	   
	 
	
</body>
</html>