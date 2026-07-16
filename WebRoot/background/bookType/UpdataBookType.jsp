<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk"%>
<%@page import="cn.key.entity.BookType"%>

<html>
  <head>
    <title>云工厂网上书城新增图书类别</title>
    <link rel="styleSheet" href="<%=request.getContextPath()%>/background/css/save.css" type="text/css" media="all" />
  </head>
  
  <body>
	<form action="<%= request.getContextPath() %>/UpdataBookTypeServlet" name="saveBookType" method="post">
	<% BookType type = (BookType)request.getAttribute("bookType"); %>
		<table>
			<caption>云工厂网上书城新增图书类别列表</caption>
			<tr>
				<td>图书类别编号：</td>
				<td><input name="bookTypeId" size="40" value="<%= type.getBookTypeId()%>" readonly></td>
			</tr>
			<tr>
				<td>图书类别：</td>
				<td><input name="parentId" size="40" value="<%= type.getParentId() %>"></td>
			</tr>
			<tr>
				<td>是否可用：</td>
				<td>
					<input type="radio" name="isDelete" value="1" 
					<%if(type.getIsDelete() == 1) {%>
						checked
					<%}%>
					>可用&nbsp;
					<input type="radio" name="isDelete" value="2"
					<%if(type.getIsDelete() == 2) {%>
						checked
					<%}%>
					>不可用
				</td>
			</tr>
			<tr>
				<td>类别名称：</td>
				<td><input name="bookTypeName" size="40" value="<%= type.getBookTypeName() %>"></td>
			</tr>
			<tr>
				<td>描述：</td>
				<td><textarea cols="36" rows="4" name="context"><%= type.getContext()%></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" name="submit" value="保存"></td>
				<td><input type="reset" name="reset" value="重置"></td>
			</tr>
		</table>
	</form>
  </body>
</html>
