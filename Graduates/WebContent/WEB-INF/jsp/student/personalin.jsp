<%@page import="com.wjl.graduate.pojo.Message"%>
<%@page import="com.wjl.graduate.pojo.History"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.wjl.graduate.pojo.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<script src="${pageContext.request.contextPath }/js/jquery.magnific-popup.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.popup-with-zoom-anim').magnificPopup({
		type: 'inline',
		fixedContentPos: false,
		fixedBgPos: true,
		overflowY: 'auto',
		closeBtnInside: true,
		preloader: false,
		midClick: true,
		removalDelay: 300,
		mainClass: 'my-mfp-zoom-in'
	});
																	
	});

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
//校验密码
function checkPassword(){
    var reg = new RegExp("^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,12}$","i");
    check("pawd",reg,"passwordspan","","必须含英文字母和数字，长度为6~12位");
}

//校验确认密码
function checkRspassword(){
    var flag;
    //获取确认密码框里内容
    var rspassword = document.getElementsByName("repassword")[0].value;
    //获取密码框里内容
    var password = document.getElementsByName("pawd")[0].value;
    var oRepasswordSpan = document.getElementById("repasswordspan");
    if (rspassword == password) {
        oRepasswordSpan.innerHTML = "".fontcolor("green");
        flag = true;
    }
    else {
        oRepasswordSpan.innerHTML = "密码输入不一致".fontcolor("red");
        flag = false;
    }
    return flag;
}

</script>
</head>
<body>
<% 
   Student student = (Student)request.getAttribute("student");
   SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
   String name = (String)session.getAttribute("name");
   List<History> list = (List<History>)request.getAttribute("historys");
   List<Message> list1 = (List<Message>)request.getAttribute("messages");


%>
<!--inner block start here-->
<div class="inner-block" style="height:1400px;background-color: white;padding: 2em 2em 4em 2em;">
     <div class="typography">
       <!--alerts-->
      <div class="typo-alerts">
	       <div class="page-header">
	        <h3>Basic</h3>
	    <a class="popup-with-zoom-anim" href="#small-dialog">   <button type="button" class="btn btn-1 btn-info">修改</button></a></h4>            
	        
	      </div>
	      <div class="col-sm-6 col-md-6 col-lg-6 mb-60">
            <div class="alert alert-success alert-dismissable">
                                   姓名：<input type="text" style="border:0px;background-color: transparent; " readonly name="name" value="${student.name}">                                     
             </div>
            <div class="alert alert-info alert-dismissable">
                                   性别 ：<input type="text" style="border:0px;background-color: transparent; " readonly name="sex" value="${student.sex}  ">  </div>
            <div class="alert alert-warning alert-dismissable">
                                   班级：<input type="text" style="border:0px;background-color: transparent; " readonly name="classid" value="${student.classid}  "> </div>
            <div class="alert alert-danger alert-dismissable">
                                  生日：<input type="text" style="border:0px;background-color: transparent; " readonly name="birthdate" value="<%=df.format(student.getBirthdate())%>  "> </div>
       <div class="alert alert-warning alert-dismissable">
                                   籍贯：<input type="text" style="border:0px;background-color: transparent; " readonly name="birthplace" value="${student.birthplace}  "> </div>
       
          </div>
          <div class="col-sm-6 col-md-6 col-lg-6 mb-60">
            <h4 class="text-blue title-border mb-30 bars">Contact
                   <a class="popup-with-zoom-anim" href="#small-dialog1">   <button type="button" class="btn btn-1 btn-info">我的消息</button></a></h4>            
            
            <div class="horizontal-tab">
              <ul class="nav nav-tabs">
                <li class="active"><a href="#tab1" data-toggle="tab" aria-expanded="true">联系方式</a></li>
                <li class=""><a href="#tab2" data-toggle="tab" aria-expanded="false">就职信息</a></li>
     
                <li class=""><a href="#tab4" data-toggle="tab" aria-expanded="false">修改密码</a></li>
              </ul>
              <div class="tab-content">
                <div class="tab-pane active" id="tab1">
                  <div class="row">
                    <div class="col-md-12">
                      <p>电话：<input type="text" style="border:0px;background-color: transparent; " readonly name="phone" value="${student.phone}  "></p>
                   <p>邮箱：<input type="text" style="border:0px;background-color: transparent; " readonly name="email" value="${student.email}  "></p> 
                   <p>住址：<input type="text" style="border:0px;background-color: transparent; " readonly name="address" value="${student.address}  "></p> 
                    </div>
                  </div>
                </div>
                <div class="tab-pane" id="tab2">
                  <div class="row">
                    <div class="col-md-12">
                      <p>就业方向：<input type="text" style="border:0px;background-color: transparent; " readonly name="job_direction" value="${student.job_direction}  "></p>
                   <p>就职公司：<input type="text" style="border:0px;background-color: transparent; " readonly name="job_company" value="${student.job_company}  "></p> 
                   <p>地点：<input type="text" style="border:0px;background-color: transparent; " readonly name="job_place" value="${student.job_place}  "></p> 
                   <p>就职时间：<input type="text" style="border:0px;background-color: transparent; " readonly name="job_time" value="<%=df.format(student.getJob_time())%>"></p> 
                   <p>是否为本专业：<input type="text" style="border:0px;background-color: transparent; " readonly name="ismajor" value="${student.ismajor}  "></p> 
                    </div>
                  </div>
                </div>
                <div class="tab-pane" id="tab3">
                  <div class="row">
                    <div class="col-md-12">
                      <p>              <img alt="" src="${pageContext.request.contextPath }/images/school.jpg" width="50" height="50" /> 
                      </p>
                    </div>
                  </div>
                </div>
                <div class="tab-pane" id="tab4">
                  <div class="row">
                    <div class="col-md-12" style="font-size: 14px;">
                  <form class="am-form am-form-horizontal"  action="${pageContext.request.contextPath}/student/updatepawd" onsubmit="return check()">
                     <div style="margin-bottom: 10px;">
                                                    新密码 ： &nbsp; &nbsp;<input  name="pawd" type="password" id="newPwd" placeholder="由数字、字母组合" required="required" onblur="checkPassword()">
                    <span id="passwordspan"></span><br/>
                     </div>
                     <div style="margin-bottom: 10px;">
                                                    确认密码：  <input name="repassword"  type="password" id="user-confirm-password" placeholder="请再次输入上面的密码" required="required" onblur="checkRspassword()">
                     <span id="repasswordspan"></span><br/>
                    </div>
                  <input type="submit" class="btn btn-1 btn-info" value="保存修改" id="pwd_btn" onclick="return checkRspassword()">
                    </form>
                    </div>
                  </div>
                </div>
                
              </div>
            </div>
          </div>
          <div class="clearfix"> </div>
      </div>
      <!--//alerts-->
        </div>
        <div class="typography" style="margin-top: 30px;">
       <!--alerts-->
     
               <div class="work-progres">
                            <div  style="margin-bottom: 20px;">
                                <h3>Work Experience</h3>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-hover">
                                  <thead>
                                    <tr>
                                      <th>#</th>
                                      <th>就业方向</th>
                                      <th>公司</th>                                   
                                      <th>地点</th>
                                      <th>入职时间</th>
                                      <th>是否为本专业</th>
                                  </tr>
                              </thead>
                              <tbody>
                               <%
                   if(list!=null && list.size()>0)
                   { 
                        for(History h:list)
                     {
                     %>
                                <tr>
                                  <td><%=h.getId() %></td>
                                  <td><%=h.getDirection() %></td>
                                  <td><%=h.getCompany() %></td>                                 
                                  <td><%=h.getPlace() %></td>
                                  <td><%=df.format(h.getTime())%><td>
                                  <td><%=h.getIsmajor()%></td>
                                </tr>
                               <%

           }
      }else
      {
    %>
           <tr>
     <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
            <td>&nbsp;</td>
             <td>&nbsp;</td>
    </tr>
    <%
      }
    %>                                           
                          </tbody>
                      </table>
                  </div>
             </div>
      </div>
          
          <div class="clearfix"> </div>
      </div>
      <!--//alerts-->
        </div>
   <div id="popup">
						 <div id="small-dialog"  class="mfp-hide" style="height:600px;">
								<div class="pop_up">
								 	<div class="payment-online-form-left">
										<form action="${pageContext.request.contextPath }/student/save" method="post">
											<h4><span class="shoppong-pay-1"> </span>基本信息</h4>
											<ul>
												<li><input class="text-box-dark" type="text" name="name" value="${student.name}" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = ' 姓名';}"></li>
												<li><input class="text-box-dark" type="text" name="sex" value="${student.sex}" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '性别';}"></li>
												</ul>
												<ul>
													<li><input class="text-box-dark" type="text" name="classid" value="${student.classid}" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '班级';}"></li>
													<li><input class="text-box-dark" type="text" name="birthdate" value="<%=df.format(student.getBirthdate())%>" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '生日';}"></li>
												</ul>
												<ul>
													<li><input class="text-box-dark" type="text"  name="birthplace" value="${student.birthplace}" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '籍贯';}"></li>
													<li><input class="text-box-dark" type="text"  name="phone" value="${student.phone}" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '电话';}"></li>
													
												</ul>
												<ul>
													<li><input class="text-box-dark" type="text" name="email" value="${student.email}" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '邮箱';}"></li>
													<li><input class="text-box-dark" type="text" name="address" value="${student.address}" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '地址';}"></li>
													
												</ul>
												<div class="clear"></div>
												<h4 class="paymenthead"><span class="payment"></span>就职信息</h4>
												<div class="clear"></div>										
												<ul>
													<li><input class="text-box-dark" type="text"  name="job_direction" value="${student.job_direction}" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '就业方向';}"></li>
													<li><input class="text-box-dark" type="text" name="job_company" value="${student.job_company}" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '公司';}"></li>
												
												</ul>
												<ul>
													<li><input class="text-box-light hasDatepicker" type="text" id="datepicker" name="job_place"value="${student.job_place}" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '地点';}"><em class="pay-date"> </em></li>
													<li><input class="text-box-dark" type="text" name="job_time" value="<%=df.format(student.getJob_time())%>" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '就职时间';}"></li>
												
												</ul>
												<ul>
													<li><input class="text-box-light hasDatepicker" type="text" id="datepicker" name="ismajor" value="${student.ismajor}" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '是否为本专业';}"><em class="pay-date"> </em></li>
												    <li></li>
												</ul>
												<ul class="payment-sendbtns">
													<li><button type="submit" class="btn btn-l btn-warning">确认</button></li>
												</ul>
												<div class="clear"></div>
											</form>
										</div>
						  			</div>
								</div>
								</div>
	<div id="popup" >
						 <div id="small-dialog1"  class="mfp-hide" style="height:600px;text-align: left;">
								   <%
                   if(list1!=null && list1.size()>0)
                   { 
                        for(Message m:list1)
                     {
                     %>
                   <div style="color:#26709A;float:left">
    	        	<img alt="" src="${pageContext.request.contextPath }/images/p1.png" width="40" height="40" />
    	          </div>
                     <div style="font-size: 16px;margin-left: 10px;"><span style="color:#26709A"><%=m.getSname() %></span>
    	             <br><span style="color: #9B9B9B;"><%=df.format(m.getReview_time()) %></span>
    	           </div>
    	                                   回复: <%=m.getReview() %><br>
    	                    <span style="font-size: 14px;color:#26709A"> <%=m.getAuthor() %></span>:<%=m.getContent() %>
                        <br><br>
                         <%
                         
                         }
                         }%>
								</div>
								
								</div>

<!--inner block end here-->

<script src="${pageContext.request.contextPath }/js/bootstrap.js"> </script>
<!-- mother grid end here-->
</body>
</html>