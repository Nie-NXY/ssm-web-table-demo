<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
  <head>
    <title>云工厂网上书城</title>
    <link rel="styleSheet" href="${pageContext.request.contextPath }/background/css/save.css" type="text/css" media="all" />
  </head>
  <body>
	<form action="${pageContext.request.contextPath }/SaveSysAdminServlet" method="post">
		<table>
			<caption>云工厂网上书城-新增管理员</caption>
			<tr>
				<td>管理员名称：</td>
				<td><input name="adminName" size="40"></td>
			</tr>
			<tr>
				<td>管理员密码：</td>
				<td><input type="password" name="pwd" size="40"></td>
			</tr>
			
			<tr>
				<td>管理员权限：</td>
				<td>
					<input type="radio" name="states" value="1" >超级管理员
					<input type="radio" name="states" value="2" >普通管理员
					<input type="radio" name="states" value="3" checked>来宾管理员
				</td>
			</tr>
			<tr>
				<td><input type="submit" name="submit" value="保存"></td>
				<td><input type="reset" name="reset" value="重置"></td>
			</tr>
		</table>
	</form>
  </body>
</html>
