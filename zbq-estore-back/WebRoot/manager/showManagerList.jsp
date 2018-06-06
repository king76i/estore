<%@ page language="java" isELIgnored="false" import="java.util.*"  contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%String path = request.getContextPath();
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <base href="<%=basePath%>">
  <script>
  function deleteManager(id){
  	if(confirm("确定要删除么?")){
		window.location = "manager/deleteManager.action?manager.id="+id;  
  	}
  }
  </script>
</head>
 
 <body>

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
									<strong>管理员信息的查询</strong>
								</div>
							</td>
						</tr>
					</table>
					<br>
					<table width="90%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="300"height="20" colspan="4">
								<div align="right">
									<a href="manager/updatePassword.jsp">修改您的密码</a>&nbsp;&nbsp;&nbsp;
								</div>
							</td>
						<tr>
					</table>
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
									管理员用户名
								</div>
							</td>
							<td width="20%">
								<div align="center">
									管理员姓名
								</div>
							</td>
							<td width="44%">
								<div align="center">
									操作
								</div>
							</td>
						</tr>
					 	<c:forEach items="${managerList }" var="manager">
						<tr bgcolor="#FFFFFF">
							<td height="30">
								<div align="center">${manager.id } </div>
							</td>
							<td>
								<div align="center">${manager.name }  </div>
							</td>
							<td>
								<div align="center"> ${manager.realName} </div>
							</td>
							<td>
								<div align="center">
								<c:choose>
									<c:when test="${manager.sign ==0 }">
										<a href="javascript:deleteManager('${manager.id }')">删除</a>
									</c:when>
									<c:otherwise>
									删除
									</c:otherwise>
								</c:choose>
								</div>
							</td>
						</tr>
				 		</c:forEach>
					 
					</table>
					<br>
				
						 <div align="right">
							 	<a href="manager/addManager.jsp">添加管理员</a>&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
			
					</tr>
					</table>
  

</body>
</html>


