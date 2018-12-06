<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.wjl.graduate.pojo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.wjl.graduate.pojo.Student"%>
<%@page import="com.wjl.graduate.pojo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath }/css/st.css" rel="stylesheet" type="text/css" media="all" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href='https://fonts.googleapis.com/css?family=Montserrat+Alternates' rel='stylesheet' type='text/css'>
<!-- -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/modal.css">
<script src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.min.js"></script>

<style type="text/css">
  ul.dishes_list li a {
    color: #555;
    font-size: 13px;
    display: block;
    padding: 5px 0 5px 20px;
    background: url(${pageContext.request.contextPath }/images/marker.png) no-repeat 0;
}
</style>
</head>
<body>
 <%
         List<Board> news = (List<Board>)request.getAttribute("news");
         List<Board> jobs = (List<Board>)request.getAttribute("jobs");
         List<Board> notices = (List<Board>)request.getAttribute("notices");
           SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
%>
					<div class="banner">
 						<img src="${pageContext.request.contextPath }/images/school.jpg" alt="" style="width:1141.27px;height: 500px;margin-bottom: 20px;"/>
					</div>
					<div class="section-top">
						<div class="col_1_of_3 span_1_of_3">
							<div class="title-img">
								<div class="title"><img src="${pageContext.request.contextPath }/images/book1.png" alt=""/></div>
									<div class="title-desc"><p>热点新闻</p></div>
									<div class="clear"></div> 
							</div>
							<ul class="dishes_list">
							        <%
                           if(news!=null && news.size()>0)
                           { 
                                  for(Board b:news)
                            {
                                    %>
               
                                   <li><a href="${pageContext.request.contextPath }/notice/bshowdetail?id=<%=b.getId()%>"><span><%=b.getTitle()%></span><em  style="font-size: 14px;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=df.format(b.getCreate_time()) %></em></a></li>
                               <%

             		 }
     			 }
    				%>
										<div class="clear"> </div>
									</ul>
							<a href="${pageContext.request.contextPath }/notice/bshowboard" class="btn btn-primary" style="margin-top: 20px;"><span>更多</span><img src="${pageContext.request.contextPath }/images/more_arrow.png" alt=""></a>
						</div>
						<div class="col_1_of_3 span_1_of_3">
							<div class="title-img1">
								<div class="title"><img src="${pageContext.request.contextPath }/images/cup.png" alt=""/></div>
									<div class="title-desc"><p>就业信息</p></div>
									<div class="clear"></div> 
							</div>					
							<ul class="dishes_list">
							        <%
                           if(jobs!=null && jobs.size()>0)
                           { 
                                  for(Board b:jobs)
                            {
                                    %>
               
                                   <li><a href="${pageContext.request.contextPath }/notice/bshowdetail?id=<%=b.getId()%>"><span><%=b.getTitle()%></span><em  style="font-size: 14px;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=df.format(b.getCreate_time()) %></em></a></li>
                               <%

             	        	 }
     			             }
    			                	%>
										<div class="clear"> </div>
									</ul>
									<a href="${pageContext.request.contextPath }/notice/showjob" class="btn btn-primary1" style="margin-top: 20px;"><span>更多</span><img src="${pageContext.request.contextPath }/images/more_arrow.png" alt=""></a>
						</div>
						<div class="col_1_of_3 span_1_of_3">
							<div class="title-img2">
								<div class="title"><img src="${pageContext.request.contextPath }/images/books.png" alt=""/></div>
								<div class="title-desc"><p>学院通知</p></div>
									<div class="clear"></div> 
							</div>
							<ul class="dishes_list">
							        <%
                           if(notices!=null && notices.size()>0)
                           { 
                                  for(Board b:notices)
                            {
                                    %>
               
                                   <li><a href="${pageContext.request.contextPath }/notice/bshowdetail?id=<%=b.getId()%>"><span><%=b.getTitle()%></span><em  style="font-size: 14px;" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=df.format(b.getCreate_time()) %></em></a></li>
                               <%

             	        	 }
     			             }
    			                	%>
										<div class="clear"> </div>
									</ul>
							<a href="${pageContext.request.contextPath }/notice/shownotice" class="btn btn-primary2" style="margin-top: 20px;"><span>更多</span><img src="${pageContext.request.contextPath }/images/more_arrow.png" alt=""></a>
						</div>
						<div class="clear"></div> 
						
						
						
						<div class="col_1_of_3 span_1_of_3" style="margin-top: 40px;">
					<h3>统计与分析</h3>
							<input type="hidden" value="${pageContext.request.contextPath }"  id="basePath">
     <div id="placechart" style="width:300px; height: 300px;float:left"></div>
     <script type="text/javascript">
    //初始化echarts
    var basePath = $("#basePath").val();
    console.log(basePath);
    //从数据库读取数据赋值给echarts
    function fuzhi(myChart){
        $.ajax({
            //contentType : "application/json",
            type : "post",
            url : basePath+"/count/classplacedemo",
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
                    
                    legend:{
                    	bottom: 10,
                        left: 'center',
                        data: data,
                    },
                    calculable : true,
                    series:[{
                        name:'访问量',
                        type:'pie',
                        radius:'50%',
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
<a href="${pageContext.request.contextPath }/count/classplace" class="btn btn-primary2" style="margin-top: 20px;"><span>更多</span><img src="${pageContext.request.contextPath }/images/more_arrow.png" alt=""></a>
			</div></div>	
						
		
		<div id="directionchart1" style="width:600px; height: 400px;margin-top: 50px;margin-right: 100px;float: right"></div>	
  <script type="text/javascript">
  var basePath = $("#basePath").val();
  console.log(basePath);
function loadOneColumn() {
  var myChart = echarts.init(document.getElementById('directionchart1'));
    // 显示标题，图例和空的坐标轴
    myChart.setOption({
        title: {
            text: '就业方向人数统计(折线图)'
        },
        tooltip: {},
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
                    },
                    color:'red'
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
        url: basePath+"/count/classdirectiondemo",//请求数据的地址
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
			</div>			 
				
</body>
</html>