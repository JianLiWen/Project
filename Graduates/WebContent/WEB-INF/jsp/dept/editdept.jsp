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
</head>
<body >
  <% 
	Dept dept = (Dept)request.getAttribute("dept");
	%>
	
	<form action="${pageContext.request.contextPath }/dept/updatedept" method="post">
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    
    <ul class="forminfo">
    <li><label>系部编号</label><input name="id" type="text" class="dfinput" value="${dept.id}" /></li>
    <li><label>系部名称</label><input name="dept" type="text" class="dfinput" value="${dept.dept}"/></li>
    <li><label>班级数量</label><input name="classcount" type="text" class="dfinput" value="${dept.classcount}"/></li>
    <li><label>系部描述</label><textarea name="description" rows="8" cols="150">${dept.description}</textarea></li>
    <li class="click"><label>&nbsp;</label><input name="" type="submit" class="btn" style="width: 137px;height: 35px;font-size: 14px;font-weight: bold;color: #fff;
    cursor: pointer;   background-image: url('${pageContext.request.contextPath }/images/btnbg.png');  " value="确认保存"/></li>
    </ul>
    </div>
   </form>

</body>
</html>