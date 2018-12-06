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
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
 <link href="${pageContext.request.contextPath }/css/bootstrap-datepicker.css" rel="stylesheet" type="text/css" />
 <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.js"></script> 
  <script src="${pageContext.request.contextPath }/js/bootstrap-datepicker.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>
<style type="text/css">

body{
  background-color: 	#FAFAD2;
}
</style>
<script type="text/javascript">
 function cancel(){
	 console.log("wode ");
	 window.location.href="${pageContext.request.contextPath }/student/showstudent";
 }
</script>
</head>
<body >
  <% 
	Student student = (Student)request.getAttribute("student");
   SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");   

	%>
	
	<form action="${pageContext.request.contextPath }/student/updatestudent" method="post">
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    
    <ul class="forminfo">
       <li><label>学号</label><input name="id" type="text" class="dfinput" value="${student.id}"/></li>
       <li><label>姓名</label><input name="name" type="text" class="dfinput" value="${student.name}"/></li>
       <li><label>性别</label><input name="sex" type="text" class="dfinput" value="${student.sex}"/></li>
       <li><label>班级</label><input name="classid" type="text" class="dfinput" value="${student.classid}"/></li>
       <li><label>毕业时间</label><input name="leave_time" type="text"  id="date" class="datepicker form-control" value="<%=df.format(student.getLeave_time())%>"/></li>
       <li><label>出生日期 </label><input name="birthdate" type="text" id="date" class="datepicker form-control" value="<%=df.format(student.getBirthdate())%>"/></li>
       <li><label>籍贯</label><input name="birthplace" type="text" class="dfinput" value="${student.birthplace}"/></li>
       <li><label>联系方式</label><input name="phone" type="text" class="dfinput" value="${student.phone}"/></li>   
    
    </ul>
    <ul class="toolbar" style="margin-left: 60px;">
        <li class="click"><span><img src="${pageContext.request.contextPath }/images/t02.png" /></span>修改</li>
        <li  style="width:75px;text-align: center;margin-left: 20px" onclick="cancel()" >返回</li>
 
        </ul>
    </div>
 
  <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="${pageContext.request.contextPath }/images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="submit"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>   
    </div>
      </form>
<script type="text/javascript">
$(function() {
	 $('.datepicker').datepicker({
    	 weekStart:1,
    	 color: 'red',
    	 format:"yyyy-mm-dd",
        changeYear: true,
        changeMonth: true
	 });
});

	</script>
</body>
</html>