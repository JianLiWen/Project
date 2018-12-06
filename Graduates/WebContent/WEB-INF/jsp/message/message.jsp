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
<style type="text/css">
  textarea
  {
    font-size: 12px;
    overflow: auto;
    height: 38px;
    margin: 1px;
    border-width: 1px;
    border-style: solid;
    width: 100%;
  }
  .textarea {
    box-shadow: 0 1px 2px rgba(0,0,0,.1) inset;
}
.textinput, .textarea {
    color: #444444;
    border-color: #DADADA;
    background-color: #FFFFFF;
    font-family: Arial;
}
.textinput:focus, .textarea:focus, .textinput_focus, .textarea_focus, .textinput:hover, .textarea:hover {
    border-color: #F5B93C;
    background-color: #FFFFFF;
}
.input
{
  background-color: #6C7D8E;
  color: #FFFFFF;
   font-size: 12px;
    font-family: Arial;
}
.cancel{
   color: #9B9B9B;
   text-decoration: none;
   cursor: pointer;
   font-size: 12px;
}
</style>

</head>
<body>
<%
   List<Message>  list = (List<Message>)request.getAttribute("messages");
   SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm"); 
%>
<div class="inner-block" style="height:1400px;background-color: white;padding: 2em 2em 4em 2em;">
    <div class="blank">
    	<h2>留言</h2>
    	<%
         if(list!=null && list.size()>0)
               { 
                 for(Message m:list)
                     {
                     %>
            <div class="blankpage-main">
            <div style="color:#26709A;font-size: 18px;">
              <img alt="" src="${pageContext.request.contextPath }/images/school.jpg" width="50" height="50" /> &nbsp;&nbsp;&nbsp;&nbsp;<%=m.getAuthor() %> 
            </div>
            <div style="margin-left: 70px;font-size: 16px;">
    		<p ><%=m.getContent() %> </p><br>
    	     <%=df.format(m.getCreate_time()) %>&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:;" style="color: #26709A" class="reply_btn"  id="reply_<%=m.getId()%>"  data-id="<%=m.getId()%>">回复</a>
    	    </div>
    	         
    	    <%
    	        if(m.getReview()!=null&&m.getReview()!="")
    	        {%>
    	        <div style="color:#26709A;margin-left: 70px;float:left">
    	        	<img alt="" src="${pageContext.request.contextPath }/images/p1.png" width="40" height="40" />
    	        </div>  
    	         <div style="font-size: 16px;margin-left: 10px;"><span style="color:#26709A">&nbsp;&nbsp;&nbsp;我</span>&nbsp;&nbsp;&nbsp;<%=m.getReview() %>
    	             <br><span style="color: #9B9B9B;">&nbsp;&nbsp;&nbsp;<%=df.format(m.getReview_time()) %></span>
    	       </div>
    	    
    	      <%  }
    	        else{
    	        	%>
    	        	<div></div>
    	       <%  }
    	    %>    
    	     </div>
                                             <%

           }
      }else
      {
    %>
      暂无留言
    <%
      }
    %>                       
    	
    </div>
</div>
  <script type="text/javascript">
     $(function(){
         //页面加载完毕后开始执行的事件
         $(".reply_btn").click(function(){
        	 var reply_id = $(this).attr("data-id");
        	 console.log(reply_id);
             $(".reply_textarea").remove();
             $(this).parent().append("<form action='${pageContext.request.contextPath }/message/review'  method='post'><div class='reply_textarea'><input type='hidden' id='test' name='rid'><textarea class='textarea' name='review' cols='40' rows='5'></textarea><br/><input class='input' type='submit' value='发表' /><a href='javascript:cancel();' class='cancel'>&nbsp;&nbsp;&nbsp;取消</a></div></form>");
             document.getElementById("test").value = reply_id;
         });
       
             
        
     });
     function  cancel()
     {

    	 console.log("取消");
    	 $(".reply_textarea").remove();

     }
 </script> 

<script src="${pageContext.request.contextPath }/js/bootstrap.js"> </script>
<!-- mother grid end here-->
</body>

	

</html>