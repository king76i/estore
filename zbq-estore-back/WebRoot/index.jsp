<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
  <base href="${pageContext.request.contextPath}/">
  </head>
 <body>
<jsp:include page="top.jsp" flush="true"/>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="300"  valign="top"><jsp:include page="left.jsp" flush="true" /></td>
    <td width="724" align="center" valign="top" bgcolor="#FFFFFF">	
<br>
	<table width="723" height="25" border="0" cellpadding="0" cellspacing="0" background="image/bg_02.jpg">
      <tr>
        <td><div align="center"><strong>后台管理</strong></div></td>
      </tr>
    </table>	
	</td>
  </tr>
</table>
</body>
</html>
