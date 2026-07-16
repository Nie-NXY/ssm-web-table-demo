<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk"%>


<html>
  <head>
    <title>提示页面-云工厂网上书城</title>
  </head>
  
  <body>
  <br>
  <br>
  <br>
  	<p align="center">
  		<%=request.getAttribute("title")%>操作成功！
  		<a href="<%= request.getContextPath()%><%=request.getAttribute("returnPath")%>">点击跳转</a>
  	</p>
  </body>
</html>
