<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
  <head>
    <title>云工厂网上书 城   - 订单处理</title>
    <link rel="styleSheet" href="${pageContext.request.contextPath}/background/css/body.css" type="text/css" media="all" />
  </head>
  
  <body>
  	<table>
  		<caption>云工厂网上书城管理员信息列表</caption>
  		<tr>
  			<th>订单编号</th>
  			<th>客户编号</th>
  			<th>金额</th>
  			<th>订单状态</th>
  			<th>收货方名称</th>
  			<th>收货方电话</th>
  			<th>收货方地址</th>
  			<th>处理中...</th>
	  		<th>处理完毕</th>
  		</tr>
  		<c:forEach var="info" items="${requestScope.mains}" > 
  			<tr onmouseout="this.bgColor='white'" onmouseover="this.bgColor='#66CCFF'">
	  			<td>${info.oid}</td>
	  			<td>${info.customerId}</td>
	  			<td>${info.moneyCount}</td>
	  			
	  			<c:if test="${info.sates == 1}">     
	          		<td width="50" class="wr4">未处理</td>
	          	</c:if>
	          
	          	<c:if test="${info.sates == 2}">     
	          		<td width="50" class="wr4">正在处理...</td>
	          	</c:if>
	          
	         	<c:if test="${info.sates == 3}">     
	          		<td width="50" class="wr4">已处理</td>
	          	</c:if>
	  			<td>${info.shouName}</td>
	  			<td>${info.shouTel}</td>
	  			<td>${info.shouAddress}</td>
  			<c:if test="${sessionScope.sysAdmin.adminType == 1}" var="result" >
  				<td><a href="${pageContext.request.contextPath}/UpOrderStatesServlet?oid=${info.oid}&states=2">处理...</a>
  				</td>
  				<td><a href="${pageContext.request.contextPath}/UpOrderStatesServlet?oid=${info.oid}&states=3">处理完毕</a></td>
  			</c:if>
  			<c:if test="${!result}">
				<td>无权限</td>
  				<td>无权限</td>
  			</c:if>
		</c:forEach>
		<%--
		<tr>
  			<td colspan="3">
  				<a id="wSJ" href="#" onclick="changeStates(1)">未上架&nbsp;&nbsp;</a>
  				<a id="ySJ" href="#" onclick="changeStates(2)">已上架&nbsp;&nbsp;</a>
  				<a id="bKY" href="#" onclick="changeStates(3)">不可用&nbsp;&nbsp;</a>
  				<a id="sY" href="#" onclick="changeStates(4)">所&nbsp;&nbsp;有</a>
  			</td>
  			<td colspan="7">
  				第${requestScope.nowPage}页&nbsp;&nbsp;
  				共${requestScope.pageCount}页&nbsp;&nbsp;&nbsp;&nbsp;
  				<c:if test="${nowPage == 1 || pageCount == 0}" var="re1">
  					首&nbsp;&nbsp;页&nbsp;&nbsp;
	  				上一页&nbsp;&nbsp;
  				</c:if>
  				<c:if test="${!re1}">
  					<a id="first" href="#" onclick="goNowPage(1,5)">首&nbsp;&nbsp;页&nbsp;&nbsp;</a>
	  				<a id="upPage" href="#" onclick="goNowPage('${nowPage-1}',5)">上一页&nbsp;&nbsp;</a>
  				</c:if>
  				<c:if test="${nowPage == pageCount || pageCount == 0}" var="re2">
  					下一页&nbsp;&nbsp;
	  				末&nbsp;&nbsp;页
  				</c:if>
  				<c:if test="${!re2}">
  					<a id="nextPage" href="#" onclick="goNowPage('${nowPage+1}',5)">下一页&nbsp;&nbsp;</a>
	  				<a id="end" href="#" onclick="goNowPage('${pageCount}',5)">末&nbsp;&nbsp;页</a>
  				</c:if>
	  			  	<select id="selectNowPage" onchange="goNowPage(this.value)">
	  			  	<c:forEach begin="1" end="${pageCount}" varStatus="sta" >
	  					<option value="${sta.count}" >
	  					第${sta.count}页
	  					</option>
	  				</c:forEach>
	  			</select>
  			</td>
  		</tr>
  	--%>
  	</table>
  </body>
</html>
