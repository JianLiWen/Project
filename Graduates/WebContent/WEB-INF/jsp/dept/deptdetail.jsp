
<%@page import="com.wjl.graduate.pojo.Dept"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<title>系部详情</title>
			
		</head>
	<body style="background-color: #EED2EE;">
	<% 
	Dept dept = (Dept)request.getAttribute("dept");
	%>
	
		<div>
		<h1 style="text-align: center;"> <%=dept.getDept() %></h1>
			<p id="content" style="font-size: 20px; text-indent:2em;">
			
			  <%=dept.getDescription() %>
			</p>
		</div>
	</body>
</html>