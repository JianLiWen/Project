<%@page import="com.wjl.graduate.pojo.Profession"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加班级信息</title>
<link href="${pageContext.request.contextPath }/css/styl.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>

<style type="text/css">

body{
  background-color: 	#FFF8DC;
  
}
.select1 {
   
  
    cursor: pointer;
    height: 28px;
}
</style>
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
function cancel(){
	
	 window.location.href="${pageContext.request.contextPath }/cla/showclass";
}
</script>
</head>
<body>

    <%
	    List<Profession>  list = (List)request.getAttribute("professions");
        //System.out.print(list.size());
        //System.out.print(list.get(0).getId());
	%>
	
  <form action="${pageContext.request.contextPath }/cla/addclass" method="post">
    <div class="formbody">
    
    <div class="formtitle"><span>基本信息</span></div>
    
    <ul class="forminfo">
     <li><label>班级</label><input name="classId" type="text" class="dfinput" required="required"/></li>
    <li><label>学生人数</label><input name="number" type="text" class="dfinput" required="required"/></li>
    <li><label>班主任</label><input name="teacher" type="text"  class="dfinput" required="required"/></li>
    <li><label>所属专业</label>
    
     <select class="select1" name="major">
					  	<%
					  		if(list!=null&&list.size()>0){
					  			for(Profession pro:list){
					  				%>
					  					<option value="<%=pro.getName()%>"><%=pro.getName() %></option>
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
   </ul>
  
        <ul class="toolbar" style="margin-left: 60px;">
        <li class="click"><span><img src="${pageContext.request.contextPath }/images/t01.png" /></span>添加</li>
        <li  style="width:75px;text-align: center;margin-left: 20px" onclick="cancel()" >返回</li>
 
        </ul>
    
    </div>
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

</body>
</html>