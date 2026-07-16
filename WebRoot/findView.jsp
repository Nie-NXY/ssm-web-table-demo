<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk"%>
<%@page import="cn.key.entity.BookInfo"%>
<%@page import="cn.key.gwc.Gwc"%>

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
<title>搜索 - 云工厂网上书店</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

	<jsp:include page="fgLeft.jsp"></jsp:include>
	
    <td width="3" bgcolor="#8F8F8F"><img src="images/point.gif" width="1" height="1"></td>
    <%
		List<BookInfo> books = (List<BookInfo>)request.getAttribute("bookInfos");
		int size = Integer.parseInt(request.getAttribute("size").toString().trim());
		int nowPage = Integer.parseInt(request.getAttribute("nowPage").toString().trim());
		int pageCount = Integer.parseInt(request.getAttribute("pageCount").toString().trim());
		String bookName = "";
		String author = "";
		if(request.getAttribute("bookName").toString().length() != 0){
			bookName = request.getAttribute("bookName").toString();	
		}
		if(request.getAttribute("author").toString().length() != 0){
			author = request.getAttribute("author").toString();	
		}
	%>
    <td> 
      <table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td bgcolor="#FEFF99" class="wr4">
          	书名：
          	<% if(bookName.length() != 0) {%>
          		<%=bookName%>
          	<%} else{%>
          		<font color="red">空</font>
          	<%}%>
          	作者：
          	<% if(author.length() != 0) {%>
          		<%=author%>
          	<%} else{%>
          		<font color="red">空</font>
          	<%}%>
          	 
          	</td>
          <td bgcolor="#FEFF99" class="wr4">共有　<font color="#FF0000"><%=size%></font>　条书目，现在第　<font color="#FF0000"><%=nowPage%></font> 
            页 / 共 <font color="#FF0000"><%=pageCount%></font> 页</td>
          <td bgcolor="#FEFF99" class="wr4">
          <% if(nowPage == 1 || pageCount == 0) { %>
	  				[首页]&nbsp;
	  				[上页]&nbsp;
	  			<% } else { %>
	  				<a href="#" onclick="go(1)">[首页]&nbsp;</a>
	  				<a href="#" onclick="go(<%=(nowPage-1)%>)">[上页]&nbsp;</a>
	  			<% } %>
	  			<% if(nowPage == pageCount || pageCount == 0) { %>
	  				[下页]&nbsp;
	  				[末页]
	  			<% } else { %>
	  				<a href="#" onclick="go(<%=(nowPage+1)%>)">[下页]&nbsp;</a>
	  				<a href="#" onclick="go(<%=pageCount%>)">[末页]</a>
	  			<% } %></td>
        </tr>
      </table>
        <% for(BookInfo book : books) {%>
        	<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
	        <tr valign="top"> 
	          <td width="100"> 
	            <div align="center">
	            	<a href="<%=request.getContextPath()%>/ShowBookInfoByIdServlet?bookId=<%=book.getBookId() %>"><img src="images/<%=book.getSmallImg() %>" width="72" height="91"></a>
	            </div>
	          </td>
	          <td width="449"> 
	            <p><span class="wr2"><font color="#CE3431"><b>
	            <a href="<%=request.getContextPath()%>/ShowBookInfoByIdServlet?bookId=<%=book.getBookId() %>"><%=book.getBookName() %></a>（<%=book.getAuthor() %>著）<br>
	              </b></font></span><span class="wr4">定价：<%=book.getPrice() %>元　云工厂价：<%=book.getYgcprice() %>元　<a href="<%=request.getContextPath()%>/GwcServlet?type=add&id=<%=book.getBookId()%>"><img src="<%=request.getContextPath()%>/images/xc.gif" width="15" height="13">购买</a>　　<img src="images/c.gif" width="15" height="11">收藏夹</span></p>
	            <p class="wr4"><%=book.getContext() %></p>
	            
	          </td>
	        </tr>
	      </table>
	      <hr width="95%" align="center" size="1">
        <%}%>
      <%--<table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr valign="top">
          <td width="100">&nbsp;</td>
          <td class="wr1">
            <div align="right"><a href="dd.htm">快速查看&gt;&gt;&gt;</a></div>
          </td>
        </tr>
      </table>
      --%><table width="95%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td bgcolor="#FEFF99" class="wr4"></td>
          <td bgcolor="#FEFF99" class="wr4">共有　<font color="#FF0000"><%=size%></font>　条书目，现在第　<font color="#FF0000"><%=nowPage%></font> 
            页 / 共 <font color="#FF0000"><%=pageCount%></font> 页</td>
          <td bgcolor="#FEFF99" class="wr4">
          <% if(nowPage == 1 || pageCount == 0) { %>
	  				[首页]&nbsp;
	  				[上页]&nbsp;
	  			<% } else { %>
	  				<a href="#" onclick="go(1)" >[首页]&nbsp;</a>
	  				<a href="#" onclick="go(<%=(nowPage-1)%>)" >[上页]&nbsp;</a>
	  			<% } %>
	  			<% if(nowPage == pageCount || pageCount == 0) { %>
	  				[下页]&nbsp;
	  				[末页]
	  			<% } else { %>
	  				<a href="#" onclick="go(<%=(nowPage+1)%>)">[下页]&nbsp;</a>
	  				<a href="#" onclick="go(<%=pageCount%>)">[末页]</a>
	  			<% } %>
	  			<select id="pageSelect" onchange="go(this.value)">
	  				<% for(int i = 1; i <= pageCount; i ++) { %>
	  					<option value="<%=i%>" 
	  					 	<%if(i == nowPage ) { %>
	  					 		selected
	  					 	<%}%>
	  					>第<%=i%>页</option>
	  				<%}%>
          	</select>
	  			
	  			</td>
        </tr>
      </table>
      <p>&nbsp;</p><table width="100%" border="0" cellspacing="0" cellpadding="0">
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
<script type="text/javascript">
	
	function go(nowPage) {
		var page = parseInt(nowPage);
		var bookName = '<%=request.getAttribute("bookName")%>';
		var author = '<%=request.getAttribute("author")%>';
		var url = "<%=request.getContextPath()%>/FindBookInfoByIndexServlet?nowPage=" + page + "&bookName=" + bookName + "&author=" + author;
		window.location = url;
	}
</script>
</html>