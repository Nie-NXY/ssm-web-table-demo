<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style>
<!--
.wr{font-size: 12pt; line-height: 22px}
.wr1 {	FONT-SIZE: 12px; LINE-HEIGHT: 200%}
.wr2 {	FONT-SIZE: 14px; LINE-HEIGHT: 200%}
.wr3 {	FONT-SIZE: 12px}
.wr4 {	FONT-SIZE: 12px; LINE-HEIGHT: 150%}
// -->
</style>
<title>云工厂网上书店后台管理系统</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<body bgcolor="#FFFFDB" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<c:if test="${sessionScope.sysAdmin.adminType == 1}">
	<table width="160" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td>&nbsp;</td>
	    <td width="12">&nbsp;</td>
	  </tr>
	  <tr> 
	    <td background="images/ht04.jpg" class="wr4"> 
	      <div align="center">用 户 管 理</div>
	    </td>
	    <td width="12"><img src="images/ht03.jpg" width="12" height="20"></td>
	  </tr>
	</table>
	<table width="160" border="0" cellspacing="0" cellpadding="2">
	  <tr>
	    <td width="40">&nbsp;</td>
	    <td class="wr4" width="120"><a href="<%=request.getContextPath()%>/ShowSysAdminServlet" target="mainFrame">系统用户管理</a></td>
	  </tr>
	  <tr>
	    <td width="40">&nbsp;</td>
	    <td class="wr4" width="120"><a href="<%=request.getContextPath()%>/FindAllCustomerInfoServlet" target="mainFrame">客户管理</a></td>
	  </tr>
	  <tr> 
	    <td width="40">&nbsp;</td>
	    <td class="wr4" width="120">&nbsp;</td>
	  </tr>
	</table>
</c:if>


<table width="160" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td background="images/ht06.jpg" class="wr4"> 
      <div align="center">图 书 信 息</div>
    </td>
    <td width="12"><img src="images/ht05.jpg" width="12" height="20"></td>
  </tr>
</table>
<table width="160" border="0" cellspacing="0" cellpadding="2">
  <tr> 
    <td width="40">&nbsp;</td>
    <td class="wr4" width="120"><a href="<%=request.getContextPath()%>/FindAllBookTypeServlet" target="mainFrame">图书类别管理</a></td>
  </tr>
  <tr> 
    <td width="40">&nbsp;</td>
    <td class="wr4" width="120"><a href="<%=request.getContextPath()%>/FindAllBookInfoServlet" target="mainFrame">图书信息管理</a></td>
  </tr>
  <c:if test="${sessionScope.sysAdmin.adminType == 1}">
  	<tr> 
	 <td width="40">&nbsp;</td>
	 <td class="wr4" width="120"><a href="<%=request.getContextPath()%>/OrderMakeServlet" target="mainFrame">订单处理</a></td>
	</tr>
 </c:if>
  <tr> 
    <td width="40">&nbsp;</td>
    <td class="wr4" width="120"><a href="<%=request.getContextPath()%>/FindInfoByCustomerServlet" target="mainFrame">寻书管理</a></td>
  </tr>
  <tr> 
    <td width="40">&nbsp;</td>
    <td class="wr4" width="120">&nbsp;</td>
  </tr>
</table>
 <c:if test="${sessionScope.sysAdmin.adminType <= 2}">
	<table width="160" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
	    <td background="images/ht08.jpg" class="wr4"> 
	      <div align="center">交 互 管 理</div>
	    </td>
	    <td width="12"><img src="images/ht07.jpg" width="12" height="20"></td>
	  </tr>
	</table>
	<table width="160" border="0" cellspacing="0" cellpadding="2">
	  <tr>
	    <td width="40">&nbsp;</td>
	    <td class="wr4" width="120"><a href="<%=request.getContextPath()%>/ShowDiscussServlet" target="mainFrame">评论管理</a></td>
	  </tr>
	  <tr> 
	    <td width="40">&nbsp;</td>
	    <td class="wr4" width="120">&nbsp;</td>
	  </tr>
	</table>
	</c:if>
<c:if test="${sessionScope.sysAdmin.adminType ==1}">
	<table width="160" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
	    <td background="images/ht04.jpg" class="wr4"> 
	      <div align="center"><a href="" target="mainFrame">系 统 设 置</a></div>
	    </td>
	    <td width="12"><img src="images/ht03.jpg" width="12" height="20"></td>
	  </tr>
	  <tr>
	    <td class="wr4">&nbsp;</td>
	    <td width="12">&nbsp;</td>
	  </tr>
	</table>
</c:if>
	
<table width="160" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="images/ht08.jpg" class="wr4"> 
      <div align="center"><a href="<%=request.getContextPath()%>/ChangeServlet" target="_parent" >退出并进入前台首页</a></div>
    </td>
    <td width="12"><img src="images/ht07.jpg" width="12" height="20"></td>
  </tr>
  <tr>
    <td background="images/ht08.jpg" class="wr4"> 
      <div align="center"><a href="<%=request.getContextPath()%>/reLoginServlet" target="_parent" >重新登录</a></div>
    </td>
    <td width="12"><img src="images/ht07.jpg" width="12" height="20"></td>
  </tr>
</table>
</body>
<script type="text/javascript">
	function reset() {
		var url = "${pageScope.request.contextPath}/background/login.jsp";
		window.location = url;
	}
</script>
</html>
