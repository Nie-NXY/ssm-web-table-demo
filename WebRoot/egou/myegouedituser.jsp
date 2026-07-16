<%@ page language="java" import="java.util.*" contentType="text/html; charset=gbk"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>我的易购 －易购网 － 中国领先的在线导购社区门户！</title>
<link href="css/front/css.css" rel="stylesheet" type="text/css" />
<link href="css/front/common.css" rel="stylesheet" type="text/css" />
<link href="css/front/css_1.css" rel="stylesheet" type="text/css" />
<link href="css/front/myegou.css" rel="stylesheet" type="text/css" />
<link href="css/front/top.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/j.js"></script>
<script type="text/javascript" src="js/districtor.js"></script>

<script type="text/javascript" language="javascript" src="/js/dateOrder.js"></script>
<script type="text/javascript" src="/js/front/StringLength.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#province").area("city");
	$("#city").area("region");
});

function isEmail(s)   
{   
var emailRegS=/^([a-zA-Z0-9_\-\.\+]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
//var emailRegM=/^((([a-zA-Z0-9_\-\.\+]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)([;]))+)(([a-zA-Z0-9_\-\.\+]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?))$/;  
if (!emailRegS.exec(s)){
	 return false ;
}
return true  ;
}
function isNum(s)   
{   
var numRegS=/^[0-9]*$/;
//var emailRegM=/^((([a-zA-Z0-9_\-\.\+]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)([;]))+)(([a-zA-Z0-9_\-\.\+]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?))$/;  
if (!numRegS.exec(s)){
	 return false ;
}
return true  ;
}
function check(){
	var nickName=$("#nickName").val();
	var profession=$("#profession").val();
	var qq=$("#qq").val();
	var msn=$("#msn").val();
	var birthday=$("#birthday").val();
	var selfIntroduction=$("#selfIntroduction").val();
	var aliwangwang=$("#aliwangwang").val();
	if(!checkLength(nickName,20,"昵称的长度最长为20个字符")||!checkLength(profession,20,"职业的长度最长为20个字符")
			||!checkLength(qq,20,"QQ的长度最长为20个字符")||!checkLength(msn,50,"msn的长度最长为50个字符")
			||!checkLength(aliwangwang,20,"阿里旺旺的长度最长为20个字符")
			||!checkLength(selfIntroduction,200,"自我介绍的长度最长为200个字符")){
		return false;
	}
	if(birthday!=""&&!compareDate(birthday)){
		alert("请正确输入生日,生日不能大于今天");
		return false;
	}
	if(qq!=''&&!isNum(qq)){
		alert("请正确输入qq");
		return false;
	}

	if(msn!=''&&!isEmail(msn)){
		alert("请正确输入msn");
		return false;
	}

	
	
	$("#provinceName").val("");
	$("#cityName").val("");
	$("#regionName").val("");
	var provinceName=$("#province option:selected").html();
	var cityName=$("#city option:selected").html();
	var regionName=$("#region option:selected").html();
	if(provinceName=="请选择"||cityName=="请选择"||regionName=="请选择"){
		$("#region option[value=0]").attr("selected","true");
		$("#city option[value=0]").attr("selected","true");
		$("#province option[value=0]").attr("selected","true");
		provinceName="";
		cityName="";
		region="";
	}
	$("#provinceName").val(provinceName);
	$("#cityName").val(cityName);
	$("#regionName").val(regionName);
	return true;
}
function checkLength(value,length,message){
	  var strLen = new StringLength();
	  if(strLen.getRealLength(value)>length){
	    	alert(message);
	  		return false;
		}else{
			return true;
		}			
}
function compareDate(DateOne){
	var OneMonth = DateOne.substring(5,DateOne.lastIndexOf ("-"));
	var OneDay = DateOne.substring(DateOne.length,DateOne.lastIndexOf ("-")+1);
	var OneYear = DateOne.substring(0,DateOne.indexOf ("-"));
	
	var dateObj = new Date();
	var year = dateObj.getFullYear();
		var month = dateObj.getMonth()+1;
		var date = dateObj.getDate();
		
	if (Date.parse(OneMonth+"/"+OneDay+"/"+OneYear) <= Date.parse(month+"/"+date+"/"+year)){
	    
		return true;
	}else{
		
		return false;
	}
}
</script>
</head>
 
<body>
	
















	
<link href="css/index/top.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/langdingpage.js"></script>
<script type="text/javascript">document.write('<iframe id="publicheader" src="http://www.egou.com/publicheader.jsp?referer=' + escape(top.location) + '" allowTransparency="true" frameborder=0  width="100%" scrolling=no height="118px" topmargin="0" leftmargin="0"></iframe>');</script>
	
<div style="clear:both"></div>

<div class="my_jpg"></div>
<div style="clear:both"></div>
	<div class="my">
		
















	
<div class="my_l">
			<div class="my_l_1">

				<div class="my_l_1_a"></div>
				<div class="my_l_1_b">
					<div class="my_l_1_b_1">
						<div class="my_l_1_b_1_a"><a href="#" onclick="javascript:amenuAct(1);"><img src="images/front/my_9.jpg" border="0" id="abutton" /></a></div>

						<div class="my_l_1_b_1_b"><strong><span class="color">账户管理</span></strong></div>
					</div>
					<ul class="my_l_1_b_2" id="amenu1">
						<li><div id="_a1" class="my_l_1_b_2_a"><a href="/myegoupay.do" class="color_4">提现申请</a></div></li>
						<li><div id="_a2" class="my_l_1_b_2_a"><a href="/myegouwealth.do" class="color_4">我的财富</a></div></li>
						<li><div id="_a3" class="my_l_1_b_2_a"><a href="/myegoureward.do" class="color_4">我的奖励</a></div></li>
						<li><div id="_a4" class="my_l_1_b_2_a"><a href="/myegoucoin.do" class="color_4">我的易币</a></div></li>

						<li><div id="_a5" class="my_l_1_b_2_a"><a href="/myegoucoinhistory.do" class="color_4">易币兑换历史</a></div></li>
					</ul>
					<div style="clear:both"></div>
					<div class="my_l_1_b_1">
						<div class="my_l_1_b_1_a"><a href="#" onclick="javascript:pmenuAct(1);"><img src="images/front/my_9.jpg" border="0" id="pbutton" /></a></div>
						<div class="my_l_1_b_1_b"><strong><span class="color">购物返点</span></strong></div>
					</div>
					<ul class="my_l_1_b_2" id="pmenu1">

						<li><div id="_a6" class="my_l_1_b_2_a"><a href="/myegousubmitorder.do" class="color_4">提交订单</a></div></li>
						<li><div id="_a7" class="my_l_1_b_2_a"><a href="/myegouorder.do" class="color_4">我的订单</a></div></li>
						<li><div id="_a8" class="my_l_1_b_2_a"><a href="/myegoutracearticle.do" class="color_4">单品追踪</a></div></li>
						<li><div id="_a9" class="my_l_1_b_2_a"><a href="/myegoutraceorder.do" class="color_4">即时查询</a></div></li>
					</ul>
					<div style="clear:both"></div>
					<div class="my_l_1_b_1">

						<div class="my_l_1_b_1_a"><a href="#" onclick="javascript:qmenuAct(1);"><img src="images/front/my_9.jpg" border="0" id="qbutton" /></a></div>
						<div class="my_l_1_b_1_b"><strong><span class="color">个人信息</span></strong></div>
					</div>
					<ul class="my_l_1_b_2" id="qmenu1"><!--

                        <li><div id="_a13" class="my_l_1_b_2_a"><a href="http://bbs.egou.com/memcp.php" class="color_4">个人资料</a></div></li>   
						--><li><div id="_a13" class="my_l_1_b_2_a"><a href="/myegouedituser.do" class="color_4">个人资料</a></div></li>
						<li><div id="_a11" class="my_l_1_b_2_a"><a href="/myegoupassword.do" class="color_4">密码管理</a></div></li>
						<li><div id="_a10" class="my_l_1_b_2_a"><a href="/myegouuseraddress.do" class="color_4">收货地址</a></div></li>
					</ul>

					<div style="clear:both"></div>
					<div class="my_l_1_b_1">
						<div class="my_l_1_b_1_a"><a href="#" onclick="javascript:omenuAct(1);"><img src="images/front/my_9.jpg" border="0" id="obutton" /></a></div>

						<div class="my_l_1_b_1_b"><strong><span class="color">特色服务</span></strong></div>
					</div>
					<ul class="my_l_1_b_2" id="omenu1">
						<li><div id="_a12" class="my_l_1_b_2_a"><a href="/myegouexpresslist.do" class="color_4">快递查询</a></div></li>

						<li><div class="my_l_1_b_2_a"><a href="/union.html" class="color_4">网赚联盟</a></div></li>
						<li><div class="my_l_1_b_2_a"><a href="http://caipiao.egou.com" class="color_4">买彩票</a></div></li>
					</ul>

					<div style="clear:both"></div>
				</div>
			</div>
		</div>

<script type="text/javascript">
	var menuId=13;
	if(menuId!=-1){
		var html=$("#_a"+menuId+" a").html();
		$("#_a"+menuId).html(html);
		document.getElementById("_a"+menuId).className="my_l_1_b_2_a my_l_1_b_2_bj";
		//$("#_a"+menuId).css("my_l_1_b_2_a my_l_1_b_2_bj");
	}
	
</script>		

<script type="text/javascript">
	function amenuAct(mid)
	{
	var stat;
	stat=document.getElementById("amenu"+mid).style.display;
	if (stat=="none") {
		document.getElementById("amenu"+mid).style.display='block';
		document.getElementById("abutton").src='/images/front/my_9.jpg';
	} else {
		document.getElementById("amenu"+mid).style.display='none';
		document.getElementById("abutton").src='/images/front/my_10.jpg';
	}
	return;

	}

	
	function pmenuAct(mid)
	{
	var stat;
	stat=document.getElementById("pmenu"+mid).style.display;
	if (stat=="none") {
		document.getElementById("pmenu"+mid).style.display='block';
		document.getElementById("pbutton").src='/images/front/my_9.jpg';
	} else {
		document.getElementById("pmenu"+mid).style.display='none';
		document.getElementById("pbutton").src='/images/front/my_10.jpg';
	}
	return;

	}
	
	function qmenuAct(mid)
	{
	var stat;
	stat=document.getElementById("qmenu"+mid).style.display;
	if (stat=="none") {
		document.getElementById("qmenu"+mid).style.display='block';
		document.getElementById("qbutton").src='/images/front/my_9.jpg';
	} else {
		document.getElementById("qmenu"+mid).style.display='none';
		document.getElementById("qbutton").src='/images/front/my_10.jpg';
	}
	return;

	}
	
	function omenuAct(mid)
	{
	var stat;
	stat=document.getElementById("omenu"+mid).style.display;
	if (stat=="none") {
		document.getElementById("omenu"+mid).style.display='block';
		document.getElementById("obutton").src='/images/front/my_9.jpg';
	} else {
		document.getElementById("omenu"+mid).style.display='none';
		document.getElementById("obutton").src='/images/front/my_10.jpg';
	}
	return;

	}
</script>
	  <div class="my_r_a">
	  	<div class="my_r_a_1">个人资料</div>
		<div class="my_r_a_2"></div>
		<div class="my_r_a_3">
		  <table width="768" cellspacing="0" cellpadding="0">
            <tr>

              <td colspan="2" valign="bottom"><div class="my_r_a_14"><img width="100px" src="http://ucenter.egou.com/avatar.php?uid=963590&size=middle" /></div>                </td>
              <td width="77" valign="bottom"><div class="my_r_a_15"><img width="50px" src="http://ucenter.egou.com/avatar.php?uid=963590&size=small" /></div></td>
              <td width="560" valign="bottom"><div class="my_r_a_16"><img width="25px" src="http://ucenter.egou.com/avatar.php?uid=963590&size=small" /></div></td>
            </tr>
            <tr>
              <td width="102" height="45" align="center"><input type="button" name="Submit22" value="修改头像" class="button_28" onclick="window.open('http://bbs.egou.com/memcp.php');" /></td>
              <td width="27" height="45">&nbsp;</td>
              <td height="45" colspan="2">&nbsp;</td>

            </tr>
          </table>
		</div>
		<div class="my_r_a_3">
		<form method="post" id="form" onsubmit="return check()"> 
		  <table width="768" cellspacing="0" cellpadding="0">
            <tr>
              <td width="70" height="30" align="right">用户名:</td>
              <td height="30" colspan="2">hengyufxh1</td>

              <td width="57" height="30" align="right">昵称:</td>
              <td width="125" height="30">
              
              <input type="text" id="nickName" name="nickName" value="" class="input_12" />
              
              
              </td>
              <td width="39" height="30">&nbsp;</td>
              <td width="36" height="30">&nbsp;</td>
              <td width="36" height="30">&nbsp;</td>
              <td width="36" height="30">&nbsp;</td>

              <td width="45" height="30">&nbsp;</td>
            </tr>
            <tr>
              <td height="30" align="right">性别:</td>
              <td height="30" colspan="2">
                
                <input type="radio" name="sex" value="male" /> 男
                <input type="radio" name="sex" value="female"  />女</td>
                
              <td height="30" align="right">出生日期:</td>

              <td height="30" colspan="4">
				 
					<input  maxlength="10" class="input_12" id="birthday" type="text"  name="birthday" onfocus="setday(this)" value=""/>
		            
				
			</td>
            </tr>
            
            <tr>
              <td height="30" align="right">婚恋状态:</td>
              <td height="30" colspan="2">
              
			  	<select name="loveStatus" class="input_15">

			  	  <option value="0">保密</option>
			  	  <option value="1" >非单身</option>
			  	  <option value="2" >单身</option>
			  	</select>			
			  	
			  	</td>
              <td height="30" align="right">血型:</td>
              <td height="30" colspan="6">

               
				  <select name="bloodType" class="input_15">
					<option value="0">保密</option>
					<option value="1" >
						A
					</option>
					<option value="2" >
						B
					</option>
					<option value="3" >

						AB
					</option>
					<option value="4" >
						O
					</option>
				  </select>			  
				  
				  </td>
            </tr>
            
            <tr>
              <td height="30" align="right">教育程度:</td>

              <td height="30" colspan="2">
              
	           <select name="eduDegree" class="input_15">
                <option value="0">请选择</option>
                <option value="1" >小学</option>
                <option value="2"  >初中</option>
				<option value="3" >中专/技校</option>
				<option value="4" >高中</option>

				<option value="5" >大专</option>
				<option value="6" >本科</option>
				<option value="7" >硕士</option>
				<option value="8" >博士</option>
				<option value="9" >博士后</option>
              </select>

              
              </td>
              <td height="30" align="right">职业:</td>
              <td height="30" colspan="6">
              
              <input type="text" id="profession" name="profession" value="" class="input_12" />
              
              </td>
            </tr>
           
            <tr>
              <td height="30" align="right">所在城市:</td>

              <td width="125" height="30">
               <input type="hidden" id="provinceName" name="provinceName"/>
               
			  	 <select name="provinceId" id="province" class="input_15">
			         <option value="0">请选择 </option>
						
							<option value="10000"  >北京</option>
					   
							<option value="20000"  >上海</option>
					   
							<option value="30000"  >重庆</option>

					   
							<option value="40000"  >天津</option>
					   
							<option value="50000"  >河北</option>
					   
							<option value="60000"  >山西</option>
					   
							<option value="70000"  >内蒙古</option>
					   
							<option value="80000"  >辽宁</option>
					   
							<option value="90000"  >吉林</option>

					   
							<option value="100000"  >黑龙江</option>
					   
							<option value="110000"  >江苏</option>
					   
							<option value="120000"  >浙江</option>
					   
							<option value="130000"  >安徽</option>
					   
							<option value="140000"  >福建</option>
					   
							<option value="150000"  >江西</option>

					   
							<option value="160000"  >山东</option>
					   
							<option value="170000"  >河南</option>
					   
							<option value="180000"  >湖北</option>
					   
							<option value="190000"  >湖南</option>
					   
							<option value="200000"  >广东</option>
					   
							<option value="210000"  >广西</option>

					   
							<option value="220000"  >海南</option>
					   
							<option value="230000"  >云南</option>
					   
							<option value="240000"  >四川</option>
					   
							<option value="250000"  >贵州</option>
					   
							<option value="260000"  >西藏</option>
					   
							<option value="270000"  >陕西</option>

					   
							<option value="280000"  >甘肃</option>
					   
							<option value="290000"  >宁夏</option>
					   
							<option value="300000"  >新疆</option>
					   
							<option value="310000"  >青海</option>
					   
							<option value="320000"  >台湾</option>
					   
							<option value="330000"  >香港</option>

					   
							<option value="340000"  >澳门</option>
					   
			       </select>
			       
			       
			       </td>
              <td width="197" height="30">
              <input type="hidden" id="cityName" name="cityName"/>
              
			  	 <select name="cityId" id="city" class="input_15">
			       		<option value="0">请选择 </option>
			       		
			       </select>

			       
			       <input type="hidden" id="regionName" name="regionName"/>
			       
			     <select name="regionId" id="region" class="input_15">
			       <option value="0">请选择 </option>
			       		
			       </select>
			       
			   </td>
              <td height="30" align="right">发质:</td>
              <td height="30" colspan="6">
               
				  <select name="hair" class="input_15">

				      <option value="0">请选择</option>
					  <option value="1" >中性</option>
					  <option value="2" >混合性</option>
					  <option value="3" >油性</option>
					  <option value="4" >干性</option>
					  <option value="5" >过敏性</option>

				  </select>			  
				  
				  </td>
            </tr>
             
            <tr>
              <td height="30" align="right">QQ号码:</td>
              <td height="30">
              
              <input type="text" id="qq" name="qq" value="" class="input_12" />
              
              </td>
              <td height="30">

                
              <input type="checkbox" name="qqOnlyFriendShow" value="1" />
              
              仅好友可见</td>
              <td height="30" align="right">MSN:</td>
              <td height="30">
              
              <input type="text" id="msn" name="msn" value="" class="input_12" />
              
              </td>
              <td height="30" colspan="5">
              
              <input type="checkbox" name="msnOnlyFriendShow" value="1" />

              
                                    仅好友可见</td>
            </tr>
            
            <tr>
              <td height="30" align="right">阿里旺旺:</td>
              <td height="30">
              
              <input type="text" id="aliwangwang" name="aliwangwang" value="" class="input_12" />
              
              </td>
              <td height="30"> 
              <input type="checkbox" name="aliOnlyFriendShow" value="1" />

               仅好友可见</td>
              <td height="30" align="right">Email:</td>
              <td height="30">
              
            <input type="text"  readonly="readonly" value="hengyufxh1@163.com" class="input_12" />
               
              </td>
              <td height="30" colspan="5"> 
              <input type="checkbox" name="emailOnlyFriendShow" value="1" />
               仅好友可见</td>

            </tr>
           
           <tr>
              <td height="30" align="right">自我介绍:</td>
              <td height="30" colspan="9"><span class="color_19">200字节以内</span></td>
            </tr>
            <tr>
              <td align="right">&nbsp;</td>
              <td colspan="9">

              
              <textarea name="selfIntroduction" id="selfIntroduction" class="input_54"></textarea>
              
              </td>
            </tr>
      
            <tr>
              <td height="45" align="right">&nbsp;</td>
              <td height="45" colspan="9"><input type="submit" name="Submit2" value="保存设置" class="button_28" /></td>
            </tr>
          </table>

          </form>
		</div>
	  </div>
	</div>
	<div style="clear:both"></div>
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
</body>
</html>
 


