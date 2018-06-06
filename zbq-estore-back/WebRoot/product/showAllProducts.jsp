<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%String path = request.getContextPath();
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<html>
<head>
<base href="<%=basePath%>">   
<title>电子商城的后台</title>
 <script>
  
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
            <td><div align="center"><strong>商品查询</strong></div></td>
          </tr>
        </table>
        <br>
		  <table width="90%"  border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#CCCCCC">
        <tr>
          <td width="14%" height="25"><div align="center">数据编号</div></td>
          <td width="19%"><div align="center">商品名称</div></td>
          <td width="14%"><div align="center">大类别</div></td>
          <td width="14%"><div align="center">小类别</div></td>
          <td width="14%"><div align="center">是否特价</div></td>
          <td width="25%"><div align="center">操作</div></td>
        </tr>
		     
		  <c:forEach items="${productList }" var = "product" begin="${start }" end = "${end }">
        <tr bgcolor="#FFFFFF">
          <td height="30"><div align="center">${product.id } </div></td>
          <td><div align="center"><a href="goodsPicture/${product.picture}" target="_blank">${product.name } </a></div></td>

          <td><div align="center">${product.categoryMainId } </div></td>

          <td><div align="center">${product.categoryBranchId } </div></td>
			<c:choose>
				<c:when test="${product.discount ==0  }">
					<td><div align="center"><a href="">否</a></div></td>
				</c:when>
				<c:otherwise>
					<td><div align="center"><a href="">是</a></div></td>
				</c:otherwise>
			</c:choose>
  
          <td><div align="center"><a href="">修改</a>&nbsp;&nbsp;
		 <a href="">删除</a>
		  </div></td>
       </tr>  
       </c:forEach>
      </table>
	  <br>
	  <table width="90%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
	       <td>共${maxPageNum } 页</td>
	      <td>共${totalRecords } 条记录</td>
	      <td>当前为第${pageNum } 页</td>
	      
	      <c:if test="${pageNum>1 }">
	      <!-- 如果当前不是第一页，显示“上一页”超链接-->
	      <td><a href = "product/showAllProduct.action?pageNum=${pageNum -1 }">上一页</a></td>
	      </c:if>
	      
	     <!-- //如果当前不是最后一页，显示“下一页”超链接 -->
	      <c:if test="${pageNum< maxPageNum }">
	     <td><a href = "product/showAllProduct.action?pageNum=${pageNum +1 }">下一页</a></td>
	     </c:if>
	     <td width="20%">
            <div align="right"><img src="image/bg-add.gif" width="9" height="9">&nbsp;<a href="mainCategory/addProduct.action">添加商品</a>&nbsp;</div></td>
	    
         
        </tr>
      </table>
    </td>
  </tr>
</table>
 
</body>
</html>