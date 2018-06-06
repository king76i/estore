<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%String path = request.getContextPath();
 	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<html>
 <head> 
 <base href="<%=basePath%>">
  <script>
      	function quit(){
	  		if(confirm("确定要退出后台么?")){
	  			window.location.href="manager/logout.action";
	  		}
	 	}
   </script>
  </head>
 <body>
  
<table width="35" height="22" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td><img src="image/bg_left01.jpg" width="300" height="45"></td>
      </tr>
    </table>
      <table width="300" height="46" border="0" cellpadding="0" cellspacing="0" background="image/bg_left02.jpg">
        <tr>
          <td><table width="118" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="118" height="17" align="center" valign="bottom"><div align="left"><a href="product/showAllProduct.action" class="a3">商品管理</a></div></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="300" height="46" border="0" cellpadding="0" cellspacing="0" background="image/bg_left02.jpg">
        <tr>
          <td><table width="118" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="109" height="17" align="center" valign="bottom"><div align="left"><a href="" class="a3">会员管理</a></div></td>
              </tr>
          </table></td>
        </tr>
      </table>
     
      <c:choose>
        <c:when test = "${sessionScope.manager.sign==1}">
           
      <table width="300" height="46" border="0" cellpadding="0" cellspacing="0" background="image/bg_left02.jpg">
        <tr>
          <td><div align="left">
            <table width="118" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="127" height="17" align="center" valign="bottom"><div align="left"><a href="manager/showManagerList.action" class="a3">后台管理员</a></div></td>
                </tr>
             </table>
          </div></td>
        </tr>
      </table>
     </c:when>
     
     <c:otherwise>
       <table width="300" height="46" border="0" cellpadding="0" cellspacing="0" background="image/bg_left02.jpg">
        <tr>
          <td><div align="left">
            <table width="118" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="127" height="17" align="center" valign="bottom"><div align="left"><a href="" class="a3">修改密码</a></div></td>
                </tr>
             </table>
          </div></td>
        </tr>
      </table>      
     </c:otherwise>
     </c:choose>    
      <table width="300" height="46" border="0" cellpadding="0" cellspacing="0" background="image/bg_left02.jpg">
        <tr>
          <td><table width="118" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="127" height="17" align="center" valign="bottom"><div align="left"><a href="" class="a3">订单管理</a></div></td>
              </tr>
             <!-- <tr>
                <td height="17" align="center"><div align="left"><font color="#FFFFFF">Order Manage</font></div></td>
              </tr>-->
          </table></td>
        </tr>
      </table>
      <table width="300" height="46" border="0" cellpadding="0" cellspacing="0" background="image/bg_left02.jpg">
        <tr>
          <td><table width="118" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="127" height="17" align="center" valign="bottom"><div align="left"><a href="mainCategory/showAllMainCategory.action" class="a3">大类别管理</a></div></td>
              </tr>
            <!--   <tr>
                <td height="17" align="center"><div align="left"><font color="#FFFFFF">Info Manage</font></div></td>
              </tr>-->
          </table></td>
        </tr>
      </table>
      <table width="300" height="46" border="0" cellpadding="0" cellspacing="0" background="image/bg_left02.jpg">
        <tr>
          <td><table width="118" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="127" height="17" align="center" valign="bottom"><div align="left"><a href="" class="a3">小类别管理</a></div></td>
              </tr>
            <!--  <tr>
                <td height="17" align="center"><div align="left"><font color="#FFFFFF">Link Manage</font></div></td>
              </tr>-->
          </table></td>
        </tr>
      </table>
      <table width="300" height="47" border="0" cellpadding="0" cellspacing="0" background="image/bg_left03.jpg">
        <tr>
          <td><table width="118" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="127" height="17" align="center" valign="bottom"><div align="left"><a href="javascript:quit()" class="a3">安全退出</a></div></td>
              </tr>
             <!-- <tr>
                <td height="17" align="center"><div align="left"><font color="#FFFFFF">Exit</font></div></td>
              </tr>-->
          </table></td>
        </tr>
      </table>
      <table width="37" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><img src="image/bg_left04.jpg" width="300" height="68"></td>
        </tr>
      </table>
     </body>
 </html>
 