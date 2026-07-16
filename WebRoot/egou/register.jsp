<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk"%>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>云工厂网上书城 － 填写基本信息</title>
<link href="css/front/register.css" rel="stylesheet" type="text/css" />
<link href="css/front/common.css" rel="stylesheet" type="text/css" />
<link href="css/front/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/js/j.js"></script>
		<script type="text/javascript" src="js/ajax.js"></script>
		<script language="javascript" src="js/util.js"></script>

		<script type="text/javascript" src="js/front/StringLength.js"></script>
		<script type="text/javascript" src="js/front/base.js"></script>
		<script language="javascript" type="text/javascript">
		var msgs = {
			userNameMsg: '必填项，3-12字节，可以用中文',
			passwordMsg: '必填项，6-16个字符，推荐使用英文字母加数字或符号的组合密码',
			repeatPasswordMsg: '必填项，请再次输入您设置的密码，并确保两次输入一致',
			emailMsg: '必填项，请填写有效的Email地址，以方便您找回用户名和密码',
			checkCodeMsg: '必填项，请输入图中看到的数字'
		};
		
	   function isIE(){if(document.all)return true;return false;}
	   
	   function onkey(form){
	   		var evnt=arguments[1]||window.event;
 			var currentKey = evnt.charCode||evnt.keyCode;
		  	if (currentKey==13) { 
		  		check(form);
		  	}
	  	}
	   //是否字符键   
	  function   ischarkey(evn,nkey)     
	  {   
		  if(!evn.altKey&&!evn.ctrlKey&&((nkey>=65&&nkey<=90)||     
			  (nkey>=48&&nkey<=57)||(nkey>=96&&nkey<=105)||nkey==106||     
			  nkey==107||nkey==109||nkey==110||nkey==111||nkey==32||     
			  (nkey>=186&&nkey<=192)||(nkey>=219&&nkey<=222)))   
			  return   true;     
			  else     
			  return   false;     
	  }   
	   
	  	var flagPwd=true;
	   function onkeyPwd(pwd){
	    var evnt=arguments[1]||window.event;
 		var currentKey = evnt.charCode||evnt.keyCode;
	    if(ischarkey(evnt,currentKey)){
	    	var keyChar=String.fromCharCode(currentKey); 
	    	if(/\s/.test(keyChar)){
	 		 flagPwd=false;
	 		 }else if(pwd.value.length>=16){
	 		 flagPwd=false;
	 		 }else{
	 		 flagPwd=true;
	 		 }
			 if(!flagPwd&&!isIE()){
		     evnt.preventDefault();
		     }else if(!flagPwd){
		     evnt.returnValue=false;
		     }
	    }else{
	    //alert(currentKey);
	    }
	   }
	   var flagCheck=true;
	   function onkeyCheck(inputElement){//实现空白字符不能输入
	 		 var evnt=arguments[1]||window.event;
	 		 var currentKey = evnt.charCode||evnt.keyCode;
	 		 if(ischarkey(evnt,currentKey)){
	    	 var keyChar=String.fromCharCode(currentKey); 
	    	 if(/\s/.test(keyChar)){
	 		 flagCheck=false;
	 		 }else{
	 		 flagCheck=true;
	 		 }
			 if(!flagCheck&&!isIE()){
		     evnt.preventDefault();
		     }else if(!flagCheck){
		     evnt.returnValue=false;
		     }
		    }else{
		    //alert(currentKey);
		    }
		 }
		function setFocusStyle(v){
				var obj = document.getElementById(v);
				obj.className = 'n_zc_blue';
				obj.innerHTML = msgs[v];
			}
	 
		 var strLen = new StringLength();
	
		function checkUserName(){
			var result=true;
			var userNameMsg = document.getElementById("userNameMsg");
			var username = document.getElementById("username").value;
			if(''!=username){ 
				var uLength = strLen.getRealLength(username);
				if(uLength>=3 && uLength<13){
				    var filter=/^\s*[A-Za-z0-9\u4e00-\u9fa5_-]{3,12}\s*$/; 
				    if (!filter.test(username))
				    {
				     userNameMsg.innerHTML="3-12个字符(包括字母、数字、中文、下划线、中划线)";
					 userNameMsg.className = 'n_zc_red';
					 result=false;
				    }
				    else
				    {
					
					jQuery.ajax({
	 					  type: "POST",
	 					  url: "checkUserName.do",
	 				      data: "username="+username,
	 				      success: function(data){
						var result = data;
				        var userNameMsg = document.getElementById("userNameMsg");
				        if('true'==result){
				        	userNameMsg.innerHTML="用户名可用";
							userNameMsg.className = 'n_zc_green';
				        }else{
							userNameMsg.innerHTML="用户名已经被占用了，请换一个";
							userNameMsg.className = 'n_zc_red';
				        }
	 						
	 					 }
	 				});
					}
				}else{
					userNameMsg.innerHTML="3-12个字符(包括字母、数字、中文、下划线、中划线)";
					userNameMsg.className = 'n_zc_red';
					result=false;
				}
			}else{
				userNameMsg.innerHTML="3-12个字符(包括字母、数字、中文、下划线、中划线)";
				userNameMsg.className = 'n_zc_red';
				result=false;
			}
			return result;
		}
		
		function callback(req){
			return function (){
				if (req.readyState == 4) {
					if (req.status == 200) {
				        var result = req.responseText;
				        var userNameMsg = document.getElementById("userNameMsg");
				        if('true'==result){
				        	userNameMsg.innerHTML="用户名可用";
							userNameMsg.className = 'n_zc_green';
				        }else{
							userNameMsg.innerHTML="用户名已经被占用了，请换一个";
							userNameMsg.className = 'n_zc_red';
				        }
				        
			        }
				}
			}
		}
		    //密码的校验(第一个)
    function checkPassword(){
    	var result = true;
    	var password = document.getElementById("password");
    	var passwordMsg = document.getElementById("passwordMsg");
    	//第一步，password应满足不包含空白字符
    	if(password.value.search(/\s/g) != -1){
    		passwordMsg.innerHTML = "密码只能使用英文字母、数字和符号";
    		passwordMsg.className = 'n_zc_red';
    		result = false;
    	}else{
			//第二步，password应满足"长度在6至16位之间"
	    	if(password.value.length < 6){
	    		passwordMsg.innerHTML = "您的密码太短，密码至少为6个字符";
	    		passwordMsg.className = 'n_zc_red';
	    		result = false;
	    	}else if(password.value.length > 16){
	    		passwordMsg.innerHTML = "密码最多为16个字符";
	    		passwordMsg.className = 'n_zc_red';
	    		result = false;
	    	}else{
	    		//如果以上两步合规则，那么password的输入是合法的.
	    		passwordMsg.innerHTML = "密码填写正确";
	    		passwordMsg.className = 'n_zc_green';
	    		//最后一步，检查确认密码是否与密码一致
	    	}
	    }
    	return result;
    }
    
 //密码的校验
    function checkRePassword(){
    	var result = true;
    	var password = document.getElementById("password");
    	var repassword = document.getElementById("repeatPassword");
    	var repasswordMsg = document.getElementById("repeatPasswordMsg");
   		if(password.value != repassword.value || repassword.value==""){
    		repasswordMsg.innerHTML = "两次输入的密码不一致，请重新输入";
    		repasswordMsg.className = 'n_zc_red';
    		result = false;
    	}else{
    		repasswordMsg.innerHTML = "填写正确";
    		repasswordMsg.className = 'n_zc_green';
    	}
    	return result;
    }
    
	   function isEmail(s)   
				{   
				var emailRegS=/^([a-zA-Z0-9_\-\.\+]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
				//var emailRegM=/^((([a-zA-Z0-9_\-\.\+]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)([;]))+)(([a-zA-Z0-9_\-\.\+]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?))$/;  
				if (!emailRegS.exec(s)){
					 return false ;
				}
				return true  ;
				}
		function checkEmail(){
			var result = true;
			var email = document.register.email.value;
			var emailMsg = document.getElementById("emailMsg");
			if(''!=email){ 
				if(isEmail(email)){
					var req = getHttpRequest();
					if(req){
						req.onreadystatechange = callbackEmail(req);
						var url = 'checkEmail.do?email='+email
						req.open("POST",url,true );
		 				req.send(null);
					}
				}else{
					emailMsg.innerHTML = "Email格式不正确， 请输入正确的Email地址，如：myname@163.com";
    				emailMsg.className = 'n_zc_red';
					result=false;
				}
			}else{
				emailMsg.innerHTML = "Email格式不正确， 请输入正确的Email地址，如：myname@163.com";
    			emailMsg.className = 'n_zc_red';
    			result=false;
			}
			return result;
		}
		function callbackEmail(req){
			return function (){
				if (req.readyState == 4) {
					if (req.status == 200) {
				        var result = req.responseText;
				        var emailMsg = document.getElementById("emailMsg");
				        if('true'==result){
				        	emailMsg.innerHTML = "填写正确";
    						emailMsg.className = 'n_zc_green';
				        	
				        }else{
				        emailMsg.innerHTML = "该Email地址已被注册，请换一个";
    					emailMsg.className = 'n_zc_red';
				        }
			        }
				}
			}
		}
		
			//校验验证码
	function validateCode(){
		var result = true;
		var checkCode = document.getElementById("randNum");
		var checkCodeMsg = document.getElementById("checkCodeMsg");
		if(checkCode.value == ""){
			checkCodeMsg.innerHTML = "您输入的验证码错误，请重新输入";
			checkCodeMsg.className = 'n_zc_red';
			result = false;
		}else if(checkCode.value.length != 4){
			checkCodeMsg.innerHTML = "验证码为4位，请重新输入";
			checkCodeMsg.className = 'n_zc_red';
			result = false;
		}
		else{//验证码格式正确
    		checkCodeMsg.className = '';
    		checkCodeMsg.innerHTML = "";
		}
		return result;
	}
	
		function refreshCode(){
			var img = document.getElementById("img");
			if(img){
				nowDate = new Date();
				img.src = "/validataImage.do?d="+nowDate.getTime();
			}
		}
		
		//提交
	function check(form){
		if(!form.checked.checked){
				return false;
			}
		if(checkAll()){
			disableAll();
			form.action = '/memberRegister.do';
			form.submit();
		} 
    }
    
    //校验全部字段
    function checkAll(){
    	var result = true;
    	if(!checkUserName())
    		result = false;
   		if(!checkPassword())
    		result = false;
    	if(!checkRePassword())
    		result = false;
    	if(!checkEmail())
    		result = false;
    	if(!validateCode())
	    	result = false;	
    	return result;
    }
    function changeStatus(){
    
    }
    
	</script>

       
</head>

<body onload="changeStatus();">
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
	  	<div class="n_dl_logo"><img src="images/front/logo.png" border="0" /></div>
		<div class="n_dl_t"><span class="color_4">云工厂--更多精彩欢迎您</span></div>
		<div class="n_dl_r"><a href="/login.do" class="color_56">登录</a> <span class="color_55">|</span> 易购新手 <span class="color_55">|</span> 网站帮助</div>

		<div class="n_dl_l"></div>
		<div class="n_dl_l_1"></div>
	  </div>
	  <div class="n_dl_c">
	  	<div class="n_dl_yz"><img src="images/front/regis_t.gif" /></div>
		<!-- <ul class="n_zc_yz_1">
				<li>
					<div class="n_zc_yz_1_a">1.填写基本信息</div>
				</li>
				<li>
					<div class="n_zc_yz_1_b">2.手机验证领取优惠券 (可选)</div>
				</li>
				<li>
					<div class="n_zc_yz_1_b">3.注册成功</div>
				</li>
			</ul> 
	   -->
		<div style="clear:both"></div>
		<div class="n_zc">
		<form method="post" id="register" action="<%=request.getContextPath()%>/CustomerRegister" name="register" onkeydown="onkey(this,event);">

				<input name="vid" type="hidden" value="" />
				<input name="cid" type="hidden" value="" />
				<input name="wid" type="hidden" value="" />
				<input name="vwid" type="hidden" value="" />
				<input name="fbt" type="hidden" value="" />
		  <table width="780" border="0" cellspacing="0" cellpadding="0">
		  
            <tr>
              <td width="89" height="40" align="right">用户名：</td>

              <td height="40" colspan="3"><input type="text" id="username" name="username" class="input_35" value="" onblur="checkUserName()" onfocus="setFocusStyle('userNameMsg');" 
               tabindex="1" onkeydown="onkeyCheck(this,event);"
               onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"   autocomplete=off   ondragenter="javascript:return false;"   onpaste="return false" />
              </td>
              <td width="19" height="40" align="center" class="color_1">*</td>
              <td width="465" height="40"><span class="color_4" id="userNameMsg">3-12个字符(包括字母、数字、中文、下划线、中划线)</span>
              <script language="javascript" type="text/javascript">
              var msg='';
              if(""!=msg){
              document.getElementById("userNameMsg").innerHTML=msg;
              }
              </script>
              </td>
            </tr>

           
           
            <tr>
              <td height="40" align="right">密码：</td>
              <td height="40" colspan="3"><input type="password" name="password" id="password" onfocus="setFocusStyle('passwordMsg')" onblur="checkPassword()" class="input_35" 
              tabindex="2"   onkeydown="onkeyPwd(this,event);"
              onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"   autocomplete=off   ondragenter="javascript:return false;"   onpaste="return false" />
              </td>
              <td height="40" align="center" class="color_1">*</td>
              <td height="40"><span class="color_4" id="passwordMsg" >6-16个字符，推荐使用英文字母加数字或符号的组合密码</span>
              <script language="javascript" type="text/javascript">
              msg='';
              if(""!=msg){
              document.getElementById("passwordMsg").innerHTML=msg;
              }
              </script>

              </td>
            </tr>
           
           
            <tr>
              <td height="40" align="right">确认密码：</td>
              <td height="40" colspan="3"><input type="password" name="repeatPassword" id="repeatPassword" onfocus="setFocusStyle('repeatPasswordMsg')" onblur="checkRePassword()"  class="input_35" 
              tabindex="3" onkeydown="onkeyPwd(this,event);"
              onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))"   autocomplete=off   ondragenter="javascript:return false;"   onpaste="return false" />
              </td>
              <td height="40" align="center"><span class="color_1">*</span></td>
              <td height="40"><span class="color_4" id="repeatPasswordMsg">请再次输入您设置的密码，并确保两次输入一致</span>

              <script language="javascript" type="text/javascript">
              msg='';
              if(""!=msg){
              document.getElementById("repeatPasswordMsg").innerHTML=msg;
              }
              </script>
              </td>
            </tr>
             
            
            <tr>
              <td height="40" align="right">Email地址：</td>
              <td height="40" colspan="3"><input type="text" name="email" id="email" value="" onfocus="setFocusStyle('emailMsg')" onblur="checkEmail()"  class="input_35" 
              tabindex="4" onkeydown="onkeyCheck(this,event);"
              />
              </td>
              <td height="40" align="center"><span class="color_1">*</span></td>

              <td height="40"><span class="color_4" id="emailMsg">请填写有效的Email地址，以方便您找回用户名和密码</span>
              <script language="javascript" type="text/javascript">
              msg='';
              if(""!=msg){
              document.getElementById("emailMsg").innerHTML=msg;
              }
              </script>
              </td>
            </tr>
            
            
            <%--<tr>
              <td height="40" align="right">　验证码：</td>
              <td width="73" height="40"><input type="text" name="randNum" id="randNum"  onfocus="setFocusStyle('checkCodeMsg')" onblur="validateCode()" class="input_36" 
              tabindex="5" onkeydown="onkeyCheck(this,event);"
              />

              </td>
              <td width="73"><img src="/validataImage.do" width="60" height="20" id="img" /></td>
              <td width="61"><a href="javascript:refreshCode();" class="color_22">换一张</a></td>
              <td height="40" align="center"><span class="color_1">*</span></td>
              <td height="40"><span class="color_4" id="checkCodeMsg" ></span>
              <script language="javascript" type="text/javascript">
              msg='';
              if(""!=msg){
              document.getElementById("checkCodeMsg").innerHTML=msg;
              }
              </script>
              </td>

            </tr>
            
            --%><tr><%--
              --%><input type="hidden" name="_finish" /> 	
              <td height="80" colspan="6" align="center"><input type="submit" id="submitBtn" name="新用户注册" /></td>
            </tr>
            <tr>
              <td height="50" colspan="6" align="center"><input type="checkbox" name="checked" value="checkbox" checked="checked" id="checked" tabindex="6" />
              我已经阅读并同意 <a href="/html/user_protocol.jsp" target="_blank" class="color_59">个人会员注册服务协议条款</a> </td>

            </tr>
          </table>
          </form>
		</div>
		</div>
	  
		<div class="Bottom">
		

<div class="Bottom">
		<div class="Bottom_1" style="margin-top:5px"></div>
		<div class="Bottom_2">

		  <table width="950" cellspacing="0" cellpadding="0">
			<tr>
			  <td colspan="3" align="center"><a href="help/aboutegou.html" target="_blank" class="color">关于易购</a> | <a href="/help/mediumreported.html" target="_blank" class="color">媒体报道</a> | <a href="help/loveletter.html"  class="color_1">易购情书</a> | <a href="/help/advertisement.html" target="_blank" class="color">广告合作</a> | <a href="http://bbs.egou.com/thread.php?fid=16" target="_blank" class="color">建议疑问</a> | <a href="/help/" target="_blank" class="color">网站帮助</a> | <a href="/help/sitemap.html" target="_blank" class="color">网站地图</a> | <a href="/help/links.html" target="_blank" class="color">友情链接</a> |
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
