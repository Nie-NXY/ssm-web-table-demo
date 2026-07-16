<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk"%>
<html >
<head>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>云工厂网上书城 － 网站登录</title>
<link href="css/front/coupon_register.css" rel="stylesheet" type="text/css" />
<link href="css/front/common.css" rel="stylesheet" type="text/css" />
<link href="css/front/css.css" rel="stylesheet" type="text/css" />
<script language="javascript" src="js/util.js"></script>
<script language="javascript" type="text/javascript">
	   function onkey(form){
	   		var evnt=arguments[1]||window.event;
 			var currentKey = evnt.charCode||evnt.keyCode;
		  	if (currentKey==13) { 
		  		check(form);
		  	}
	  	}
	  	
	function trim(str){
		return str.replace(/(^\s*)|(\s*$)/g, "");
	}
	var valiateUsrFlag=true;
	var valiatePwdFlag=true;
	var valiateCodeFlag=true;
	
	function checkFormSuccess(){//当用户名、密码、验证码都符合约束条件。
	if(valiateUsrFlag&&valiatePwdFlag&&valiateCodeFlag){
		var errorMsg = document.getElementById("errorMsg");
		errorMsg.innerHTML='';
        errorMsg.className='color_1';
	   }
	}
	function checkUserName(){
		var result=true;
		var errorMsg = document.getElementById("errorMsg");
		var username = document.getElementById("username");
		if(trim(username.value).length==0){
		errorMsg.innerHTML='用户名为必填项，请输入您的用户名';
        errorMsg.className='n_zc_red';
		result=false;
		valiateUsrFlag=false;
		}else{
		valiateUsrFlag=true;	
		}
		checkFormSuccess();
		return result;		
	}
			
	function checkPassword(){
	var result=true;
	var errorMsg = document.getElementById("errorMsg");
	var password = document.getElementById("password");
	if(trim(password.value).length==0&&valiateUsrFlag){//如果用户名或密码或验证码三者中有两个或者两个以上的出现了错误的情况则提示信息按照用户名、密码、验证码的优先级显示相应的提示文字
		errorMsg.innerHTML='密码为必填项，请输入您的密码';
        errorMsg.className='n_zc_red';
		result=false;
		valiatePwdFlag=false;
		}else if(trim(password.value).length < 3&&valiateUsrFlag){
		errorMsg.innerHTML='您输入的密码有误，请重新输入';
        errorMsg.className='n_zc_red';
		result=false;
		valiatePwdFlag=false;
		}else if(trim(password.value).length > 16&&valiateUsrFlag){
		errorMsg.innerHTML='您输入的密码有误，请重新输入';
        errorMsg.className='n_zc_red';
		result=false;
		valiatePwdFlag=false;
		}else{
		valiatePwdFlag=true;
		}
		checkFormSuccess();
		return result;
	}
	//校验验证码
	function validateCode(){
		var result = true;
		var checkCode = document.getElementById("randNum");
		var checkCodeMsg = document.getElementById("errorMsg");
		if(checkCode.value == ""&&valiateUsrFlag&&valiatePwdFlag){
			checkCodeMsg.innerHTML = "验证码为必填项，请输入验证码";
			checkCodeMsg.className = 'n_zc_red';
			result = false;
			valiateCodeFlag=false;
		}else if(checkCode.value.length != 4&&valiateUsrFlag&&valiatePwdFlag){
			checkCodeMsg.innerHTML = "您输入的验证码有误，请重新输入";
			checkCodeMsg.className = 'n_zc_red';
			result = false;
			valiateCodeFlag=false;
		}else{
			valiateCodeFlag=true;
		}
		checkFormSuccess();
		return result;
	}
	
	function refreshCode(){
			var img = document.getElementById("img");
			if(img){
				nowDate = new Date();
				img.src = "/validataImage.do?d="+nowDate.getTime();
			}
		}
	    //校验全部字段
    function checkAll(){
    	var result = true;
    	if(!checkUserName())
    		result = false;
   		if(!checkPassword())
    		result = false;
    	if(!validateCode())
	    	result = false;	
    	return result;
    }
			//提交
	function check(form){
		if(checkAll()){
			disableAll();
			form.submit();
		} 
    }
    
</script>
</head>

<body>
	<%Object object = session.getAttribute("fgTishi");  %>
	<div class="full">
	  
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-12246903-1']);
  _gaq.push(['_setDomainName', '.egou.com']);
  _gaq.push(['_trackPageview']);

  _gaq.push(['_setAccount', 'UA-1267821-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type ='text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' :'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0];
	s.parentNode.insertBefore(ga, s);
  })();


</script>



  <div class="t_Top">
	  	<div class="n_dl_logo"><a href="#"><img src="images/front/logo.png" border="0" /></a></div>
		<div class="n_dl_t"><span class="color_4">易购网--比价返现第一站</span></div>
		<div class="n_dl_r"><a href="/login.do" class="color_56">登录</a> <span class="color_55">|</span> <a href="/help/egou.html" class="color_56">易购新手</a> <span class="color_55">|</span> <a href="/help/" class="color_56">网站帮助</a></div>

		<div class="n_dl_l"></div>
		<div class="n_dl_l_1"></div>
	  </div>
	  <form id="login" name="login" method="post" action ="<%= request.getContextPath()%>/CustomerLoginServlet" onkeydown="onkey(this,event);">
		<div class="n_dl_c">
			<div class="n_dl_c_l">
				<div class="n_dl_c_l_a"></div>
				<div class="n_dl_c_l_b">
				<% if(object != null) {%>
					<p align="center"><font color="red">账号密码有误请重新输入！</font> </p>
				<%
					session.removeAttribute("fgTishi");  
				} %>
				<p align="center"><font color="red"></font> </p>

				  <table width="262" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="30" colspan="4"><span class="color_1" id="errorMsg"></span></td>
                    </tr>
                    
                    <tr>
                      <td width="48" height="50">用户名：</td>
                      <td height="50" colspan="3"><input type="text" name="username" id="username"  onblur="checkUserName()" value="" tabindex="1" class="input_35" />
                      <script language="javascript" type="text/javascript">
		              var msg='';
		              if(""!=msg){
		              document.getElementById("errorMsg").innerHTML=msg;
		              document.getElementById("errorMsg").className='n_zc_red';
		              }
		              </script>

                      </td>
                    </tr>
                    
                    
                    <tr>
                      <td height="50">密&nbsp;&nbsp;码：</td>
                      <td height="50" colspan="3"><input type="password" name="password" id="password"  onblur="checkPassword()" tabindex="2" class="input_35" />
                      <script language="javascript" type="text/javascript">
		              msg='';
		              if(""!=msg){
		              document.getElementById("errorMsg").innerHTML=msg;
		              document.getElementById("errorMsg").className='n_zc_red';
		              }
		              </script>
                      </td>

                    </tr><%--
                    
                    
                    <tr>
                      <td height="50">验证码：</td>
                      <td width="54" height="50"><input type="text" name="randNum" id="randNum" class="input_38" onblur="validateCode()" tabindex="3" />
                      <script language="javascript" type="text/javascript">
		              msg='';
		              if(""!=msg){
		              document.getElementById("errorMsg").innerHTML=msg;
		              document.getElementById("errorMsg").className='n_zc_red';
		              }
		              </script>
                      </td>
                      <td width="57" height="50"><img src="/validataImage.do" width="52" height="20" id="img" /></td>
                      <td width="103" height="50"><a href="javascript:refreshCode();" class="color_57">看不清楚</a></td>

                    </tr>
                    
                    --%><tr>
                      <td height="25">&nbsp;</td>
                      <td height="25" colspan="3"></td>
                    </tr>
                    <tr>
                      <td height="25">&nbsp;</td>
                      <td height="25" colspan="3"><input type="checkbox" name="memorize" value="memorize" tabindex="4" />
                      记住我&nbsp;&nbsp; <a href="/findPassword.do" class="color_57">忘记密码</a></td>

                    </tr>
                    <tr>
                      <td height="55" colspan="4" align="center"><input type="submit" name="登 录" /></td>
                    </tr>
                    <tr>
                      <td height="25" colspan="4" align="center"><!--<a href="/activityCouponObtain.do" class="color_28">已注册会员手机验证可免费领取优惠券，GO!</a> --></td>
                    </tr>
                  </table>
				</div>
				<div class="n_dl_c_l_c"></div>
			</div>
			<div class="n_dl_c_r">
				<div class="n_dl_c_r_a"></div>
				<div class="n_dl_c_r_b">
				  <table width="248" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="46" height="40" align="center"><img src="images/couponregister/icon_116.gif" width="20" height="20" /></td>
                      <td width="202" height="40" class="color_58">免费注册即刻享受购物返点!</td>

                    </tr>
                    <tr>
                      <td height="40" align="center"><img src="images/couponregister/icon_117.gif" width="23" height="20" /></td>
                      <td height="40" class="color_58">不购物也能拿现金!</td>
                    </tr>
                    <tr>
                      <td height="40" align="center"><img src="images/couponregister/icon_118.gif" width="20" height="20" /></td>
                      <td height="40" class="color_58">推荐会员，奖励现金!</td>

                    </tr>
                    <tr>
                      <td height="40" align="center"><img src="images/couponregister/icon_119.gif" width="24" height="21" /></td>
                      <td height="40" class="color_58">不间断的送优惠券!</td>
                    </tr>
                    <tr>
                      <td height="40" align="center"><img src="images/couponregister/icon_120.gif" width="18" height="22" /></td>
                      <td height="40" class="color_58">易购会员独享优惠活动!</td>

                    </tr>
                    <tr>
                      <td height="65" colspan="2" align="center"><input type="button" name="Submit2" value="立即免费注册" onclick="window.location='/memberRegister.do'" class="button_27" /></td>
                    </tr>
                  </table>
				</div>
				<div class="n_dl_c_r_c"></div>
			</div>
	  	</div>

	 </form>
		<div class="Bottom">
			

<div class="Bottom">
		<div class="Bottom_1" style="margin-top:5px"></div>
		<div class="Bottom_2">
		  <table width="950" cellspacing="0" cellpadding="0">
			<tr>
			  <td colspan="3" align="center"><a href="/help/aboutegou.html" target="_blank" class="color">关于易购</a> | <a href="/help/mediumreported.html" target="_blank" class="color">媒体报道</a> | <a href="/help/loveletter.html"  class="color_1">易购情书</a> | <a href="/help/advertisement.html" target="_blank" class="color">广告合作</a> | <a href="http://bbs.egou.com/thread.php?fid=16" target="_blank" class="color">建议疑问</a> | <a href="/help/" target="_blank" class="color">网站帮助</a> | <a href="/help/sitemap.html" target="_blank" class="color">网站地图</a> | <a href="/help/links.html" target="_blank" class="color">友情链接</a> |
	   <a href="/help/contactus.html" target="_blank" class="color">联系我们</a></td>

			  </tr>
			<tr>
			  <td width="250"></td>
			  <td width="389" align="center"><span style="color:#666666">Copyright &copy; 2004-2010 by   www.egou.com all rights reserved<br />
				<a href="http://www.emar.com.cn" target="_blank" class="color_2">亿玛在线</a> 旗下网站<a href="http://www.miibeian.gov.cn/" target="_blank" class="color_2">京ICP证080025号</a> </span></td>

			  <td width="309" height="60" align="left" valign="middle"></td>
			</tr>
		  </table>
 		</div>
	</div>

	<script language="javascript" type="text/javascript">
		var eid=getUrlValue('eid');
		var yid=getUrlValue('yid');
		var keyword=getUrlValue('keyword');
		var cookieName='';
		var cookieValue='';
		if(keyword!=''){
			if(eid!=''){
				cookieName='EqifaKeyword';
				cookieValue='_eid_'+eid+'_'+keyword;
				cookieCallback(cookieValue);	
				//encoder.encoder(cookieValue,cookieCallback);
			}else if(yid!=''){
				cookieName='YiqifaKeyword';
				cookieValue='_yid_'+yid+'_'+keyword;
				cookieCallback(cookieValue);
				//encoder.encoder(cookieValue,cookieCallback);
			}
		}
		function cookieCallback(msg){
			cookieValue=msg;
			var name=cookieName;
			var value=cookieValue;
			var expires=1;
			var path="/";
			var domain=".egou.com";
			var secure="";
			var today = new Date();    
		  	today.setTime( today.getTime() );    
		   	if (expires) {     
		       expires = expires * 1000 * 60 * 30;     
		   	}
		    var expires_date = new Date( today.getTime() + (expires));   
		    document.cookie = name+'='+(value)+((expires) ? ';expires='+expires_date.toGMTString() : '')+((path) ? ';path=' + path : '') +((domain) ? ';domain=' + domain : '')+((secure) ? ';secure' : ''); 
		}
		
		
		function getUrlValue(qs){
	        var s = location.href;
	        s = s.replace("?","?&").split("&");
	        var re = "";
	        for(i=0;i<s.length;i++){
	           if(s[i].indexOf(qs+"=")==0){
	             re = s[i].replace(qs+"=","");
	             break;
	            }
	        }
	        return re;
		}
		 
	</script>
	
	<!-- 用于sem监控 -->
	<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-12246903-1']);
  _gaq.push(['_setDomainName', '.egou.com']);
  _gaq.push(['_trackPageview']);

  _gaq.push(['_setAccount', 'UA-1267821-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();



</script>
<script type="text/javascript">

var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F977ed62600436aca38f88304752ba8c4' type='text/javascript'%3E%3C/script%3E"));
</script>

	

		</div>
</div>
</body>
</html>
