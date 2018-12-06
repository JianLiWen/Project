<%@page import="java.util.ArrayList"%>
<%@page import="com.wjl.graduate.utils.PageBean"%>
<%@page import="com.wjl.graduate.pojo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.wjl.graduate.pojo.Student"%>
<%@page import="com.wjl.graduate.pojo.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

 <!-- 查询表 -->
 <link rel="icon" type="image/png" href="${pageContext.request.contextPath }/assets/img/favicon.ico">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
 <link href="${pageContext.request.contextPath }/assets/css/bootstrap.css" rel="stylesheet" />
 <link href="${pageContext.request.contextPath }/assets/css/fresh-bootstrap-table.css" rel="stylesheet" />
  <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
  <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'> 
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-1.11.2.min.js"></script>
 </head>
<body>
<% 
 List<Student> list = (List<Student>)request.getAttribute("students");
 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");    
%>

  <div class="typo-alerts"></div>
<c:set var="url" value="${pageContext.request.contextPath }/notice/bshowboard?type=1" />       
                 <div class="wrapper" style="margin-top: 30px;">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2" style="width:1000px;margin-left: 10px;">                  
                <div class="fresh-table full-color-red">
                <!--    Available colors for the full background: full-color-blue, full-color-azure, full-color-green, full-color-red, full-color-orange                  
                        Available colors only for the toolbar: toolbar-color-blue, toolbar-color-azure, toolbar-color-green, toolbar-color-red, toolbar-color-orange
                -->
                
                  
                    <table id="fresh-table" class="table" style="">
                        <thead>
                            
                        	<th data-field="name" data-sortable="true">姓名</th>
                        	<th data-field="birthdate" >出生日期</th>
                        	<th data-field="birthplace" data-sortable="true">籍贯</th>
                        	<th data-field="phone" >联系电话</th>
                        	<th data-field="email" >邮箱</th>
                        	<th data-field="job_direction" >就业方向</th>
                        	<th data-field="job_place" >工作地点</th>
                        	<th>个人主页</th>
                     
                        </thead>
                        <tbody style="font-size: 14px;">
                              <%
                   if(list!=null && list.size()>0)
                   { 
                        for(Student s:list)
                     {
                     %>
                                            <tr class="gradeX">
                                                <td style="width:100px; text-align: center;"><%=s.getName()%></td>                                                     <td style="width:100px; text-align: center;"><%=df.format(s.getBirthdate())%></td>
                                                    <td style="width:100px; text-align: center;"><%=s.getBirthplace() %></td>
                                                    <td style="width:100px ;text-align: center "><%=s.getPhone()%></td>
                                                <td style="width:100px ;text-align: center "><%=s.getEmail()==null?"未更新":s.getEmail()%></td>
                                                 <td style="width:100px ;text-align: center "><%=s.getJob_direction()==null?"未更新":s.getJob_direction()%></td>
                                                  <td style="width:100px ;text-align: center "><%=s.getJob_place()==null?"未更新":s.getJob_place()%></td>
                                                 <td><a href="${pageContext.request.contextPath }/student/person?id=<%=s.getId()%>" title="Like">进入</a></td>
                                                 
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
              <td>&nbsp;</td>
               <td>&nbsp;</td>
    </tr>
    <%
      }
    %>                                                                                                                                                    <!-- more data -->
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
	
		
</body>
 <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bootstrap-table.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
    <script type="text/javascript">
        var $table = $('#fresh-table'),
            $alertBtn = $('#alertBtn'),
            full_screen = false;
            
        $().ready(function(){
            $table.bootstrapTable({
                toolbar: ".toolbar", 
                showRefresh: true,
                search: true,
                
                showToggle: false,
                showColumns: true,
                pagination: true,
                striped: true,
                pageSize: 10,
                pageList: [10,25,50,100],
                
                formatShowingRows: function(pageFrom, pageTo, totalRows){
                    //do nothing here, we don't want to show the text "showing x of y from..." 
                },
                formatRecordsPerPage: function(pageNumber){
                    return pageNumber + " rows visible";
                },
                icons: {
                    refresh: 'fa fa-refresh',
                    toggle: 'fa fa-th-list',
                    columns: 'fa fa-columns',
                    detailOpen: 'fa fa-plus-circle',
                    detailClose: 'fa fa-minus-circle'
                }
            });

            $(window).resize(function () {
                $table.bootstrapTable('resetView');
            });
    
            $alertBtn.click(function () {
                alert("You pressed on Alert");
            });
            
        });
  
    </script>
    
</html>