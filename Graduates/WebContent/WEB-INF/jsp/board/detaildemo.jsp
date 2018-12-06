<%@page import="com.wjl.graduate.pojo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.wjl.graduate.pojo.Student"%>
<%@page import="com.wjl.graduate.pojo.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/default.min.css?t=227" />

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/st.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='https://fonts.googleapis.com/css?family=Montserrat+Alternates' rel='stylesheet' type='text/css'>
<!-- -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/modal.css">
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<style type="text/css">
  h {
    font-size: 25px;
    font-family: serif;
    
  }
  #title{
    text-align: center;
    margin-top: 30px;
  }
  #time{
     font-size: 16px;
     margin-top: 20px;
      text-align: center;
  }
  #content{
  text-indent:2em;
  font-size: 16px;
  line-height: 20pt;
 
  }
</style>
</head>
<body>
 <% 
   String name = (String)session.getAttribute("name");
      
  Board  board = (Board)request.getAttribute("board"); 
  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
%>
	<div class="banner">
 						<img src="${pageContext.request.contextPath }/images/school2.JPG" alt="" style="width:1141.27px;height: 500px;margin-bottom: 20px;"/>
					</div>
	<div class="com-container" style="font-size: 14px;">
        <div class="cms-g">
            <div class="am-hide-sm-only am-u-md-3 am-u-lg-3">
                <div class="com-nav-left">
                    <h1><em>新闻中心</em><i>NEWS</i></h1>
                    <ul>
                        <li class="on"><a href="${pageContext.request.contextPath }/notice/bshowboard">热点新闻</a></li>
                        <li><a href="${pageContext.request.contextPath }/notice/showjob">就业信息</a></li>
                        <li><a href="${pageContext.request.contextPath }/notice/shownotice">校内通知</a></li>
                    </ul>
                </div>
            </div>
            </div>
        </div>

			<div class="col-main">
				<div id="title"> <h>${board.title}</h></div>
 <div id="time"><%=df.format(board.getCreate_time()) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${board.author}</div>
 <div id="content">
  ${board.content}
 </div> 
			</div>

		﻿<footer style="margin-top:150px;">
    <div class="cms-g"">
        <div class="footer">
            <ul>
                <li><a href="#"><span>网站地图</span></a></li>
                <li><a href="#"><span>访问统计</span></a></li>
                <li><a href="#"><span>友情链接</span></a></li>
                <li><a href="#"><span>法律申明</span></a></li>
            </ul>
            <span style="color:#fff;"><a href="http://www.haothemes.com/" target="_blank" title="好主题">好主题</a>提供 - More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></span>
        </div>   </div>
</footer>
</body>
</html>