<%@page import="com.wjl.graduate.pojo.Board"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.wjl.graduate.pojo.Classes"%>
<%@page import="com.wjl.graduate.pojo.Dept"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/styl.css" rel="stylesheet" type="text/css" /> 
<link href="${pageContext.request.contextPath }/css/jquery-ui.css" rel="stylesheet">
<style type="text/css">

body{
  background-color: 	#FAFAD2;
}
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
  margin-top: 20px;
  margin-left: 220px;
  margin-right: 220px;
  }
</style>
<script type="text/javascript">
   function cancel(){
		window.location.href='${pageContext.request.contextPath }/cla/showclass';
   }
  
</script>
</head>
<body >
<%
Board  board = (Board)request.getAttribute("board"); 
  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

%>
<div id="title"> <h>${board.title}</h></div>
 <div id="time">
    <%=df.format(board.getCreate_time()) %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${board.author}</div>
   
 <div id="content">
  ${board.content}
 </div>   
</body>

</html>