<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
  <head>
    <title>云工厂网上书城图书详细信息</title>
    <link rel="styleSheet" href="${pageContext.request.contextPath}/background/css/body.css" type="text/css" media="all" />
  </head>
  
  <body onload="init()">
  	<table>
  		<caption>云工厂网上书城详细信息列表</caption>
  		<tr>
  			<th>图书编号</th>
  			<th>图书名称</th>
  			<th>作者</th>
  			<th>图书种类编号</th>
  			<th>出版日期</th>
  			<th>出版社名称</th>
  			<th>标准价格</th>
  			<th>云工厂价格</th>
  			<th>图书状态</th>
  			<th>修改</th>
  			<th>不可用</th>
  			
  		</tr>
  		<c:forEach var="book" items="${requestScope.bookInfo}" > 
  			<tr onmouseout="this.bgColor='white'" onmouseover="this.bgColor='#66CCFF'">
	  			<td>${book.bookId}</td>
	  			<td>${book.bookName}</td>
	  			<td>${book.author}</td>
	  			<td>${book.booktypeId}</td>
	  			<td>${book.pbdate}</td>
	  			<td>${book.pbName}</td>
	  			<td>${book.price}</td>
	  			<td>${book.ygcprice}</td>
	  			<td>${book.bookStates}</td>
  			<c:if test="${sessionScope.sysAdmin.adminType < 3}" var="result" >
  				<td><a href="${pageContext.request.contextPath}/FindBookInfoByIdServlet?bookId=${book.bookId}">修改</a></td>
  				<td><a href="${pageContext.request.contextPath}/DeUpdateBookStatesServlet?bookId=${book.bookId}" 
  					title="删除信息" onclick="return isDelete('${book.bookName}')">不可用</a></td>
  			</c:if>
  			<c:if test="${!result}">
				<td>无权限</td>
  				<td>无权限</td>
  			</c:if>
		</c:forEach>
		<tr>
  			<td colspan="1">
  				<a href="${pageContext.request.contextPath}/background/bookInfo/SaveBookInfo.jsp">新增</a>
  			</td>
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
  	</table>
  </body>
  <script type="text/javascript">
  	function isDelete(bookName) {
  		return confirm("确定删除【" + bookName + "】吗？");
  	}
  	var bookStates = '${requestScope.bookStates}';
  	function goNowPage(nowPage) {
  		var url = "${pageContext.request.contextPath}/FindAllBookInfoServlet?nowPage=" + nowPage + "&bookStates=" + bookStates;
  		window.location = url;
  	}
  	function changeStates(myStates){
  		bookStates = myStates;
  		goNowPage(1);
  	}
  	function init() {
  		var init = "sY";
  		if(bookStates == '1') {
  			init = "wSJ";
  		}else if(bookStates == '2') {
  			init = "ySJ";
  		}else if(bookStates == '3') {
  			init = "bKY";
  		}
  		document.getElementById(init).style.background = '#66CCFF';
  		document.getElementById("selectNowPage").value = "${nowPage}";
  	}
  </script>
</html>
