<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
  <head>
    <title>云工厂网上书城</title>
    <link rel="styleSheet" href="<%=request.getContextPath()%>/background/css/save.css" type="text/css" media="all" />
  </head>
  <body>
	<form action="${pageContext.request.contextPath}/SaveBookInfoServlet" name="saveBookType" method="post">
		<table>
			<caption>云工厂网上书城新增图书类别列表</caption>
			<tr>
				<td>图书名称：</td>
				<td><input name="bookName" size="40"></td>
			</tr>
			<tr>
				<td>作者：</td>
				<td><input name="author" size="40"></td>
			</tr>
			<tr>
				<td>图书类别编号：</td>
				<%--<td>
					<select name="bookTypeId">
						<c:forEach items="${requestScope.bookType}"></c:forEach>
					</select> 
				</td>
				--%><td><input name="booktypeId" size="40"></td>
			</tr>
			<tr>
				<td>图书状态：</td>
				<td>
					<input type="radio" name="bookStates" value="1" checked>可用
					<input type="radio" name="bookStates" value="2">上架
					<input type="radio" name="bookStates" value="3">不可用
				</td>
			</tr>
			<tr>
				<td>出版社名称：</td>
				<td><input name="pbName" size="40"></td>
			</tr>
			<tr>
				<td>出版社日期：</td>
				<td><input name="pbdate" size="40"></td>
			</tr>
			<tr>
				<td>标准价格：</td>
				<td><input name="price" size="40"></td>
			</tr>
			<tr>
				<td>云工厂价格：</td>
				<td><input name="ygcprice" size="40"></td>
			</tr>
			<tr>
				<td>大图片：</td>
				<td><input name="bigImg" size="40"></td>
			</tr>
			<tr>
				<td>小图片：</td>
				<td><input name="smallImg" size="40"></td>
			</tr>
			<tr>
				<td>描述：</td>
				<td><textarea cols="36" rows="4" name="context"></textarea> </td>
			</tr>
			<tr>
				<td><input type="submit" name="submit" value="保存"></td>
				<td><input type="reset" name="reset" value="重置"></td>
			</tr>
		</table>
	</form>
  </body>
</html>
