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
	  function deleteMainCategory(id){
  			if(confirm("确定要删除么?")){
			window.location = "mainCategory/deleteMainCategory.action?category.id="+id;  
  			}
  		}

	</script>
  </head>
  <body>
   <c:if test="${!empty result }">
  	<script>
  		alert('${result}')
  	</script>
  </c:if>
<jsp:include page= "../top.jsp" flush="true"/>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="300"  valign="top"><jsp:include page="../left.jsp" flush="true" /></td>
    <td width="724" align="center" valign="top" bgcolor="#FFFFFF">	
<br>
 
	<table width="723" height="25" border="0" cellpadding="0"
						cellspacing="0" background="image/bg_02.jpg">
						<tr>
							<td>
								<div align="center">
									<strong>大类别查询</strong>
								</div>
							</td>
						</tr>
					</table>
					<br>

					<table width="90%" border="1" cellpadding="1" cellspacing="1"
						bordercolor="#FFFFFF" bgcolor="#CCCCCC">
						<tr>
							<td width="300"height="25">
								<div align="center">
									数据编号
								</div>
							</td>
							<td width="20%">
								<div align="center">
									大类别名称
								</div>
							</td>
							
							<td width="44%">
								<div align="center">
									操作
								</div>
							</td>
						</tr>
					 	<c:forEach items="${MainCategoryList }" var="MainCategoryList">
						<tr bgcolor="#FFFFFF">
							<td height="30">
								<div align="center">${MainCategoryList.id } </div>
							</td>
							<td>
								<div align="center">${MainCategoryList.name }  </div>
							</td>
							
							<td>
								<div align="center">
								<a href="mainCategory/editMainCategory2.jsp?mainCategoryId=${MainCategoryList.id }&mainCategoryName=${MainCategoryList.name}" >修改</a> 
								&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="javascript:deleteMainCategory('${MainCategoryList.id }')">删除</a>
								</div>
							</td>
						</tr>
				 		</c:forEach>
					 
					</table>
					<br>
				
						 <div align="right">
							 	<a href="mainCategory/addMainCategory.jsp">添加大类别</a>&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
			
					</tr>
					</table>
  

</body>
</html>
