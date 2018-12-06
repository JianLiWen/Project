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
 <link href="${pageContext.request.contextPath }/css/styl.css" rel="stylesheet" type="text/css" />

<link href="${pageContext.request.contextPath }/css/jquery-ui.css" rel="stylesheet">
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
 
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
 

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
<script type="text/javascript">
(function () {  
	getyear();  
})  ;
     function getyear(){
    	 var sid = $("#student_id").find('option:selected').val();  
    	 console.log(sid);
    	 $("#y").empty();     //清空二级目录   
    	 var year=$("#y"); 
    	 var basePath = $("#basePath").val();
    	 console.log(basePath);
    	 $.ajax({    
          type: "post",      
          url:basePath+"/count/timediff?id="+sid,  
          dataType:"json",  
          success: function (data) {  
        	  if(data.length!="" && data.length!=null){   
                  for ( var i = 0; i < data.length; i++) {  
                    year.append("<option value="+data[i].id+">"+data[i].year+"</option>");  
                  }  
             }else{  
          	   year.append("<option value="+year+">---无---</option>");  
            }  
             }     
          });   
     }

      function goback(){
    	  window.location.href="${pageContext.request.contextPath }/count/select";
      }
      
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
<body>
<%
  HashMap<String, Integer> map=(HashMap<String, Integer>)request.getAttribute("map");
HashMap<String, Integer> map1=(HashMap<String, Integer>)request.getAttribute("map1");
Integer total=(Integer)request.getAttribute("total");
Integer total2=(Integer)request.getAttribute("total2");
List<String> list = (List)session.getAttribute("types");
int timediff = (Integer)request.getAttribute("timediff");

%>

<input type="hidden" value="${year}"  id="year">
<input type="hidden" value="${student_id}"  id="sid">

<%--  <a id="button" style="margin-left: 100px;margin-bottom:20px;margin-top:20px"  href="${pageContext.request.contextPath }/count/select">返回</a>
 --%> <h1 style="font-size: 22px;font-weight: bold;text-align: center">${student_id }级毕业生毕业${year }年统计情况<a class="click" style="margin-left: 20px;font-size: 16px;cursor: pointer;">查询</a></h1>
     <div class="tip">
    	<div class="tiptop"><span>查询信息</span><a></a></div>
        
      <div class="tipinfo">
        <form action="${pageContext.request.contextPath }/count/yearplace" method="post">

<div style="margin-top: 30px;width:100%; position: relative;font-size: 16px;">
    请选择：
 <select  name="student_id" id="student_id" onChange="getyear()" style="width:60px;">
	<option>12</option>
	<option>13</option> 
	<option>11</option>
 </select>
级毕业生毕业
 <select  name="year" id="y" style="width:60px;">
	
 </select>
 年统计情况
 </div>

 <input type="hidden" value="${pageContext.request.contextPath }"  id="basePath">
        <div class="tipbtn">
        <input name="" type="submit"  class="sure" value="确定" />&nbsp;
        <input name="" type="button"  class="cancel" value="取消" />
        </div>
        </form>
        </div>
        
           
    </div>

<div id="tabs">
	<ul>
		<li><a href="#tabs-1">毕业地点</a></li>
		<li><a href="#tabs-2">毕业方向</a></li>
		<li><a href="#tabs-3">本专业</a></li>
	</ul>

	
	

<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery-ui.js"></script>

<script type="text/javascript">
$( "#button" ).button();
$( "#tabs" ).tabs();
</script>
<div id="tabs-1">
     <h1 style="text-align: center;font-size: 18px;margin-top: 50px;">工作地点报表</h1>
<div class="wrapper" style="margin-top: 20px;">
        
            <div class="col-md-8 col-md-offset-2" >                  
                
                
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
    var  year  = $("#year").val();
    var  sid  = $("#sid").val();
    console.log(basePath);
    //从数据库读取数据赋值给echarts
    function fuzhi(myChart){
        $.ajax({
            //contentType : "application/json",
            type : "post",
            url : basePath+"/count/yearplacedemo?year="+year+"&student_id="+sid,
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
                        radius: ['50%', '70%'],
                        avoidLabelOverlap: false,
                        label: {
                            normal: {
                                show: false,
                                position: 'center'
                            },
                            emphasis: {
                                show: true,
                                textStyle: {
                                    fontSize: '30',
                                    fontWeight: 'bold'
                                }
                            }
                        },
                        labelLine: {
                            normal: {
                                show: false
                            }
                        },
                        data: data,
                        
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
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;综合分析：从图中，我们可以清晰地看到${student_id }届毕业生毕业${num }年后在${place}工作的毕业生数量最多，总计有${max }人,所占比例高达${scale }%。而${secondplace}则排名次之,
     共有${secondmax}人，所占比例为${secondscale}%。由此可见，${place}和${secondplace}是大多数毕业生工作首选的地点。
    </p>
	</div>
    	</div>
    	</div>
    	</div>
    	<div id="tabs-2">
    	 <h1 style="text-align: center;font-size: 18px;margin-top: 50px;">工作方向报表</h1>
         <div class="wrapper" style="margin-top: 20px;">
        
            <div class="col-md-8 col-md-offset-2" >                  
                
                    <table id="fresh-table1" class="table" style="width:1000px;">
                        <thead>
                            <th data-field="classId">工作地点</th>
                        	<th data-field="number" data-sortable="true">学生人数</th>
                        	<th data-field="teacher" data-sortable="true">总人数</th>
                        	<th data-field="major" data-sortable="true">比例</th>
                        </thead>
                        <tbody>
                              <%
                              if(map1!=null)
                             {
                            	  for(Map.Entry<String, Integer> entry : map1.entrySet()){
                     %>
                         
		                  <tr class="gradeX">
		                   <td style="text-align: center;"><%=entry.getKey() %></td>
		                  <td style="text-align: center;"><%=entry.getValue() %></td>
		                  <td style="text-align: center;"><%=total2 %></td>
		                  <td style="text-align: center"><%=(float)(Math.round((float)entry.getValue()/total2*100))/100 %></td>
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
             <%-- <form action="${pageContext.request.contextPath }/count/direction1" method="post">
    <select id="selectmenu" name="type">
	   	<%
					  		if(list!=null&&list.size()>0){
					  			for(String type:list){
					  				%>
					  					<option value="<%=type%>" selected="selected" ><%=type %></a></option>
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
</form> --%>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-ui.js"></script>
    <script type="text/javascript">
    $( "#selectmenu" ).selectmenu();
    $( "#button" ).button();
    </script>
 <input type="hidden" value="${pageContext.request.contextPath }"  id="basePath">
     <div id="directionchart" style="width:600px; height: 400px;margin-top: 50px;margin-left: 180px;"></div>
  <script type="text/javascript">
  var basePath = $("#basePath").val();
  var  year  = $("#year").val();
  var  sid  = $("#sid").val();
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
        url: basePath+"/count/yeardirectiondemo?year="+year+"&student_id="+sid,//请求数据的地址
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
    <p>&nbsp;&nbsp;&nbsp;综合分析：从图中，我们可以清晰地看到在计算机领域从事${most}毕业生数量最多，总计有${dmax }人。而${seconddirection}则排名次之,
     共有${dsecond}人。由此可见，${most}和${seconddirection}是毕业生选择该领域就职的最佳选择。
    </p>
    </div></div></div>
    	
    	
    	</div>
    	<div id="tabs-3">
    	 <div id="majorchart" style="width:600px; height: 400px;margin-top: 30px;margin-left: 180px;"></div>
     <script type="text/javascript">
    //初始化echarts
    var basePath = $("#basePath").val();
    var  year  = $("#year").val();
    var  sid  = $("#sid").val();
    console.log(basePath);
    //从数据库读取数据赋值给echarts
    function fuzhi(myChart){
        $.ajax({
            //contentType : "application/json",
            type : "post",
            url : basePath+"/count/yearmajordemo?year="+year+"&student_id="+sid,
            dataType : "json",
            success : function(data) {
                //创建一个数组，用来装对象传给series.data，因为series.data里面不能直接鞋for循环
                console.log(data);
              console.log(typeof(data));
                myChart.setOption({
                    title:{
                    text:'  专业统计(有多少人毕业后从事本专业)'
                    },      
                    tooltip:{
                     trigger: 'item',
                     alwaysShowContent:true,  
                     backgroundColor:"transparent",            //标题背景色
                     formatter:'{c}%',
                    },
                    legend:{
                    	
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
                    series:[{
                        name:'访问量',
                        type:'pie', 
                        radius:'60%', 
                        data: data,
                        
                    }]

                });

            }
        });
    }

    //初始化echarts实例
    var myChart = echarts.init(document.getElementById('majorchart'));
   // chushihua(myChart);
    fuzhi(myChart);    
</script>
    <p>&nbsp;&nbsp;&nbsp;综合分析：从图中，我们可以清晰地看到有${yscale }%的毕业生毕业后从事本专业的工作，而有${nscale }%的毕业生选择了转行发展。
    </p>
    
    
    	
    	
    	
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
                showToggle: false,
                showColumns: false,
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
    <script type="text/javascript">
    
        var $table1 = $('#fresh-table1'),
            $alertBtn = $('#alertBtn'),
            full_screen = false;
            
        $().ready(function(){
            $table1.bootstrapTable({
                toolbar: ".toolbar", 
                showRefresh: false,
                search: true,
                showToggle: false,
                showColumns: false,
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
                 
                    toggle: 'fa fa-th-list',
                    columns: 'fa fa-columns',
                    detailOpen: 'fa fa-plus-circle',
                    detailClose: 'fa fa-minus-circle'
                }
            });
             $(window).resize(function () {
                $table1.bootstrapTable('resetView');
            });
    
            $alertBtn.click(function () {
                alert("You pressed on Alert");
            });
            
        });    
    </script>
</html>