<%@page import="com.wjl.graduate.pojo.Board"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.wjl.graduate.pojo.Student"%>
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
<style type="text/css">

body{
  background-color: 	#FAFAD2;
}
</style>
<script type="text/javascript">
function cancel(){
	 console.log("wode ");
	 window.location.href="${pageContext.request.contextPath }/notice/showboard";
}
</script>
</head>
<body >
  <% 
	Board board = (Board)request.getAttribute("board");
   SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");   

	%>
	
	<form action="${pageContext.request.contextPath }/notice/updateboard" method="post">
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    
    <ul class="forminfo">
       <li><label>编号</label><input name="id" type="text" class="dfinput" value="${board.id}" readonly/></li>
       <li><label>标题</label><input name="title" type="text" class="dfinput" value="${board.title}"/></li>
       <li><label>发布者</label><input name="author" type="text" class="dfinput" value="${board.author}"/></li>
       <li><label>内容</label>
       <textarea name="content" style="width: 909px;height: 136px;" class="textinput" >${board.content}</textarea></li>
       <li><label>类型 </label>
       <input name="type" type="text" class="dfinput" value="<%=board.getType()%>"/></li>
    <li class="click"><label>&nbsp;</label><input name="" type="submit" class="btn" style="width: 137px;height: 35px;font-size: 14px;font-weight: bold;color: #fff;
    cursor: pointer;   background-image: url('${pageContext.request.contextPath }/images/btnbg.png');  " value="确认保存"/>
    <input type="button" class="btn" style="width: 100px;height: 35px;font-size: 14px;font-weight: bold;color: #fff;
    cursor: pointer; margin-left:10px;  background-image: url('${pageContext.request.contextPath }/images/btnbg.png');  " value="取消" onclick="cancel()"></li>
   
    </li>
    </ul>
    </div>
   </form>

</body>
</html>