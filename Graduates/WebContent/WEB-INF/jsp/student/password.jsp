<%@page import="com.wjl.graduate.pojo.Student"%>
<%@page import="com.wjl.graduate.pojo.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- 个人信息 -->
<link href="${pageContext.request.contextPath }/css/amazeui.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/personal.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/css/stepstyle.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>

</head>

<body>
 <% 
   String name = (String)session.getAttribute("name");
%>

    
	
				    <div class="center">
			<div class="col-main">
				<div class="main-wrap">
                   <div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改密码</strong> / <small>Password</small></div>
					</div>
					<hr/>
					
					<form class="am-form am-form-horizontal"  action="${pageContext.request.contextPath}/user/updatepawd" onsubmit="return check()">
 					<div class="am-form-group" style="margin-top: 20px;" id="tip">
							<label for="user-old-password" class="am-form-label">原密码</label>
							<div class="am-form-content">
								<input name="oldPwd" type="password" id="oldPwd" placeholder="请输入原登录密码"  data-validate-length-range="5,12" required="required">
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-new-password" class="am-form-label">新密码</label>
							<div class="am-form-content">
								<input  name="newPwd" type="password" id="newPwd" placeholder="由数字、字母组合" required="required">
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-confirm-password" class="am-form-label">确认密码</label>
							<div class="am-form-content">
								<input id="newPwd2" name="newPwd2" type="password" id="user-confirm-password" placeholder="请再次输入上面的密码" required="required">
							</div>
						</div>
						<div class="info-btn">
							<input type="submit" class="am-btn am-btn-danger" value="保存修改" id="pwd_btn">
						</div>
               </form>
                   </div>
                   </div>
					
			<aside class="menu1">
				<ul>
					<li class="person active">
						<a style="display: block;overflow: hidden;text-decoration: none;line-height: 28px;color: #000;height: 28px;"    href="index.html"><i class="am-icon-user"></i>个人中心</a>
					</li>
					<li class="person">
						<p><i class="am-icon-newspaper-o"></i>个人资料</p>
						<ul>
							<li> <a href="${pageContext.request.contextPath }/student/beforeshowall" >个人信息</a></li>
							<li> <a href="${pageContext.request.contextPath }/user/password">修改密码</a></li>
						</ul>
					</li>
				</ul>
			</aside>
		</div>
</body>
</html>