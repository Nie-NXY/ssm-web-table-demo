<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
  <head>
    <title>云工厂网上书 城   - 订单处理</title>
    <link rel="styleSheet" href="${pageContext.request.contextPath}/background/css/body.css" type="text/css" media="all" />
  </head>
  
  <body>
  	<table>
  		<caption>云工厂网上书城  - 寻书信息表</caption>
  		<tr>
  			<th>寻书编号</th>
  			<th>图书名称</th>
  			<th>作者</th>
  			<th>出版社名称</th>
  			<th>寻书人email</th>
  			<th>描述</th>
  			<th>删除</th>
  		</tr>
  		<c:forEach var="info" items="${requestScope.searchBooks}" > 
  			<tr onmouseout="this.bgColor='white'" onmouseover="this.bgColor='#66CCFF'">
	  			<td>${info.sbId}</td>
	  			<td>${info.bookName}</td>
	  			<td>${info.author}</td>
	  			<td>${info.pbName}</td>
	  			<td>${info.email}</td>
	  			<td>${info.context}</td>
  			<c:if test="${sessionScope.sysAdmin.adminType < 3}" var="result" >
  				<td><a href="${pageContext.request.contextPath}/DeleteSearchServlet?sbId=${info.sbId}" onclick="return isDelete();">删除</a></td>
  			</c:if>
  			<c:if test="${!result}">
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
  <script type="text/javascript">
  	function isDelete() {
  		return confirm("确定删除本条寻书信息吗？");
  	}
  </script>
</html>
