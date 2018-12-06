<%@page import="java.text.SimpleDateFormat"%>
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
	
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/assets/images/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    
    <link href="${pageContext.request.contextPath }/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/assets/css/fresh-bootstrap-table.css" rel="stylesheet" />
     
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
	<link href="${pageContext.request.contextPath }/css/styl.css" rel="stylesheet" type="text/css" />

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
</script>

</head>
<body style="background: #FFF8DC;  ">
<%
  List<Student> list = (List<Student>)request.getAttribute("students");
  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");    
%>

<div class="wrapper" style="margin-top: 80px;">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2" style="width:1000px;margin-left: 3px;">                  
                <div class="fresh-table toolbar-color-blue">
                <!--    Available colors for the full background: full-color-blue, full-color-azure, full-color-green, full-color-red, full-color-orange                  
                        Available colors only for the toolbar: toolbar-color-blue, toolbar-color-azure, toolbar-color-green, toolbar-color-red, toolbar-color-orange
                -->
                
                    <div class="toolbar">
                    </div>
                    
                    <table id="fresh-table" class="table" style="">
                        <thead>
                            <th data-field="id">学号 </th>
                        	<th data-field="name" data-sortable="true">姓名</th>
                        	<th data-field="sex" >性别</th>
                        	<th data-field="classid" data-sortable="true">班级</th>
                        	<th data-field="leave_time" data-sortable="true">毕业时间</th>
                        	<th data-field="birthdate" >出生日期</th>
                        	<th data-field="birthplace" data-sortable="true">籍贯</th>
                        	<th data-field="phone" >联系方式</th>
                        	<th data-field="actions"  >操作</th>
                        </thead>
                        <tbody>
                              <%
                   if(list!=null && list.size()>0)
                   { 
                        for(Student s:list)
                     {
                     %>
                                            <tr class="gradeX">
                                               <td style="width:100px;text-align: center;"><%=s.getId() %></td>
                                                <td style="width:100px; text-align: center;"><%=s.getName() %></td>
                                                 <td style="width:100px; text-align: center;"><%=s.getSex()%></td>
                                                  <td style="width:100px; text-align: center;"><%=s.getClassid() %></td>
                                                   <td style="width:100px; text-align: center;"><%=df.format(s.getLeave_time()) %></td>
                                                     <td style="width:100px; text-align: center;"><%=df.format(s.getBirthdate())%></td>
                                                    <td style="width:100px; text-align: center;"><%=s.getBirthplace() %></td>
                                                    <td style="width:100px ;text-align: center "><%=s.getPhone()%></td>
                                               
                                               <td> 
<%--                                                 <a rel="tooltip" title="Remove" class="click" href="${pageContext.request.contextPath }/student/deletestudent?id=<%=s.getId()%>" title="Remove"> <i class="fa fa-remove"></i> </a>
 --%>               
                                                <a class="click" href="${pageContext.request.contextPath }/student/showall?id=<%=s.getId()%>"><img src="${pageContext.request.contextPath }/images/t02.png" width="18" height="18"/> </a>
                                                <a class="click" href="${pageContext.request.contextPath }/student/deletestudent?id=<%=s.getId()%>"><img src="${pageContext.request.contextPath }/images/t03.png" width="18" height="18"/> </a>
                                               
                                               </td>
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
    
    <div class="tip">
    	<div class="tiptop"><span>提示信息</span><a></a></div>
        
      <div class="tipinfo">
        <span><img src="images/ticon.png" /></span>
        <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
        </div>
        </div>
        
        <div class="tipbtn">
        <input name="" type="button"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>   
    </div>
</div>
</body>
 <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bootstrap-table.js"></script>
    <script type="text/javascript">
        var $table = $('#fresh-table'),
            $alertBtn = $('#alertBtn'),
            full_screen = false;
            
        $().ready(function(){
            $table.bootstrapTable({
                toolbar: ".toolbar", 
                showRefresh: false,
                search: true,
                showToggle: true,
                showColumns: true,
                pagination: true,
                striped: true,
                pageSize: 5,
                pageList: [5,10,25,50,100],
                
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
    
           /*  
            window.operateEvents = {
                'click .like': function (e, value, row, index) {
                    alert('You click like icon, row: ' + JSON.stringify(row));
                    console.log(value, row, index);
                },
                'click .edit': function () {
                	window.location.href='${pageContext.request.contextPath }/dept/showall?id='+id;
                },
                'click .remove': function (e, value, row, index) {
                    $table.bootstrapTable('remove', {
                        field: 'id',
                        values: [row.id]
                    });
            
                }
            };
             */
            $alertBtn.click(function () {
                alert("You pressed on Alert");
            });
            
        });
            
    
       /*  function operateFormatter(value, row, index) {
            return [
                '<a rel="tooltip" title="Like" class="table-action like" href="javascript:void(0)" title="Like">',
                    '<i class="fa fa-heart"></i>',
                '</a>',
                '<a rel="tooltip" title="Edit" class="table-action edit" href="${pageContext.request.contextPath }/dept/adddemo" title="Edit">',
                    '<i class="fa fa-edit"></i>',
                '</a>',
                '<a rel="tooltip" title="Remove" class="table-action remove" href="javascript:void(0)" title="Remove">',
                    '<i class="fa fa-remove"></i>',
                '</a>'
            ].join('');
        } */
    
            
    </script>
</html>