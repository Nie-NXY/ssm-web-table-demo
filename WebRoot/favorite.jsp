<%@page language="java" import="java.util.*" contentType="text/html; charset=gbk"%>
<%@page import="cn.key.entity.CustomerInfo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="cn.key.entity.Favorite"%>
<html>
<head>
<style>
<!--
.wr{font-size: 12pt; line-height: 22px}
.wr1 {	FONT-SIZE: 12px; LINE-HEIGHT: 200%}
.wr2 {	FONT-SIZE: 14px; LINE-HEIGHT: 150%}
.wr3 {	FONT-SIZE: 12px}
.wr4 {	FONT-SIZE: 12px; LINE-HEIGHT: 150%}
// -->
</style>
<title>我的收藏夹 - 云工厂网上书店</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

	<jsp:include page="fgLeft.jsp"></jsp:include>
	<%List<Favorite> favorites = (List<Favorite>)request.getAttribute("favorites"); %>
    <td bgcolor="#F8FEE8"> 
      <table width="500" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td class="wr1"> 
            <div align="center"><b><font color="#F68217">我的收藏夹</font></b></div>
          </td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td class="wr4"> </td>
        </tr>
      </table>
      <c:if test="${empty requestScope.favorites}" var="re">
      		<p align="center" class="wr4"><font color="#FF0000">您还没有收藏商品请点击<a href="<%=request.getContextPath()%>/FindBookTypeServlet">这里</a>收藏</font></p>
    </c:if>
    <c:if test="${!re}">
	  <table width="500" border="0" cellspacing="1" cellpadding="2" align="center" bgcolor="#000000">
        <tr align="center" bgcolor="#F8FEE8"> 

          <td width="50" class="wr4">编号</td>
                
          <td width="130" class="wr4">图书名称</td>
                
          <td width="50" class="wr4">图书编号</td>
                
          <td width="130" class="wr4">收藏时间</td>
                
          <td width="70" class="wr4">放入购物车</td>
                
          <td width="50" class="wr4">删除</td>
              </tr>
              
                
          <% for(Favorite favorite : favorites) {%>
          		<tr bgcolor="#F8FEE8" align="center"> 
          			<td class="wr4"><%=favorite.getFavoriteId()%></td>
          			<td class="wr4"><a href="${pageContext.request.contextPath}/ShowBookInfoByIdServlet?bookId=<%=favorite.getBookId()%>"><%=favorite.getBookName()%></a></td>
          			<td class="wr4"><%=favorite.getBookId()%></td>
          			<td class="wr4"><%=favorite.getDate()%></td>
          			<td class="wr4"><a href="<%=request.getContextPath()%>/GwcServlet?type=add&id=<%=favorite.getBookId()%>">购买</a></td>
          			<td class="wr4"><a href="<%=request.getContextPath()%>/DeleteFavoriteServlet?id=<%=favorite.getFavoriteId()%>" onclick="return isDelete('<%=favorite.getBookName()%>');">删除</a></td>
          		</tr>
          <%	}
          %>
            </table>
      <table width="500" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td class="wr4">
          	<% CustomerInfo info = (CustomerInfo)session.getAttribute("customer"); %>
            <div align="right"><a href="<%=request.getContextPath()%>/ClearFavoriteServlet?id=<%=info.getCustomerId()%>" onclick="return isClear('<%=info.getCustomerName()%>')">删除所有收藏</a></div>
          </td>
        </tr>
      </table>
   </c:if>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td> 
            <div align="right"><img src="images/daodu36.gif" width="593" height="58" alt="广告区"></div>
          </td>
        </tr>
      </table>  
      <p align="center" class="wr1">淘书秀 | 寻书登记 | 好书快讯 | 文化沙龙 | 书店平台<br>
        关于书店 | 意见箱 | 联系我们</p>
    </td>
  </tr>
</table>
<table width="770" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td height="22" background="images/dd-m09.gif">&nbsp;</td>
  </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td>&nbsp;</td>
    <td class="wr1" width="10">&nbsp;</td>
    <td class="wr1">&nbsp;</td>
  </tr>
  <tr> 
    <td><a href="http://www.qybook.com"><img src="images/dd-009.gif" width="36" height="40" alt="logo" border="0"></a></td>
    <td class="wr4" width="10">&nbsp;</td>
    <td class="wr4"> 版权所有：<a href="http://www.qingyun.com" target="_blank">西安云工厂科技文化图书有限责任公司</a><br>
      地址：西安市高新一路25号创新大厦一楼　服务电话：029-8326696</td>
  </tr>
</table>
</body>
<script >
	function isDelete(bookName){
		return confirm("您确定要删除 ["+bookName+"] 吗？");
	}
	function isClear(customerName){
		return confirm("您确定要清空 ["+customerName+"]的收藏夹信息吗？");
	}
</script>
</html>
