<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.wjl.graduate.pojo.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Shoppy Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- Custom Theme files -->
<link href="${pageContext.request.contextPath }/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<!--js-->
<script src="${pageContext.request.contextPath }/js/jquery-2.1.1.min.js"></script> 
<!--icons-css-->
<link href="${pageContext.request.contextPath }/css/font-awesome.css" rel="stylesheet"> 
<!--Google Fonts-->
<link href='https://fonts.googleapis.com/css?family=Carrois+Gothic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Work+Sans:400,500,600' rel='stylesheet' type='text/css'>
<!--//skycons-icons-->
</head>
<body>

<% 
Student student = (Student)request.getAttribute("student");
SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");   

%>

<!--inner block start here-->
<div class="inner-block" style="height:1200px;background-color: white;padding: 2em 2em 4em 2em;">
    <div class="inbox">
    	  <h2>资料卡片</h2>
    	 <div class="col-md-4 compose">   	 	
    	 	<div class="mail-profile">
    	 		<div class="mail-pic">
    	 			<a href="#"><img src="${pageContext.request.contextPath }/images/b3.png" alt=""></a>
    	 		</div>
    	 		<div class="mailer-name"> 			
    	 				<h5><a href="#">${student.name}</a></h5>  	 				
    	 			     <h6><a href="mailto:info@example.com">${student.email}</a></h6>   
    	 		</div>
    	 	    <div class="clearfix"> </div>
    	 	</div>
    	 	<div class="compose-block">
    	 		<a href="#tab4" data-toggle="tab">我要留言</a>
    	 	</div>
    	 	<div class="compose-bottom">
    	 		  <nav class="nav-sidebar">
					<ul class="nav tabs">
			          <li class="active"><a href="#tab1" data-toggle="tab"><i class="fa fa-inbox"></i>基本资料 </a></li>
			 	      <li class=""><a href="#tab2" data-toggle="tab"><i class="fa fa-star-o"></i>信息跟踪</a></li> 
			          <li class=""><a href="#tab3" data-toggle="tab"><i class="fa fa-envelope-o"></i>联系方式</a></li>
			         <!--  <li class=""><a href="#tab3" data-toggle="tab"><i class="fa fa-star-o"></i>Important</a></li> 
			          <li class=""><a href="#tab4" data-toggle="tab"><i class="fa fa-pencil-square-o"></i>Draft <span>6</span><div class="clearfix"></div></a></li>  
			          <li class=""><a href="#tab5" data-toggle="tab"><i class="fa fa-trash-o"></i>Delete</a></li>                               -->
					</ul>
				</nav>
    	 	</div>
    	 </div>
    	 <div class="col-md-8 mailbox-content  tab-content tab-content-in" style="height:348.367px;">
    	 	<div class="tab-pane active text-style" id="tab1">
	    	 	<div class="mailbox-border">
	               <div class="mail-toolbar clearfix">				   
	               </div>
	                <table class="table tab-border">
	                    <tbody>
	                        <tr class="unread checked">
	               
	                            <td class="hidden-xs">
	                                <i class="fa fa-star icon-state-warning"> </i>
	                            </td>
	                            <td class="hidden-xs">
	                                                                                      姓名
	                            </td>
	                            <td>
	                                ${student.name}
	                            </td>   
	                        </tr>
	                        <tr class="unread checked">
	               
	                            <td class="hidden-xs">
	                                <i class="fa fa-star icon-state-warning"> </i>
	                            </td>
	                            <td class="hidden-xs">
	                                                                                      性别
	                            </td>
	                            <td>
	                                ${student.sex}
	                            </td>   
	                        </tr>
	                    <tr class="unread checked">
	               
	                            <td class="hidden-xs">
	                                <i class="fa fa-star icon-state-warning"> </i>
	                            </td>
	                            <td class="hidden-xs">
	                                                                                 班级
	                            </td>
	                            <td>
	                                ${student.classid}
	                            </td>   
	                        </tr>
	                        <tr class="unread checked">
	               
	                            <td class="hidden-xs">
	                                <i class="fa fa-star icon-state-warning"> </i>
	                            </td>
	                            <td class="hidden-xs">
	                                                                                      出生日期
	                            </td>
	                            <td>
	                               <%=df.format(student.getBirthdate())%>
	                            </td>   
	                        </tr>
	                        <tr class="unread checked">
	               
	                            <td class="hidden-xs">
	                                <i class="fa fa-star icon-state-warning"> </i>
	                            </td>
	                            <td class="hidden-xs">
	                                                                                      籍贯
	                            </td>
	                            <td>
	                                ${student.birthplace}
	                            </td>   
	                        </tr>
	                         
	                    </tbody>
	                </table>
	               </div>   
               </div>
               <div class="tab-pane text-style" id="tab2">
	    	 	<div class="mailbox-border">
	               <div class="mail-toolbar clearfix">
	               </div>
	                <table class="table tab-border">
	                    <tbody>
	                        <tr class="unread checked">
	               
	                            <td class="hidden-xs">
	                                <i class="fa fa-star icon-state-warning"> </i>
	                            </td>
	                            <td class="hidden-xs">
	                                                                                   就业方向
	                            </td>
	                            <td>
	                                ${student.job_direction}
	                            </td>   
	                        </tr>
	                        <tr class="unread checked">
	               
	                            <td class="hidden-xs">
	                                <i class="fa fa-star icon-state-warning"> </i>
	                            </td>
	                            <td class="hidden-xs">
	                                                                                     就业地点
	                            </td>
	                            <td>
	                                ${student.job_place}
	                            </td>   
	                        </tr>
	                    <tr class="unread checked">
	               
	                            <td class="hidden-xs">
	                                <i class="fa fa-star icon-state-warning"> </i>
	                            </td>
	                            <td class="hidden-xs">
	                                                                           入职时间
	                            </td>
	                            <td>
	                                ${student.job_time}
	                            </td>   
	                        </tr>
	                    
	                    </tbody>
	                </table>
	               </div>   
               </div>
               <div class="tab-pane text-style" id="tab3">
	    	 	<div class="mailbox-border">
	               <div class="mail-toolbar clearfix">
				     
	               </div>
	                <table class="table tab-border">
	                    <tbody>
	                        <tr class="unread checked">
	               
	                            <td class="hidden-xs">
	                                <i class="fa fa-star icon-state-warning"> </i>
	                            </td>
	                            <td class="hidden-xs">
	                                                                                     联系电话
	                            </td>
	                            <td>
	                                ${student.phone}
	                            </td>   
	                        </tr>
	                       <tr class="unread checked">
	               
	                            <td class="hidden-xs">
	                                <i class="fa fa-star icon-state-warning"> </i>
	                            </td>
	                            <td class="hidden-xs">
	                                                                                     住址
	                            </td>
	                            <td>
	                                ${student.address}
	                            </td>   
	                        </tr>
	                    </tbody>
	                </table>
	               </div>   
               </div>
              
               <div class="tab-pane text-style" id="tab4">
	    	 	
						
						<div class="inbox-details-body">
							
							<form action="${pageContext.request.contextPath }/message/sendmessage?name=${student.name}" method="post">
								<input type="text"  value="${student.name}" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'To';}">								
								<textarea name="content" rows="6"  value="Message :" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Message';}">Message </textarea>
								
								<input type="submit" value="发送"  style="font-size: 0.9em; background-color: #68AE00;border: none;color: #fff;
                                padding: 0.8em 1.5em;margin-top: 1em;outline: none; line-height: inherit;margin-right: 10px;"> 
							</form>
						</div>
					</div>
				</div>
	               </div>   
               </div>
           

<!--inner block end here-->
<script src="${pageContext.request.contextPath }/js/bootstrap.js"> </script>
<!-- mother grid end here-->
</body>
</html>