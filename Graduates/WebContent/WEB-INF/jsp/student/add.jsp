<%@page import="com.wjl.graduate.pojo.Classes"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加学生信息</title>
<link href="${pageContext.request.contextPath }/css/styl.css" rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">

<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" media="all"/>

<script src="${pageContext.request.contextPath }/js/jquery-2.1.1.min.js"></script> 

<link href="${pageContext.request.contextPath }/css/font-awesome.css" rel="stylesheet"> 
<!--Google Fonts-->
<link href='https://fonts.googleapis.com/css?family=Carrois+Gothic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Work+Sans:400,500,600' rel='stylesheet' type='text/css'>
<!-- Chartinator  -->
 <script src="${pageContext.request.contextPath }/js/chartinator.js" ></script>
 <script src="${pageContext.request.contextPath }/js/skycons.js"></script>
 <script src="${pageContext.request.contextPath }/js/bootstrap.js"> </script>
  
 <!--日期选择器  --> 
 <link href="${pageContext.request.contextPath }/css/bootstrap-datepicker.css" rel="stylesheet" type="text/css" />
 <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.js"></script> 
  <script src="${pageContext.request.contextPath }/js/bootstrap-datepicker.js"></script> 
 
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
 <style type="text/css">
body{
  background-color:	#FFF8DC;
}
</style>
<script type="text/javascript" charset="utf-8">
function check(name,reg,spanId,okInfo,errorInfo){
    var flag;
    var val = document.getElementsByName(name)[0].value;
    var oSpanNode = document.getElementById(spanId);
    if(reg.test(val)){
        oSpanNode.innerHTML = okInfo.fontcolor("green");
        flag = true;
    }else{
        oSpanNode.innerHTML = errorInfo.fontcolor("red");
        flag = false;
    }
    return flag;
}  
function checkphone(){
    var reg = new RegExp("^1[3|5|7|8|]\d{9}$","i");
    check("phone",reg,"phonespan","","长度必须是11位");
}
function cancel(){
	 console.log("wode ");
	 window.location.href="${pageContext.request.contextPath }/student/showstudent";
}
</script>
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
</head>
<body>
<%
   List<Classes> list = (List<Classes>)request.getAttribute("classes");
%>
   <!-- 基本添加 -->
   <form action="${pageContext.request.contextPath}/student/addstudent" method="post"
		enctype="multipart/form-data">
    <div class="formbody" style="height: 1000px;">  
    <div class="formtitle"><span>基本信息</span></div>  
    <ul class="forminfo">
       <li><label>学号</label><input name="id" type="text" class="dfinput" required="required"/></li>
       <li><label>姓名</label><input name="name" type="text" class="dfinput" required="required"/></li>
       <li><label>性别</label><input name="sex" type="radio" value="男" />男&nbsp;&nbsp;&nbsp;
          <input name="sex" type="radio" value="女"/>女
       </li>
       <li><label>班级</label>
       <select class=" form-control" name="classid">
					  	<%
					  		if(list!=null&&list.size()>0){
					  			for(Classes c:list){
					  				%>
					  					<option value="<%=c.getClassId()%>"><%=c.getClassId() %></option>
					  				<%
					  			}
					  		}else{
					  			%>
					  				<option value="0">--请选择--</option>
					  			<%
					  		}
					  	
					  	%>
								
					</select>
       
       </li>
       <li><label>毕业时间</label><input name="leave_time" type="text" id="date" class="datepicker form-control" required="required" /></li>
       <li><label>出生日期</label> <input name="birthdate" id="date" class="datepicker form-control" type="text" required="required"/>
       </li>
       <li><label>籍贯</label><input name="birthplace" type="text" class="dfinput" required="required"/></li>
       <li><label>联系方式</label><input name="phone" type="text" class="dfinput" onblur="checkphone()" required="required"/>
       <span id="phonespan"></span><br/>
       </li>        
      
    </ul>
        <ul class="toolbar" style="margin-left: 60px;">
        <li class="click"><span><img src="${pageContext.request.contextPath }/images/t01.png" /></span>添加</li>
        <li  style="width:75px;text-align: center;margin-left: 20px" onclick="cancel()" >返回</li>
 
        </ul>
        <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="${pageContext.request.contextPath }/images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认添加 ？</p>
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