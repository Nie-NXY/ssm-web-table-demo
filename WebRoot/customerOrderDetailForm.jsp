<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>我的详细订单 - 云工厂网上书店</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
	
	<jsp:include page="fgLeft.jsp"></jsp:include>
	
    <td bgcolor="#F8FEE8">
      <table width="500" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td class="wr1">
            <div align="center"><b><font color="#F68217">我的详细订单</font></b></div>
          </td>
        </tr>
        <tr>
          <td> <b></b></td>
        </tr>
        <tr> 
          <td class="wr4"> </td>
        </tr>
      </table>
	  <table width="500" border="0" cellspacing="1" cellpadding="2" align="center" bgcolor="#000000">
        <tr align="center" bgcolor="#F8FEE8"> 
                
          <td width="70" class="wr4">名称</td>
                
          <td width="79" class="wr4">数量</td>
                
          <td width="73" class="wr4">云工厂价</td>
          
          <td width="73" class="wr4">订单编号</td>
                
          <td width="73" class="wr4">小计</td>
                
          <td width="73" class="wr4">订单日期</td>
                
       </tr>
       <c:forEach var="orderDetail" items="${requestScope.orderDetails}">
	       <tr bgcolor="#F8FEE8" align="center"> 
	                
	          <td width="70" class="wr4">
	          		<a href="${pageContext.request.contextPath }/ShowBookInfoByIdServlet?bookId=${orderDetail.bookId}">${orderDetail.bookName}</a>
	          </td>
	                
	          <td width="79" class="wr4">${orderDetail.num}</td>
	                
	          <td width="73" class="wr4">${orderDetail.ygcprice}</td>
	          
	          <td width="73" class="wr4">${orderDetail.oid}</td>
	                
	          <td width="73" class="wr4">${orderDetail.ygcprice * orderDetail.num}</td>
	                
	          <td width="81" class="wr4">${orderDetail.oid}</td>
	       </tr>
       
       </c:forEach>
     </table>
          
      <%--<table width="500" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td class="wr4">
            <div align="center">首页　下页　上页　末页</div>
          </td>
        </tr>
      </table>
      --%><p>&nbsp;</p>
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
</html>
<script ></script>