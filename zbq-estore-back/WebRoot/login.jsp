<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%String path = request.getContextPath();
 	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<html>
 <head> 
 <base href="<%=basePath%>">
  <link href="css/css.css" rel="stylesheet" type="text/css">
  <script  type="text/javascript">
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
  
<body style="background-color:#f0f0f0"> 
  <c:if test="${!empty result }">
  	<script>
  		alert('${result}')
  	</script>
  </c:if>
<table width="100%" height="100%">
  <tr>
    <td>	
      <form name="form" method="post" action="manager/login.action" onSubmit="return checkEmpty(form)">
        <table width="547" height="294" border="0" align="center" cellpadding="0" cellspacing="0" background="image/bg-land.jpg">
           <tr>
            <td width="125">&nbsp;</td>
            <td width="425" valign="bottom">
               <table width="411">
                 <tr>      
                    <td width="80"><font color="#9A6634">用户名</font>          </td>
                    <td width="100"><input name="manager.name" type="account" class="bgtext" size="15"></td>
                    <td width="90">&nbsp;<font color="#9A6634">密码</font>          </td>
                    <td width="80"><input name="manager.password" type="password" class="bgtext" size="15"></td>
                    <td width="72">
                       <div align="right">
                          <input type="image" class="bgButtoninput" src="image/bg-land.gif" >
                       </div>
                    </td>
                 </tr> 
                 <tr>
                    <td height="30" colspan="5"></td>
                 </tr>                
               </table>
            </td>
           </tr>
        </table>
    </form>
  </td>
  </tr>
</table>
</body>
</html>
