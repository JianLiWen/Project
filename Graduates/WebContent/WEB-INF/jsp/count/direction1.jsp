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
<link href="${pageContext.request.contextPath }/css/jquery-ui.css" rel="stylesheet" type="text/css" media="all">

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.1.min.js"></script>
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.min.js"></script>

	<link rel="icon" type="image/png" href="${pageContext.request.contextPath }/assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
	
	<title>Fresh Bootstrap Table by Creative Tim</title>

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
  List<String> list = (List)session.getAttribute("types");
  
%>
<%
Integer total=(Integer)request.getAttribute("total");
%>
  <h1 style="text-align: center;font-size: 18px;">全校就业方向工作地点报表</h1>
<div class="wrapper" style="margin-top: 20px;">       
 <div class="col-md-8 col-md-offset-2" > 
 
                 <div class="toolbar">
                     <a id="alertBtn" class="btn btn-default"  href="${pageContext.request.contextPath}/count/exports2">导出</a>
                    </div>
          <table id="fresh-table" class="table" style="">
                        <thead>
                            <th data-field="job_direction">就业方向</th>
                        	<th data-field="number" data-sortable="true">学生人数</th>
                        	<th data-field="total" data-sortable="true">总人数</th>
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
            <form action="${pageContext.request.contextPath }/count/direction1" method="post">
    <select id="selectmenu" name="type">
	   	<%
					  		if(list!=null&&list.size()>0){
					  			for(String type:list){
					  				%>
					  					<option value="<%=type%>" selected="selected"><%=type %></a></option>
					  				<%
					  			}
					  		}else{
					  			%>
					  				<option value="0">--请选择--</option>
					  			<%
					  		}
					  	
					  	%>
</select>
     <button id="button"> 确认</button>
</form>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-ui.js"></script>
    <script type="text/javascript">
    $( "#selectmenu" ).selectmenu();
    $( "#button" ).button();
    </script>
 <input type="hidden" value="${pageContext.request.contextPath }"  id="basePath">
     <div id="directionchart" style="width:600px; height: 400px;margin-top: 50px;"></div>
  <script type="text/javascript">
  var basePath = $("#basePath").val();
  console.log(basePath);
function loadOneColumn() {
  var myChart = echarts.init(document.getElementById('directionchart'));
    // 显示标题，图例和空的坐标轴
    myChart.setOption({
        title: {
            text: '就业方向人数统计'
        },
        tooltip: {},
        legend: {
            data: ['学生人数']
        },
        xAxis: {
            data: []
        },
        yAxis: {
            splitLine: { show: false },//去除网格线
            name: ''
        },
        series: [{
            barWidth: "30px",
            name: '学生人数',
            type: 'bar',
            itemStyle: {
                normal: {
                    label: {
                        show: true,
                        position: 'top',
                        textStyle: {
                            color: '#333'
                        }
                    }
                }
            },
            data: []
        }]
    });
 //  myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画
   var names = [];    //类别数组（实际用来盛放X轴坐标值）
    var nums = [];    //销量数组（实际用来盛放Y坐标值）

    $.ajax({
        type: "post",
        url: basePath+"/count/directiondemo1",//请求数据的地址
        dataType: "json",        //返回数据形式为json
        success: function (result) {
            //请求成功时执行该函数内容，result即为服务器返回的json对象
             
            $.each(result, function (index, item) {
            	  console.log(item);
            	names.push(item.name);    //挨个取出类别并填入类别数组                    
                nums.push(item.value);    //挨个取出销量并填入销量数组
             
            });
           //myChart.hideLoading();    //隐藏加载动画
            console.log(names);
            myChart.setOption({        //加载数据图表
                xAxis: {
                    data: names ,
                    axisLabel:{interval: 0} 
                     
                },
                series: [{
                    // 根据名字对应到相应的系列
                    name: '学生人数',  //显示在上部的标题
                    data: nums
                }]
            });
        },
        error: function (errorMsg) {
            //请求失败时执行该函数
            alert("图表请求数据失败!");
            myChart.hideLoading();
        }
    });
};
loadOneColumn();
    </script>
    <p>&nbsp;&nbsp;&nbsp;综合分析：从图中，我们可以清晰地看到在${type}领域从事${most}毕业生数量最多，总计有${dmax }人。而${seconddirection}则排名次之,
     共有${dsecond}人。由此可见，${most}和${seconddirection}是毕业生选择该领域就职的最佳选择。
    </p>
    </div></div></div>
       
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