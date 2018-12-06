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
</style>
<script type="text/javascript">
   function cancel(){
		window.location.href='${pageContext.request.contextPath }/cla/showclass';
   }
  
</script>
</head>
<body >
  <% 
	Classes cla = (Classes)request.getAttribute("cla");

	%>
	
	<form action="${pageContext.request.contextPath }/cla/updateclass" method="post">
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    
    <ul class="forminfo">
    <li><label>班级编号</label><input name="classId" type="text" class="dfinput" value="${cla.classId}"/></li>
    <li><label>学生人数</label><input id="spinner" name="number" type="text"  value="${cla.number}"/></li>
    <li><label>班主任</label><input name="teacher" type="text" class="dfinput" value="${cla.teacher}"/></li>
    <li><label>所属专业</label><input name="major" type="text" class="dfinput" value="${cla.major}"/></li>
    <li class="click"><label>&nbsp;</label><input name="" type="submit" class="btn" style="width: 100px;height: 35px;font-size: 14px;font-weight: bold;color: #fff;
    cursor: pointer;   background-image: url('${pageContext.request.contextPath }/images/btnbg.png');  " value="确认"/>&nbsp;&nbsp;&nbsp;&nbsp;
   <label>&nbsp;</label><input name="" type="button" onclick="cancel()" class="btn" style="width: 100px;height: 35px;font-size: 14px;font-weight: bold;color: #fff;
    cursor: pointer;   background-image: url('${pageContext.request.contextPath }/images/btnbg.png');  " value="取消"/></li>
    </ul>
    </div>
   </form>
<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery-ui.js"></script>
<script >
$( "#spinner" ).spinner();
</script>
</body>

</html>