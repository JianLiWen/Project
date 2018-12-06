<%@page import="com.wjl.graduate.pojo.Message"%>
<%@page import="java.util.List"%>
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
  <script src="http://cdn.bootcss.com/jquery/2.2.4/jquery.js"></script>

</head>
<body>
<%
   List<Message>  list = (List<Message>)request.getAttribute("messages");
   SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm"); 
%>
<div class="banner-box">
		<div class="wrap">
			<div class="main-top">
				<div class="main">
			    <div class="section group">
				<div class="col span_2_of_3">
				  <div class="contact-form">
				  	<h3>Contact Us</h3>
					    <form method="post" action="contact-post.html">
					    	<div>
						    	<span><label>Name</label></span>
						    	<span><input name="userName" type="text" class="textbox"></span>
						    </div>
						    <div>
						    	<span><label>E-Mail</label></span>
						    	<span><input name="userEmail" type="text" class="textbox"></span>
						    </div>
						  
						    <div>
						    	<span><label>Subject</label></span>
						    	<span><textarea name="userMsg"> </textarea></span>
						    </div>
						   <div>
						   		<span><input type="submit" value="Submit"></span>
						  </div>
					    </form>
				  </div>
  				</div>
				<div class="col span_1_of_3">
					
      			<div class="company_address">
				     	<h3>Address</h3>
						    	<p>500 Lorem Ipsum Dolor Sit,</p>
						   		<p>22-56-2-9 Sit Amet, Lorem,</p>
						   		<p>USA</p>
				   		<p>Phone:(00) 222 666 444</p>
				   		<p>Fax: (000) 000 00 00 0</p>
				 	 	<p>Email: <span>info[at]mycompany.com</span></p>
				   		<p>Follow on: <span>Facebook</span>, <span>Twitter</span></p>
				   </div>
				 </div>
				 <div class="clear"></div> 
			  </div>
			  <div class="map">
							   	    <iframe width="100%" height="175" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.co.in/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265&amp;output=embed"></iframe><br><small><a href="https://maps.google.co.in/maps?f=q&amp;source=embed&amp;hl=en&amp;geocode=&amp;q=Lighthouse+Point,+FL,+United+States&amp;aq=4&amp;oq=light&amp;sll=26.275636,-80.087265&amp;sspn=0.04941,0.104628&amp;ie=UTF8&amp;hq=&amp;hnear=Lighthouse+Point,+Broward,+Florida,+United+States&amp;t=m&amp;z=14&amp;ll=26.275636,-80.087265" style="color:#666;text-align:left;font-size:12px">View Larger Map</a></small>
							  </div>
				</div>
			</div>
		</div>
		<div class="main-bottom">
			<div class="wrap">
			<div class="content-bottom">
				<div class="col_1_of_3 span_1_of_3">
					<h3>Welcome to our Centre!</h3>
					<p class="desc2"><strong>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt.</strong></p>
					<p class="desc1">Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequ.</p>
					<p class="desc1">Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut conse ctetur adipisicing elit, sed do eiusmod conse ctetur adipisicing elit, sed do eiusmod</p>
					<a href="#" class="btn btn-primary"><span>Read more</span><img src="images/more_arrow.png" alt=""></a>
				</div>
				<div class="col_1_of_3 span_1_of_3">
					<h3>Teaching Support</h3>
					<ul class="dishes_list">
										<li><a href="#">Consectetur adipisicing elit</a></li>
										<li><a href="#">Sed do eiusmod tempor incididunt</a></li>
										<li><a href="#">Labore et dolore magna aliqua.</a></li>
										<li><a href="#">Sed do eiusmod tempor Dolore</a></li>
										<li><a href="#">Abore et dolore magna Dolore elit</a></li>
										<li><a href="#">Incididunt ut labore et dolore</a></li>
										<li><a href="#">Incididunt ut labore et dolore</a></li>
										<li class="last"><a href="#">Adipisicing elit, sed do eiusmod</a></li>
										<div class="clear"> </div>
									</ul>
									<a href="#" class="btn btn-primary1"><span>Read more</span><img src="images/more_arrow.png" alt=""></a>
				</div>
				<div class="col_1_of_3 span_1_of_3">
					<h3>Latest News</h3>
								<div class="latest-news-grid">
									<div class="latest-news-pic">
										<img src="images/pic.jpg" title="imag-name">
									</div>
									<div class="latest-news-info">
										<a href="#">Jan 21.01.2016</a>
										<p class="desc1">Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor</p>
									</div>
									<div class="clear"> </div>
								</div>
								<div class="latest-news-grid">
									<div class="latest-news-pic">
										<img src="images/pic1.jpg" title="imag-name">
									</div>
									<div class="latest-news-info">
										<a href="#">Jan 21.01.2016</a>
										<p class="desc1">Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor</p>
									</div>
									<div class="clear"> </div>
								</div>
								<div class="latest-news-grid">
									<div class="latest-news-pic">
										<img src="images/pic2.jpg" title="imag-name">
									</div>
									<div class="latest-news-info">
										<a href="#">Jan 21.01.2016</a>
										<p class="desc1">Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor</p>
									</div>
									<div class="clear"> </div>
								</div>
								<div class="latest-news-grid">
									<div class="latest-news-pic">
										<img src="images/pic3.jpg" title="imag-name">
									</div>
									<div class="latest-news-info">
										<a href="#">Jan 21.01.2016</a>
										<p class="desc1">Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor</p>
									</div>
									<div class="clear"> </div>
								</div>
					<a href="#" class="btn btn-primary2"><span>Read more</span><img src="images/more_arrow.png" alt=""></a>
				</div>
				<div class="clear"></div> 
			</div>
			</div>
		</div>
	    <div class="wrap">
		   <div class="copy-right">
				<p>Copyright &copy; 2016.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
			</div>
		</div>
	</div>
</body>

	

</html>