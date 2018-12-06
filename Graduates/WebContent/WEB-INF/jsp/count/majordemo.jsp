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
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-2.1.1.min.js"></script>
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/echarts.min.js"></script>
<style type="text/css">
  p{
    font-size: 20px;
    font-family: cursive;
  }
</style>
</head>
<body>

 <input type="hidden" value="${pageContext.request.contextPath }"  id="basePath">
     <div id="majorchart" style="width:600px; height: 400px;margin-top: 30px;margin-left: 180px;"></div>
     <script type="text/javascript">
    //初始化echarts
    var basePath = $("#basePath").val();
    console.log(basePath);
    //从数据库读取数据赋值给echarts
    function fuzhi(myChart){
        $.ajax({
            //contentType : "application/json",
            type : "post",
            url : basePath+"/count/majordemo",
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
    <p>&nbsp;&nbsp;&nbsp;综合分析：从图中，我们可以清晰地看到目前有${yscale }%的毕业生毕业后从事本专业的工作，而有${nscale }%的毕业生选择了转行发展。
    </p>
    
    
    
</body>
</html>