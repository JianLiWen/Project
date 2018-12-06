<%@page import="com.wjl.graduate.pojo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.wjl.graduate.pojo.Student"%>
<%@page import="com.wjl.graduate.pojo.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath }/css/jquery-ui.css" rel="stylesheet" type="text/css" media="all">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.1.min.js"></script>
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
<style type="text/css">
  p{
    font-size: 20px;
    font-family: cursive;
  }
</style>
<script type="text/javascript">

</script>
</head>
<body>
<%
     List<String> list = (List)session.getAttribute("types");

%>
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
    
    
</body>
</html>