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
 <script type="text/javascript">
    function  excel(){
    	window.location.href='${pageContext.request.contextPath }/student/ImportXls';

    }
 
 </script>
 
 
 <style type="text/css">

body{
  background-color:#FFF8DC;
}
. btn{
  width: 200px;height: 30px;background: #ccc;border: 1px solid #eee; border-radius: 15px;
  margin-left: 20px;
}
</style>
</head>
<body>
   <!-- 基本添加 -->
   <form action="${pageContext.request.contextPath}/student/ImportXls" method="post"
		enctype="multipart/form-data">
    <div class="formbody" style="height: 1000px;">  
				<div class="market-update-block clr-block-1" style="margin-right: 50em;margin-left: 10em;margin-top: 30px;">
					<div class="col-md-8 market-update-left">
				 		<h3>导入学生信息</h3>
				  <input class="btn" type="file" name="filename" />
					 <input  class="btn" type="submit"  value="确认" /> 
					</div>
					<div class="col-md-4 market-update-right">
						<i class="fa fa-file-text-o" > </i>
					</div>
				  <div class="clearfix"> </div>
				</div>
     <!-- 显示导入 -->
            
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