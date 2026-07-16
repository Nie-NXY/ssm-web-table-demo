<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
  <head>
    <title>云工厂网上书城</title>
    <link rel="styleSheet" href="${pageContext.request.contextPath }/background/css/save.css" type="text/css" media="all" />
  </head>
  <body>
	<form action="${pageContext.request.contextPath }/UpdataBookInfoServlet" name="saveBookType" method="post">
		<table>
			<caption>云工厂网上书城-修改图书类别列表</caption>
			<tr>
				<td>图书编号：</td>
				<td><input name="bookId" size="40" value="${requestScope.book.bookId}" readonly></td>
			</tr>
			<tr>
				<td>图书名称：</td>
				<td><input name="bookName" size="40" value="${requestScope.book.bookName}"></td>
			</tr>
			<tr>
				<td>作者：</td>
				<td><input name="author" size="40" value="${requestScope.book.author}"></td>
			</tr>
			<tr>
				<td>图书类别编号：</td>
				<td>
					<select name="booktypeId">
						<c:forEach var="type" items="${requestScope.bookTypes}">
							<option value="${type.bookTypeId}"> ${type.bookTypeName}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>图书状态：</td>
				<td>
					<input type="radio" name="bookStates" value="1" 
					<c:if test="${book.bookStates == 1 }">
						checked
					</c:if>
					>可用
					<input type="radio" name="bookStates" value="2"
					<c:if test="${book.bookStates == 2 }">
						checked
					</c:if>
					>上架
					<input type="radio" name="bookStates" value="3"
					<c:if test="${book.bookStates == 3 }">
						checked
					</c:if>
					>不可用
				</td>
			</tr>
			<tr>
				<td>出版社名称：</td>
				<td><input name="pbName" size="40" value="${requestScope.book.pbName}"></td>
			</tr>
			<tr>
				<td>出版社日期：</td>
				<td><input name="pbdate" size="40" value="${requestScope.book.pbdate}"></td>
			</tr>
			<tr>
				<td>标准价格：</td>
				<td><input name="price" size="40" value="${requestScope.book.price}"></td>
			</tr>
			<tr>
				<td>云工厂价格：</td>
				<td><input name="ygcprice" size="40" value="${requestScope.book.ygcprice}"></td>
			</tr>
			<tr>
				<td>大图片：</td>
				<td><input name="bigImg" size="40" value="${requestScope.book.bigImg}"></td>
			</tr>
			<tr>
				<td>小图片：</td>
				<td><input name="smallImg" size="40" value="${requestScope.book.smallImg}"></td>
			</tr>
			<tr>
				<td>描述：</td>
				<td><textarea cols="36" rows="4" name="context">${requestScope.book.context}</textarea> </td>
			</tr>
			<tr>
				<td><input type="submit" name="submit" value="保存"></td>
				<td><input type="reset" name="reset" value="重置"></td>
			</tr>
		</table>
	</form>
  </body>
</html>
