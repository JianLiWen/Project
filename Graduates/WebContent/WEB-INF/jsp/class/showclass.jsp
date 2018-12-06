<%@page import="com.wjl.graduate.pojo.Classes"%>

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
	<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
	<title>Fresh Bootstrap Table by Creative Tim</title>

	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
    
    <link href="${pageContext.request.contextPath }/assets/css/bootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath }/assets/css/fresh-bootstrap-table.css" rel="stylesheet" />
     
    <!--     Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
</head>
<body style=" background-color:#FFF8DC">
<%
  List<Classes> list = (List<Classes>)request.getAttribute("classes");
%>
<div class="wrapper" style="margin-top: 100px;">
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-md-offset-2" style="width:1000px;margin-left: 3px;">                  
                <div class="fresh-table toolbar-color-orange">
                <!--    Available colors for the full background: full-color-blue, full-color-azure, full-color-green, full-color-red, full-color-orange                  
                        Available colors only for the toolbar: toolbar-color-blue, toolbar-color-azure, toolbar-color-green, toolbar-color-red, toolbar-color-orange
                -->
                
                    <div class="toolbar">
                    </div>
                    
                    <table id="fresh-table" class="table" style="">
                        <thead>
                            <th data-field="classId">班级</th>
                        	<th data-field="number" data-sortable="true">学生人数</th>
                        	<th data-field="teacher" data-sortable="true">班主任</th>
                        	<th data-field="major" data-sortable="true">专业</th>
                        	<th data-field="actions"  >操作</th>
                        </thead>
                        <tbody>
                              <%
                   if(list!=null && list.size()>0)
                   { 
                        for(Classes c:list)
                     {
                     %>
                                            <tr class="gradeX">
                                               <td style="text-align: center;"><%=c.getClassId() %></td>
                                                <td style=" text-align: center;"><%=c.getNumber() %></td>
                                                 <td style="text-align: center "><%=c.getTeacher() %></td>
                                                  <td  style="text-align: center"><%=c.getMajor()%></td>
                                               <td>
                                                <a rel="tooltip" title="Edit" class="table-action edit" href="${pageContext.request.contextPath }/cla/showall?id=<%=c.getClassId()%>" title="Edit"><img src="${pageContext.request.contextPath }/images/t02.png" width="18" height="18"/></a>
                                                <a rel="tooltip" title="Remove" class="table-action remove" href="javascript:void(0)" title="Remove"> <img src="${pageContext.request.contextPath }/images/t03.png" width="18" height="18"/> </a>
               
                                               
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