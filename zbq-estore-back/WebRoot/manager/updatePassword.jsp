<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%String path = request.getContextPath();
   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<html>
<head>
 <base href="<%=basePath%>">
<title>电子商城的后台</title>
 
  <script language="javascript">
function checkEmpty(form){
   for(i=0;i<form.length;i++){
     if(form.elements[i].value==""){
         alert("表单信息不能为空");
         return false;
     }
   }
   if(document.getElementById("oldPassword").value!=document.getElementById("oldPassword2").value){
        window.alert("您输入原来的密码不正确，请重新输入");
        return false;
   }
   if(document.getElementById("password").value!=document.getElementById("password2").value){
        window.alert("您两次输入的密码不一致，请重新输入");
        return false;
}
return true;
}
</script>
</head>
 

<body>
<jsp:include page="../top.jsp" flush="true"/>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="300"  valign="top"><jsp:include page="../left.jsp" flush="true" /></td>
    <td width="724" align="center" valign="top" bgcolor="#FFFFFF"> <br>
	
        <table width="723" height="25" border="0" cellpadding="0" cellspacing="0" background="image/bg_02.jpg">
          <tr>
            <td><div align="center"><strong>修改管理员密码</strong></div></td>
          </tr>
        </table>
        <br>
<form name="form" method="post" action="manager/updatePassword.action?manager.id=${manager.id }" onSubmit="return checkEmpty(form)">
       <input id = "oldPassword" name="oldPassword" type="hidden"  value="${manager.password }">
       <table width="60%"  border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#CCCCCC">
          <tr>
            <td width="29%" height="30"><div align="center">原密码</div></td>
            <td width="71%" bgcolor="#FFFFFF">&nbsp;
            <input id = "oldPassword2" name="oldPassword" type="password" size="30"></td>
          </tr>
          <tr>
            <td height="30"><div align="center">新密码</div></td>
            <td bgcolor="#FFFFFF">&nbsp;
            <input id = "password" name="manager.password" type="password" size="30"></td>
          </tr>
          <tr>
            <td height="30"><div align="center">再次输入新密码</div></td>
            <td bgcolor="#FFFFFF">&nbsp;
            <input  id = "password2" name="password2" type="password" size="30"></td>
          </tr>
        </table>
        <p>
        <input type="image" class="input1"  src="image/save.jpg" width="51" height="20">
&nbsp;&nbsp;
      <a href="javascript:void(0);" onClick="javascript:form.reset()"><img src="image/clear.gif"></a>
&nbsp;&nbsp;
      <a href="javascript:void(0);" onClick="javasrcipt:history.go(-1)"><img src="image/back.gif"></a>	
        </p>
</form>
</table>	
 
</body>
</html>
