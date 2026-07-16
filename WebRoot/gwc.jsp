<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="cn.key.gwc.Gwc"%>
<%@page import="cn.key.gwc.GwcItem"%>
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
<title>购物车详细信息 - 云工厂网上书店</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>

<jsp:include page="fgLeft.jsp"></jsp:include>
	<td>
 <%
	float ygcSum = 0;
	float sum = 0; 
 %>
<table width="662" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td> 
      <div align="center" class="wr4"><b><font color="#BA6119">您的购物车详细信息</font></b></div>
    </td>
  </tr>
  <tr> 
    <td><img src="images/hb10.gif" width="662" height="41"></td>
  </tr>
  <tr> 
    <td background="images/hb01.gif" bgcolor="#FEFFEF"> 
      <table width="80%" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <%Gwc gwc = (Gwc)session.getAttribute("gwc");
	        if(gwc == null || gwc.getItems().size() == 0) {%>
	        	<p align="center" class="wr4"><font color="#FF0000">您还没有购买商品请点击<a href="<%=request.getContextPath()%>/FindBookTypeServlet">这里</a>购买</font></p>
      		<%}else{
				Collection<GwcItem> items = gwc.getItems();%>
	        
		      <table width="600" border="0" cellspacing="1" cellpadding="5" align="center" bgcolor="#000000">
		        <tr align="center" bgcolor="#FEFFEF"> 
		          <td class="wr4" width="30">序号</td>
		          <td class="wr4" width="145">书名</td>
		          <td class="wr4" width="70">数量</td>
		          <td class="wr4" width="80">原价</td>
		          <td class="wr4" width="80">云工厂价</td>
		          <td class="wr4" width="80">小计</td>
		          <td class="wr4" width="80">节省</td>
		          <td class="wr4" width="35">删除${sessionScope.gwc.size}</td>
		        </tr>
	        	<%for(GwcItem item : items) {
	        	ygcSum += item.getYgcPrice() * item.getNum();
	        	sum += item.getPrice() * item.getNum();
	        	%>
	        	<tr bgcolor="#FEFFEF"> 
		          <td class="wr4" width="30"><%=item.getBookId()%></td>
		          <td class="wr4" width="145"><%=item.getBookName()%></td>
		          <td class="wr4" width="70"><input size="3" value="<%=item.getNum()%>" onchange="changeNum(this,<%=item.getBookId()%>)"></td>
		          <td class="wr4" width="80"><%=item.getPrice()%></td>
		          <td class="wr4" width="80"><%=item.getYgcPrice()%></td>
		          <td class="wr4" width="80"><%=(item.getYgcPrice() * item.getNum())%></td>
		          <td class="wr4" width="80"><%=(item.getPrice() * item.getNum() - item.getYgcPrice() * item.getNum())%></td>
		          <td class="wr4" width="35"><a href="<%=request.getContextPath()%>/GwcServlet?type=delete&id=<%=item.getBookId()%>" onclick="return isDelete('<%=item.getBookName() %>');">删除</a></td>
		        </tr>
        <%}%>
      </table>
      <table width="600" border="0" cellspacing="0" cellpadding="5" align="center">
        <tr> 
          <td class="wr4"> 
            <p>云工厂价总计：<font color="#FF0000"><%=ygcSum%></font> 元　　　总计节省了：<font color="#FF0000"><%=(sum-ygcSum)%></font> 
              元</p>
          </td>
        </tr>
        <tr> 
          <td class="wr4"> 
            <hr width="100%" size="1" noshade>
          </td>
        </tr>
      </table>
      <table border="0" cellspacing="0" cellpadding="1" align="center" height="21" width="38%">
        <tr> 
          <td background="images/h08.gif" class="wr4" width="74"> 
            <div align="center"><a href="<%=request.getContextPath()%>/FindBookTypeServlet">继续购买</a></div>
          </td>
          <td class="wr4" width="15">&nbsp;</td>
          <td background="images/h08.gif" class="wr4" width="74"> 
            <div align="center"><a href="<%= request.getContextPath()%>/IsLoginServlet">结帐</a></div>
          </td>
         <td class="wr4" width="15">&nbsp;</td>
          <td background="images/h08.gif" class="wr4" width="74"> 
            <div align="center"><a href="<%=request.getContextPath()%>/GwcServlet?type=clear" onclick="return isClear();">清空购物车</a></div>
          </td>
        </tr>
      </table>
      <%} %>
    </td>
  </tr>
  <tr> 
    <td><img src="images/hb05.gif" width="662" height="10"></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td> 
      <div align="center"> 
        <p><img src="images/daodu36.gif" width="593" height="58" alt="广告区"></p>
        <p class="wr1">淘书秀 | 寻书登记 | 好书快讯 | 文化沙龙 | 书店平台<br>
          关于书店 | 意见箱 | 联系我们</p>
      </div>
    </td>
  </tr>
</table>
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
<script type="text/javascript">
	function isDelete(bookName) {
		return confirm("您确定要删除 ["+bookName+"] 吗？");
	}
	function isClear() {
		return confirm("您确定要清空购物车吗？");
	}
	function changeNum(text,id){
		if(isNaN(text.value)) {
			alert("商品数量必须为数字！");
			return;
		}
		var num = parseInt(text.value);
		if(num < 1) {
			alert("商品数量不能小于1");
			return;
		}
		var url = "<%=request.getContextPath()%>/GwcServlet?type=updateNum&id=" + id + "&num=" + num;
		window.location = url;
	}
</script>
</body>
</html>
