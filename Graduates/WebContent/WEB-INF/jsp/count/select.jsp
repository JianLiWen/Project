<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.wjl.graduate.pojo.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8" />
<link href="${pageContext.request.contextPath }/css/jquery-ui.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.1.min.js"></script>
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.min.js"></script>

	<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    
    <link href="${pageContext.request.contextPath }/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/assets/css/fresh-bootstrap-table.css" rel="stylesheet" />
     
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
<style type="text/css">
     .inner-block {
    padding: 8em 2em 4em 2em;
    background: #fafafa;
    margin-top: 300px;
}
.blank {
    min-height: 600px;
}
 .blankpage-main {
    padding: 2em 2em;
    background: #fff;
    margin-top:4em;
    box-shadow: 0px 0px 2px 1px rgba(0,0,0,0.15);
  }
 #id{
    
     width:50px;
     font-size: 22px;
     font-weight: bold;
  }
  #year{
    
     width:40px;
     font-size: 22px;
     font-weight: bold;
  }

</style>
<script type="text/javascript">
(function () {  
	getyear();  
})  ;
     function getyear(){
    	 var sid = $("#id").find('option:selected').val();  
    	 console.log(sid);
    	 $("#year").empty();     //清空二级目录   
    	 var year=$("#year"); 
    	 var basePath = $("#basePath").val();
    	 console.log(basePath);
    	 $.ajax({    
          type: "post",      
          url:basePath+"/count/timediff?id="+sid,  
          dataType:"json",  
          success: function (data) {     	
              if(data.length!="" && data.length!=null){   
                    for ( var i = 0; i < data.length; i++) {  
                      year.append("<option value="+data[i].id+">"+data[i].year+"</option>");  
                    }  
               }else{  
            	   year.append("<option value="+year+">---无---</option>");  
              }  
             }     
          });   
     }

</script>
</head>
<body>
<form action="${pageContext.request.contextPath }/count/yearplace" method="post">

<div style="margin-top: 30px;width:100%; position: relative;">
    <span style="font-size: 22px;font-weight: bold; margin-left: 400px;">请选择：</span>
 <select  name="student_id" id="id" onChange="getyear()">
	<option>12</option>
	<option>13</option>
	<option>11</option>
 </select>
<span style="font-size: 22px;font-weight: bold">级毕业生毕业</span>
 <select  name="year" id="year">
	
 </select>
  <span style="font-size: 22px;font-weight: bold">年统计情况</span>
 <input name="" type="submit" class="btn" style="width: 100px;height: 35px;font-size: 14px;font-weight: bold;color: #fff;
    cursor: pointer;   background-image: url('${pageContext.request.contextPath }/images/btnbg.png');  " value="查询"/>
  
 </div>
</form>
 <input type="hidden" value="${pageContext.request.contextPath }"  id="basePath">
</body>

</html>