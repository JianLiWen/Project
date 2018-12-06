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
</style>
</head>
<body>
<%
  HashMap<String, Integer> map=(HashMap<String, Integer>)request.getAttribute("map");
%>
<%
Integer total=(Integer)request.getAttribute("total");
%>
 
     <h1 style="text-align: center;font-size: 18px;">全校毕业生工作地点报表</h1>
<div class="wrapper" style="margin-top: 20px;">
        
            <div class="col-md-8 col-md-offset-2" >                  
                
                
                    <div class="toolbar">
                        <a id="alertBtn" class="btn btn-default"  href="${pageContext.request.contextPath}/count/exports1">导出</a>
                    </div>
                    <table id="fresh-table" class="table" style="width:1000px;">
                        <thead>
                            <th data-field="classId">工作地点</th>
                        	<th data-field="number" data-sortable="true">学生人数</th>
                        	<th data-field="teacher" data-sortable="true">总人数</th>
                        	<th data-field="major" data-sortable="true">比例</th>
                        </thead>
                        <tbody>
                              <%
                              if(map!=null)
                             {
                            	  for(Map.Entry<String, Integer> entry : map.entrySet()){
                     %>
                         
                                            <tr class="gradeX">
                                               <td style="text-align: center;"><%=entry.getKey() %></td>
                                                <td style=" text-align: center;"><%=entry.getValue() %></td>
                                                 <td style="text-align: center "><%=total %></td>
                                                  <td  style="text-align: center"><%=(float)(Math.round((float)entry.getValue()/total*100))/100 %></td>
                                            </tr>
                                             <%
           }
      }  
      else
      {
    %>
           <tr>
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
      

    	<div class="inner-block" style="height:1400px;background-color: white;padding: 2em 2em 4em 2em;">
    <div class="blank">
    
    	<div class="blankpage-main">
    	   <input type="hidden" value="${pageContext.request.contextPath }"  id="basePath">
     <div id="placechart" style="width:600px; height: 400px;margin-left: 70px;margin-left: 180px;"></div>
     <script type="text/javascript">
    //初始化echarts
    var basePath = $("#basePath").val();
    console.log(basePath);
    //从数据库读取数据赋值给echarts
    function fuzhi(myChart){
        $.ajax({
            //contentType : "application/json",
            type : "post",
            url : basePath+"/count/placedemo",
            dataType : "json",
            success : function(data) {
                //创建一个数组，用来装对象传给series.data，因为series.data里面不能直接鞋for循环
                console.log(data);
              console.log(typeof(data));
                myChart.setOption({
                    title:{
                    text:'各地人员统计'
                    },      
                    tooltip:{
                     trigger: 'item',
            
                     formatter:'{c}%',
                    },
                    toolbox: {
                        show : true,
                        feature : {
                            mark : {show: true},
                            dataView : {show: true, readOnly: false},
                            magicType : {
                                show: true,
                                type: ['pie', 'funnel']
                            },
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    legend:{
                    	bottom: 10,
                        left: 'center',
                        data: data,
                    },
                    calculable : true,
                    series:[{
                        name:'访问量',
                        type:'pie',
                        radius : '60%',
                      
                        data: data,
                        label: {
                            normal: {
                                show: false
                            },
                            emphasis: {
                                show: true
                            }
                        },
                        lableLine: {
                            normal: {
                                show: false
                            },
                            emphasis: {
                                show: true
                            }
                        },
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }]

                });

            }
        });
    }

    //初始化echarts实例
    var myChart = echarts.init(document.getElementById('placechart'));
   // chushihua(myChart);
    fuzhi(myChart);    
</script>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;综合分析：从图中，我们可以清晰地看到在${place}工作的毕业生数量最多，总计有${max }人,所占比例高达${scale }%。而${secondplace}则排名次之,
     共有${secondmax}人，所占比例为${secondscale}%。由此可见，${place}和${secondplace}是毕业生工作首选的最佳地点。
    </p>
	</div>
    	</div>
    	</div>
    	
    	<div class="inner-block" style="height:1400px;background-color: white;padding: 2em 2em 4em 2em;">
    <div class="blank">
    	
    	<div class="blankpage-main">
    	</div>
    	</div>
    	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-1.11.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bootstrap-table.js"></script>
    <script type="text/javascript">
        var $table = $('#fresh-table'),
            full_screen = true;
        $().ready(function(){
            $table.bootstrapTable({
                toolbar: ".toolbar", 
                showRefresh: false,
                search: true,
                showToggle: false,
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

        });

    </script>
</html>