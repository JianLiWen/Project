<%@page import="java.util.ArrayList"%>
<%@page import="com.wjl.graduate.utils.PageBean"%>
<%@page import="com.wjl.graduate.pojo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.wjl.graduate.pojo.Student"%>
<%@page import="com.wjl.graduate.pojo.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
<style>
.page{
  margin-top:30px;
  text-align: center;
}
.page span
{
    padding:8px;
    
    background:#47a6e7;
    border-radius:6px;
    font-weight:900;
    color:#fff;
}
.page span:hover
{
     background:blue;
     cursor:pointer;
}
</style>



</head>
<body>
 <% 
   //List<Board>  list = (List<Board>)request.getAttribute("list");
 
 	PageBean  pagebean = (PageBean)request.getAttribute("pageBean");
 	
 	List<Board>  boardlist = new ArrayList<Board>();
 
 	boardlist = pagebean.getData();
 	
 	System.out.println("这里输出信息wenjianfjiasdjflasfdj");
 	System.out.println(pagebean.getPageSize());
 	System.out.println(pagebean.getCurPage());
 	
 	
 
   String name = (String)session.getAttribute("name");
   SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
%>

<c:set var="url" value="${pageContext.request.contextPath }/notice/shownotice?type=1" /> 


    
	
				<div class="banner">
 						<img src="${pageContext.request.contextPath }/images/school2.JPG" alt="" style="width:1141.27px;height: 500px;margin-bottom: 20px;"/>
					</div>
 <div class="com-container" style="font-size: 14px;">
        <div class="cms-g">
            <div class="am-hide-sm-only am-u-md-3 am-u-lg-3">
                <div class="com-nav-left">
                    <h1><em>新闻中心</em><i>NEWS</i></h1>
                    <ul>
                        <li ><a href="${pageContext.request.contextPath }/notice/bshowboard">热点新闻</a></li>
                        <li><a href="${pageContext.request.contextPath }/notice/showjob">就业信息</a></li>
                        <li class="on"><a href="${pageContext.request.contextPath }/notice/shownotice">校内通知</a></li>
                    </ul>
                </div>
            </div>
            <div class="am-u-sm-12 am-u-md-9 am-u-lg-9">
                <div class="com-nav-title">
                    <a href="#doc-oc-demo1" class="font am-show-sm-only" data-am-offcanvas>&#xe68b;</a>
                    <span>热点新闻</span>
                </div>
                 <div class="new-list" >
                 
                    <ul >
                 <%
                   if(boardlist!=null && boardlist.size()>0)
                   { 
                        for(Board b:boardlist)
                     {
                     %>
               
                        <li><a href="${pageContext.request.contextPath }/notice/bshowdetail?id=<%=b.getId()%>"><span><%=b.getTitle()%></span><em  style="font-size: 14px;" ><%=df.format(b.getCreate_time()) %></em></a></li>
                         <%

             		 }
     			 }
    				%>
                    </ul>
                </div>
                
                
        <div class="page" >
			<span>每页<%=pagebean.getPageSize()%>行</span>        <span>共<%=pagebean.getTotalPages()%>行</span>        <span>页数${pagebean.curPage}/${pagebean.totalPages}</span>
			
			<c:choose>
			<c:when test="${pagebean.curPage==1}"><span>首页</span> &nbsp;<span>上一页</span></c:when>
			<c:otherwise>
			<a href="${url}&page=1"><span>首页</span></a>
			<a href="${url}&page=${pagebean.curPage-1}"><span>上一页</span></a>
			</c:otherwise>
			</c:choose>
			
			<c:choose>
			<c:when test="${pagebean.curPage>=pagebean.totalPages}"><span>下一页</span>   <span>尾页</span></c:when>
			<c:otherwise>
			<a href="${url}&page=${pagebean.curPage+1}"><span>下一页</span></a>
			<a href="${url}&page=${pagebean.totalPages}"><span>尾页</span></a>
			</c:otherwise>
			</c:choose>
		</div>
              
            </div>
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