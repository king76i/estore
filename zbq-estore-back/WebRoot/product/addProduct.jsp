<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%String path = request.getContextPath();
 String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> 
<html>
<head>
<base href="<%=basePath%>">   
  
  <script src="script/jquery-1.12.3.min.js" type="text/javascript"></script>
 <script>
function checkEmpty(form){
for(i=0;i<form.length;i++){
if(form.elements[i].value==""){
alert("表单信息不能为空");
return false;
}
}
if(isNaN(document.getElementById("marketPrice").value)){
window.alert("价格只能为数字");
return false;
}
}
function ChangeItem(){
	var branchSelect = document.getElementById("branchCategory");//branchCategory
	var mainId = document.getElementById("mainCategory").value;//mainCategory
	$.post("branchCategoryjson/selectBranchCategoryByMainIdForAjax.action",{mainId:mainId},
	function(result){
		branchSelect.options.length=0;
		var op = document.createElement("option");
		op.setAttribute("value", "");
		op.appendChild(document.createTextNode("请选择"));
		branchSelect.appendChild(op);
		for(var i = 0;i<result.length;i++){
			var id = result[i].id;
			var name = result[i].name;
			op=document.createElement("option");
			op.setAttribute("value", id);
			op.appendChild(document.createTextNode(name));
			branchSelect.appendChild(op);
		}
		
	});
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
            <td><div align="center"><strong>添加商品信息</strong></div></td>
          </tr>
        </table>
        <br>
  <form method="post" action="product/insertProduct.action" method="post" enctype="multipart/form-data"  name="form" onSubmit="return checkEmpty(form)" >
        <table width="90%"  border="1" cellpadding="1" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#CCCCCC">
          <tr>
            <td width="300"height="26">&nbsp;&nbsp;所属大类别</td>
            <td width="31%" bgcolor="#FFFFFF">&nbsp;&nbsp;
              <select id = "mainCategory" name="product.categoryMainId " onChange="ChangeItem()"> 
                <option value="">请选择</option>
                 <c:forEach items="${MainCategoryList }" var="MainCategoryList">
                <option value="${MainCategoryList.id}">   ${MainCategoryList.name} </option>
           		</c:forEach>   
              </select>
            </td>
            <td width="20%">&nbsp;&nbsp;所属于小类别</td>
            <td width="31%" bgcolor="#FFFFFF">&nbsp;
              <select id="branchCategory" name = "product.categoryBranchId">  
                <option value="请选择">请选择</option>
              </select>
            </td>
          </tr>
          <tr>
            <td height="25">&nbsp;&nbsp;商品名称</td>
            <td bgcolor="#FFFFFF">&nbsp;&nbsp;
            <input name="product.name" type="text" size="20"></td>
            <td>&nbsp;&nbsp;生产厂商</td>
            <td bgcolor="#FFFFFF">&nbsp;
            <input name="product.producingArea" type="text" size="20"></td>
          </tr>
          <tr>
            <td height="27">&nbsp;&nbsp;商品定价</td>
            <td bgcolor="#FFFFFF">&nbsp;&nbsp;
            <input name="product.marketPrice " id = "" type="text" size="20"></td>
            <td>&nbsp;&nbsp;初始化特价</td>
            <td bgcolor="#FFFFFF">&nbsp;0元</td>
           
          </tr>
		  <tr>
            <td height="28">&nbsp;&nbsp;商品图片</td>
            <td colspan="3" bgcolor="#FFFFFF">&nbsp;&nbsp;
            <input name="image" type="file" id="formFile"></td>          
          </tr>
          <tr>
            <td height="28">&nbsp;&nbsp;简介</td>
            <td colspan="3" bgcolor="#FFFFFF">&nbsp;&nbsp;
            <input name="product.description" type="text" size="50"></td>
          </tr>
        </table><br>
     <input type="image" class="input1"  src="image/save.jpg" width="51" height="20">
&nbsp;&nbsp;
      <a href="javascript:void(0);" onClick="javascript:form.reset()"><img src="image/clear.gif"></a>
&nbsp;&nbsp;
      <a href="javascript:void(0);" onClick="javasrcipt:history.go(-1)"><img src="image/back.gif"></a>
	  </form>	

    </td>
    
  </tr>
</table>
</body>
</html>