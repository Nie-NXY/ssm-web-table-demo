<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk"%>
<%@page import="cn.key.entity.BookType"%>
<%@page import="cn.key.entity.SysAdmin"%>
<%
	Object object = session.getAttribute("sysAdmin");
	SysAdmin admin = null;
	if(object == null) {
		response.sendRedirect(request.getContextPath() + "/background/login.jsp");
	}else {
		admin = (SysAdmin)object;
	}
 %>
<html>
  <head>
    <title>云工厂网上书城</title>
    <link rel="styleSheet" href="<%=request.getContextPath()%>/background/css/body.css" type="text/css" media="all" />
  </head>
  
  <body>
  		<% 
  			List<BookType> list = (List<BookType>)request.getAttribute("bookType");
  		 %>
    <table>
    <caption>云工厂网上书城图书类别列表</caption>
    <tr>
    	<th>图书编号</th>
    	<th>图书类别编号</th>
    	<th>是否可用</th>
    	<th>图书类别名称</th>
    	<th>描述</th>
    	<th>修改</th>
    	<th>不可用</th>
    </tr>
   	<% 
   	for(BookType book: list) {%>
   		<tr onmouseout="this.bgColor='white'" onmouseover="this.bgColor='#66CCFF'">
   			<td><%=book.getBookTypeId()%></td>
   			<td><%=book.getParentId()%></td>
   			<td><%=book.getIsDelete()%></td>
   			<td><%=book.getBookTypeName()%></td>
   			<td><%=book.getContext()%></td>
   			<% if(admin.getAdminType() < 3) {%>
   				<td><a href="<%= request.getContextPath() %>/FindBookTypeByIdServlet?bookTypeId=<%=book.getBookTypeId()%>">修改</a></td>
  				<td><a href="<%= request.getContextPath() %>/DeUpdateIsDeleteServlet?bookTypeId=<%=book.getBookTypeId()%>">不可用</a></td>
   			<% }else {%>
   				<th>无权限</th>
   				<th>无权限</th>	
   			<% } %>
   			
   		</tr>
   	<%} %>
   		<tr>
   			<td colspan="1">
   				<a href="<%=request.getContextPath()%>/background/bookType/SaveBookType.jsp">新增</a>		
   			</td>
   			<td colspan="3">
   				<a href="<%=request.getContextPath()%>/FindAllBookTypeServlet?isDelete=1">可用&nbsp;&nbsp;</a>
  				<a href="<%=request.getContextPath()%>/FindAllBookTypeServlet?isDelete=2">不可用&nbsp;&nbsp;</a>
  				<a href="<%=request.getContextPath()%>/FindAllBookTypeServlet?isDelete=3">所有</a>		
   			</td>
   			<td colspan="3">
   				&nbsp;
   			</td>
   		</tr>
    </table>
  </body>
</html>
