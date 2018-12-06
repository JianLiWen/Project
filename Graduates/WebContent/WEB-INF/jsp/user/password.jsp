<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/styl.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>

<script type="text/javascript">

function check(name,reg,spanId,okInfo,errorInfo){
    var flag;
    var val = document.getElementsByName(name)[0].value;
    var oSpanNode = document.getElementById(spanId);
    if(reg.test(val)){
        oSpanNode.innerHTML = okInfo.fontcolor("green");
        flag = true;
    }else{
        oSpanNode.innerHTML = errorInfo.fontcolor("red");
        flag = false;
    }
    return flag;
}  
//校验密码
function checkPassword(){
    var reg = new RegExp("^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,12}$","i");
    check("pawd",reg,"passwordspan","","必须含英文字母和数字，长度为6~12位");
}

//校验确认密码
function checkRspassword(){
    var flag;
    //获取确认密码框里内容
    var rspassword = document.getElementsByName("repassword")[0].value;
    //获取密码框里内容
    var password = document.getElementsByName("pawd")[0].value;
    var oRepasswordSpan = document.getElementById("repasswordspan");
    if (rspassword == password) {
        oRepasswordSpan.innerHTML = "".fontcolor("green");
        flag = true;
    }
    else {
        oRepasswordSpan.innerHTML = "密码输入不一致".fontcolor("red");
        flag = false;
    }
    return flag;
}

</script>
</head>
<body style="background-color: white">
 <form class="am-form am-form-horizontal"  action="${pageContext.request.contextPath}/student/updatepawd" onsubmit="return check()">
                    <div class="formbody" style="margin-left: 300px;margin-top: 60px;">
                     <div style="margin-bottom: 10px;">
                                                    新密码 ： &nbsp; &nbsp;<input  name="pawd" type="password" id="newPwd" placeholder="由数字、字母组合" required="required" onblur="checkPassword()" class="dfinput">
                    <span id="passwordspan"></span><br/>
                     </div>
                     <div style="margin-bottom: 10px;">
                                                    确认密码：  <input name="repassword"  type="password" id="user-confirm-password" placeholder="请再次输入上面的密码" required="required" onblur="checkRspassword()"class="dfinput">
                     <span id="repasswordspan"></span><br/>
                    </div>
                 <input name="" type="submit" class="btn" style="width: 100px;height: 35px;font-size: 14px;font-weight: bold;color: #fff;
                 cursor: pointer;  margin-left:100px;  background-image: url('${pageContext.request.contextPath }/images/btnbg.png');  " value="确认"/>&nbsp;&nbsp;&nbsp;&nbsp;
                
                 </div>
                    </form>
</body>
</html>