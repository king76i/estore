<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showAllMainCategorys.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  <script>
 function checkEmpty(form){
	 for(var i = 0;i < form.length;i++){
  	   if(form.elements[i].value == ""){
  		   alert("表单信息不能为空");
  		   return false;
  	   }    	 
     }
     return true;
 } 
 
 </script>
</head> 
 
<body>
     <c:if test="${!empty result }">
     	<script>
     		alert('${result}');
     	</script>
     </c:if>
<jsp:include page="../top.jsp" flush="true"/>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="300"  valign="top"><jsp:include page="../left.jsp" flush="true" /></td>
    <td width="724" align="center" valign="top" bgcolor="#FFFFFF"> <br>
	
        <table width="723" height="25" border="0" cellpadding="0" cellspacing="0" background="image/bg_02.jpg">
          <tr>
            <td><div align="center"><strong>修改大类别信息</strong></div></td>
          </tr>
        </table>
        <br>		 
		 <form name="form" method="post" action="mainCategory/updateMainCategory.action" onsubmit="return checkEmpty(form)">
		 <input name="category.id" type="hidden"  value="${param.mainCategoryId }">
		 <table width="58%"  border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#CCCCCC">
		 
          <tr>
            <td width="23%" height="30"><div align="center">大类别名</div></td>
            <td width="77%" bgcolor="#FFFFFF">&nbsp;
            <input name="category.name" type="text" size="35" value="${param.mainCategoryName}"></td>
            
          </tr>
          <!-- <tr>
            <td height="30"><div align="center">创建时间</div></td>
            <td bgcolor="#FFFFFF">&nbsp;
            <input name="category.createTime " type="text" size="35"></td>
          </tr> -->
          
        </table>
		<br>  
      <input type="image" class="input1"  src="image/save.jpg" width="51" height="20">
&nbsp;&nbsp;
      <a href="javascript:void(0);" onClick="javascript:form.reset()"><img src="image/clear.gif"></a>
&nbsp;&nbsp;
      <a href="javascript:void(0);" onClick="javasrcipt:history.go(-1)"><img src="image/back.gif"></a>	  
</form>
 </table>	
 
</body>
</html>
