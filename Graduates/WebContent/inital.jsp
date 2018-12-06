<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<!--日期选择器  --> 
 <link href="${pageContext.request.contextPath }/css/bootstrap-datepicker.css" rel="stylesheet" type="text/css" />
 <script src="${pageContext.request.contextPath }/js/jquery-1.10.2.js"></script> 
  <script src="${pageContext.request.contextPath }/js/bootstrap-datepicker.js"></script> 
	
 <link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
 
  <script src="${pageContext.request.contextPath }/js/bootstrap.js"> </script>

	<link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath }/assets1/images/apple-icon.png">
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/assets1/images/favicon.png">
	 <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

	<!--     Fonts and icons     -->
    <link href="http://netdna.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.css" rel="stylesheet">

	 <!-- CSS Files -->
    <link href="${pageContext.request.contextPath }/assets1/css/bootstrap.min.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath }/assets1/css/gsdk-bootstrap-wizard.css" rel="stylesheet" />

	<!-- CSS Just for demo purpose, don't include it in your project -->
	<link href="${pageContext.request.contextPath }/assets1/css/demo.css" rel="stylesheet" />


</head>
<body>
<%
  List<String> list = (List<String>)request.getAttribute("directions");
List<String> places = (List<String>)request.getAttribute("place");

%>
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
//校验邮箱
function checkMail(){
    var reg = new RegExp("^\\w+@\\w+(\\.\\w{2,3})*\\.\\w{2,3}$");
    check("email",reg,"mailspan","格式正确","邮箱格式错误");
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
  <div class="image-container set-full-height" style="background-image: url('assets1/images/wizard-boat.jpg')">

    <!--   Big container   -->
    <div class="container">
        <div class="row">
        <div class="col-sm-8 col-sm-offset-2">

            <!--      Wizard container        -->
            <div class="wizard-container">
                <div class="card wizard-card" data-color="azzure" id="wizard">
                    <form action="${pageContext.request.contextPath }/student/inital?id=${id}&name=${name}" method=post>
                <!--        You can switch ' data-color="azzure" '  with one of the next bright colors: "blue", "green", "orange", "red"          -->

                    	<div class="wizard-header">
                        	<h3>
                        	   <b>欢迎你,${name},请完善</b> 你的个人信息 <br>
                        	   <small>这些信息会便于你的同学更好地了解你</small>
                        	</h3>
                    	</div>
						<div class="wizard-navigation">
							<ul>
	                            <li><a href="#details" data-toggle="tab">基本信息</a></li>
	                            <li><a href="#contact" data-toggle="tab">联系方式</a></li>
	                        	<li><a href="#password" data-toggle="tab">修改密码</a></li>
	                        
	                        </ul>
						</div>
                        <div class="tab-content">
                            <div class="tab-pane" id="details">
                              <div class="row">
                                  <div class="col-sm-12">
                                    <h4 class="info-text"> 让我们开始完善基本信息</h4>
                                  </div>
                                  <div class="col-sm-5 col-sm-offset-1">
                                      <div class="form-group">
                                        <label>您从事的就业方向是什么？</label>
                                    <select class="form-control" name="job_direction">
					  	      <%
					  		      if(list!=null&&list.size()>0){
					  			  for(String direction:list){
					  				 %>
					  					<option value="<%=direction%>"><%=direction %></option>
					  				<%
					  			}
					  		   }else{
					  			%>
					  				<option value="0">--请选择--</option>
					  			<%
					  		  }
					  	           %>
								
					             </select>
                                      </div>
                                  </div>
                                  <div class="col-sm-5">
                                     <div class="form-group">
                                        <label>您目前工作所在地是？</label>
                                        <select class="form-control" name="job_place">
					  	      <%
					  		      if(places!=null&&places.size()>0){
					  			  for(String place:places){
					  				 %>
					  					<option value="<%=place%>"><%=place %></option>
					  				<%
					  			}
					  		   }else{
					  			%>
					  				<option value="0">--请选择--</option>
					  			<%
					  		  }
					  	
					  	           %>
								
					             </select>
                                      </div>
                                  </div>
                                  <div class="col-sm-5 col-sm-offset-1">
                                      <div class="form-group">
                                        <label>您就业的公司是？</label>
                                        <input name="job_company" type="text" class="form-control"  placeholder="company">
                                      </div>
                                  </div>
                                  <div class="col-sm-5">
                                  <div class="form-group">
                                    <label>您从事该职业的时间为？</label>
                                   <input name="job_time" id="date" class="datepicker form-control" type="text" required/>
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
                                      </div>
                                  </div>
                                  <div class="col-sm-5 col-sm-offset-1">
                                      <div class="form-group">
                                        <label>是否从事本专业？</label>
                            <select class="form-control" name="ismajor">
					  				<option value="是">是</option>
					  				<option value="否">否</option>
					             </select>                                      </div>
                                  </div>
                              </div>
                            </div>
                            <div class="tab-pane" id="contact">
                                <h4 class="info-text">请完善您的联系方式吧！ </h4>
                                <div class="row">
                                    <div class="col-sm-5 col-sm-offset-1">
                                      <div class="form-group">
                                        <label>邮箱：</label>
                                        <input name="email" type="text" class="form-control" id="exampleInputEmail1" placeholder="email" onblur="checkMail()">
                                        <span id="mailspan"></span><br/>
                                      </div>
                                  </div>
                                  <div class="col-sm-5 col-sm-offset-1">
                                      <div class="form-group">
                                        <label>联系地址：</label>
                                        <input name="address" type="text" class="form-control" placeholder="address">
                                      </div>
                                  </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="password">
                                <div class="row">
                                     <div class="col-sm-5 col-sm-offset-1">
                                      <div class="form-group">
                                        <label>密码：</label>
                                        <input  name="pawd" type="password" class="form-control" id="password" required="required"  onblur="checkPassword()">
                                        <span id="passwordspan"></span><br/>
                                      </div>
                                  </div>
                                  <div class="col-sm-5 col-sm-offset-1">
                                      <div class="form-group">
                                        <label>确认密码：</label>
                                        <input  id="repassword" name="repassword" type="password" class="form-control" id="repassword" required="required" onblur="checkRspassword()">
                                       <span id="repasswordspan"></span><br/>
                                      </div>
                                  </div>
                                </div>
                            </div>
                        </div>
                        <div class="wizard-footer">
                            	<div class="pull-right">
                                    <input type='button'  class='btn btn-next btn-fill btn-info btn-wd btn-sm' name='next' value='Next' onclick="return checkMail()" />
                                    <input type='submit' class='btn btn-finish btn-fill btn-info btn-wd btn-sm' name='finish' value='Finish' onclick="return checkRspassword()" />
                                </div>
                                <div class="pull-left">
                                    <input type='button' class='btn btn-previous btn-fill btn-default btn-wd btn-sm' name='previous' value='Previous' />
                                </div>
                                <div class="clearfix"></div>
                        </div>
                    </form>
                </div>
            </div> <!-- wizard container -->
        </div>
        </div> <!-- row -->
    </div> <!--  big container -->
</div> 
   
</body>
<!--   Core JS Files   -->
<%--     <script src="${pageContext.request.contextPath }/assets1/js/jquery-2.2.4.min.js" type="text/javascript"></script>
 --%>	<script src="${pageContext.request.contextPath }/assets1/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath }/assets1/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>

	<!--  Plugin for the Wizard -->
	<script src="${pageContext.request.contextPath }/assets1/js/gsdk-bootstrap-wizard.js"></script>

	<!--  More information about jquery.validate here: http://jqueryvalidation.org/	 -->
	<script src="${pageContext.request.contextPath }/assets1/js/jquery.validate.min.js"></script>

</html>