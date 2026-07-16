<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
<!-- 写在<head>标签内部最开头 引入jquery的本地包 -->
<script src="jquery-3.2.1.min.js"></script>
<title>用户更新界面</title>
<script>
	// 新增行String
	function getTrHtml(){
	    let trHtml = "<tr>"
	        +"<td><input type='text' name='username' class='username' placeholder='请输入姓名' style='width:100%'/></td>"
	        +"<td><input type='text' name='email' class='email' placeholder='请输入邮箱' style='width:100%'/></td>"
	        +"<td><input type='password' name='password' class='password' placeholder='请输入密码' style='width:100%'/></td>"
	        +"<td>"
	            +"<input type='text' name='age' class='age' placeholder='请输入年龄' style='width:50%'/>"
	            +"<span class='ageCN'></span>"
	        +"</td>"
	        +"<td><input type='text' name='birthday' class='birthday' placeholder='按照yyyy-mm-dd格式输入日期' style='width:100%'/></td>"
	        +"</tr>";
	    return trHtml;
	}
    
$(function(){
	// 获取元素
    const $tbody = $("#tbody");
    const $rightMenu = $("#rightMenu");
    const $addRowMenu = $("#addRowMenu");
    const $delRowMenu = $("#delRowMenu");
    let clickTr; // 保存当前右键点击的tr对象，删除用

    // 表格内右键监听 
    $tbody.on("contextmenu","tr",function(e){
        // e 是右键事件对象
        e.preventDefault(); // 仅表格内拦截浏览器原生右键菜单
        clickTr = $(this); // 记录当前右键点击的行
        
        // 获取鼠标坐标，控制菜单出现在鼠标点击位置
        let mouseX = e.pageX;
        let mouseY = e.pageY;
        // 定位菜单
        $rightMenu.css({
            left: mouseX + "px",
            top: mouseY + "px",
            display: "block"
        });
    });

    // 点击页面任意位置，菜单消失
    $(document).click(function(){
        $rightMenu.hide();
    });

    // 右键菜单-行追加 
    $addRowMenu.click(function(){
        let trHtml =getTrHtml();
        clickTr.after(trHtml);
        $rightMenu.hide(); // 关闭菜单
    });

    // 右键菜单-行删除 
    $delRowMenu.click(function(){
    	const $tr = clickTr;
	    // 获取本行用户名
	    const usernameVal = $.trim($tr.find(".username").val());
        const sendParam = {username : usernameVal};
    
       	$.ajax({
	        url:"delInfo.do",
	        type:"POST",
	        data: sendParam,
	        dataType:"text",
	        beforeSend:function(){
	          console.log("后端：正在校验删除...........");
	        },
	        success:function(res){
	          if(res === "success"){
	            $tr.remove();
	            console.log("数据删除成功");
	          }else {
	            console.log("后端：存在其他错误");
	          }
	        },
	        error:function(e){
	          console.log("服务器异常，删除失败");
	        }
		});
			
        $rightMenu.hide();
    });

	//设定所有需要校验的输入框信息
	const allChecks = [
        {
            className: "username",
            emptyMsg: "姓名不得为空",
            oversizeMsg: "姓名不能大于8个字节",
            maxByte: 8,
            reg: null,
            ajaxUrl: "checkName.do",
            ajaxParam: "userName"
        },
        {
            className: "email",
            emptyMsg: "邮箱不得为空",
            illegalMsg: "邮箱格式不正确",
            maxByte: null,
            reg: /^[a-zA-Z0-9_-]+@[a-zA-Z0-9]+(\.[a-zA-Z0-9]+)+$/,
            ajaxUrl: "checkEmail.do",
            ajaxParam: "email"
        },
        {
            className: "password",
            emptyMsg: "密码不能为空",
            illegalMsg: "密码必须包含大小写+特殊符号(!@#$%^&*)",
            reg: /^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).+$/,
            maxByte: null,
            ajaxUrl: "checkPassword.do",
            ajaxParam: "password"
        },
        {
            className: "age",
            emptyMsg: "年龄不能为空",
            illegalMsg: "年龄必须是1~149数字",
            reg: /^(?:[1-9]|[1-9]\d|1[0-4][0-9])$/,
            maxByte: null,
            ajaxUrl: "checkAge.do",
            ajaxParam: "age"
        },
        {
            className: "birthday",
            emptyMsg: "生日不能为空",
            illegalMsg: "生日格式必须为yyyy-MM-dd",
            reg: /^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01])$/,
            maxByte: null,
            ajaxUrl: "checkBirthday.do",
            ajaxParam: "birthday"
        }
    ];
	
	//遍历所有校验规则
	allChecks.forEach(function(everyCheck){
		//追加失去焦点校验功能
		$tbody.on("blur",'.'+ everyCheck.className,function(){
			const inputVal = $.trim($(this).val());
			//空校验
			if(inputVal === ""){
				alert("前端：" + everyCheck.emptyMsg);
	        	console.log("前端：" + everyCheck.emptyMsg);
	        	return;
			}
			//字节校验（存在maxByte才校验）
			if(everyCheck.maxByte != null && getUtf8ByteLength(inputVal) > everyCheck.maxByte){
				alert("前端：" + everyCheck.oversizeMsg);
				console.log("前端：" + everyCheck.oversizeMsg);
				return;
			}
			//正则校验（存在reg才校验）
			if(everyCheck.reg && !everyCheck.reg.test(inputVal)){
				alert("前端：" + everyCheck.illegalMsg);
				console.log("前端：" + everyCheck.illegalMsg);
				return;
			}
			console.log("前端:" + everyCheck.className + "校验通过");
			
			// ajax的data
			let sendParam = {};
			sendParam[everyCheck.ajaxParam] = inputVal;
			//后端校验
			$.ajax({
		        url:everyCheck.ajaxUrl,
		        type:"POST",
		        data: sendParam,
		        dataType:"text",
		        beforeSend:function(){
		          console.log("后端：正在校验" + everyCheck.className + "...........");
		        },
		        success:function(res){
		          if(res === "legal"){
		            console.log("后端：" + everyCheck.className + "符合规则");
		          }else if(res === "oversize"){
		            console.log("后端：" + everyCheck.oversizeMsg);
		          }else if(res === "empty"){
		            console.log("后端：" + everyCheck.emptyMsg);
		          }else if(res === "illegal"){
		            console.log("后端：" + everyCheck.illegalMsg);
		          }else {
		            console.log("后端：" + everyCheck.className + "栏存在其他错误");
		          }
		        },
		        error:function(e){
		          console.log("服务器异常，" + everyCheck.className + "校验失败");
		        }
			});
		});
	});
	
	// 失去焦点 保存整行数据
	$tbody.on("blur", ".username,.email,.password,.age,.birthday", function(){
	    const $currentInput = $(this);
	    const $currentTr = $currentInput.closest("tr");
	    
	    // 提取当前整行所有字段值 
	    const rowData = {
	        username: $.trim($currentTr.find(".username").val()),
	        email: $.trim($currentTr.find(".email").val()),
	        password: $.trim($currentTr.find(".password").val()),
	        age: $.trim($currentTr.find(".age").val()),
	        birthday: $.trim($currentTr.find(".birthday").val()),
	        delFlg: "0"
	    };
	    
	    $.ajax({
	        url:"saveInfo.do",
	        type:"POST",
	        data: rowData, 
	        dataType:"text",
	        beforeSend:function(){
	            console.log("后端：正在存入数据库...........");
	        },
	        success:function(res){
	            if(res === "success"){
	                console.log("当前行存入成功");
	            }else if(res === "fail"){
	                console.log("存入失败");
	            }else if(res === "noName"){
	            	alert("请先输入姓名");
	                console.log("请先输入姓名");
	            }else if(res === "illegal"){
	            	alert("该行数据存在不合规，请检查");
	            	console.log("改行数据存在不合规，请检查");
	            }else{
	            	console.log("后端：此行数据存在其他错误");
	            }
	        },
	        error:function(e){
	            console.log("服务器异常，存入数据失败");
	        }
	    });
	});
			
	//转换年龄
	$tbody.on("blur", ".age",function(){
	    var $ageInput = $(this); //当前输入框
	    var inputVal = $.trim($(this).val());
	    var sendParam = {"age":inputVal};
	    
	    $.ajax({
	        url:"changeAge.do",
	        type:"POST",
	        data: sendParam,
	        dataType:"text",
	        beforeSend:function(){
	            console.log("后端：正在校验转换...........");
	        },
	        success:function(res){
	        	$ageInput.next(".ageCN").text(res);// 把后端返回中文填入显示标签
	        },
	        error:function(e){
	            console.log("服务器异常，年龄转换失败");
	        }
	    });
	});
	
    //追加行按钮
    let $addNewRowBtn = $("#addNewRowBtn");
    $addNewRowBtn.click(function(){
    	let trHtml =getTrHtml();
        $tbody.append(trHtml);
    });
    
	// 计算UTF8字节长度
	function getUtf8ByteLength(str) {
	    return new Blob([str]).size;
	};
	
});
	
</script>
</head>

<body>
<h1>课题-01</h1>

	<!-- 自定义右键菜单，默认隐藏 -->
	<div id="rightMenu" style="position:absolute;display:none;border:1px solid #999;background:#FFF;">
	    <div style="border:1px solid #999;background:#FFF;" id="addRowMenu">行追加</div>
	    <div style="border:1px solid #999;background:#FFF;" id="delRowMenu">行删除</div>
	</div>
	
	<input type="button" id="addNewRowBtn" value="测试按钮：追加一行"><br>
	
	<form action="addInfo.do" method="post" id="form">
		<table border="2" style="width:80%">
			<thead>
				<tr>
					<th>姓名</th><th>邮箱</th><th>密码</th><th>年龄</th><th>生日</th>
				</tr>
			</thead>
			<tbody id="tbody">
				<tr>
					<td><input type="text" name="username" class="username" placeholder="请输入姓名" style="width:100%"/></td>
					<td><input type="text" name="email" class="email" placeholder="请输入邮箱" style="width:100%"/></td>
					<td><input type="password" name="password" class="password" placeholder="请输入密码" style="width:100%"/></td>
					<td>
						<input type="text" name="age" class="age" placeholder="请输入年龄" style="width:50%"/>
						<span class='ageCN'></span>
					</td>
					<td><input type="text" name="birthday" class="birthday" placeholder="按照yyyy-mm-dd格式输入日期" style="width:100%"/></td>
				</tr>
			</tbody>
		</table>
	</form>

</body>

</html>