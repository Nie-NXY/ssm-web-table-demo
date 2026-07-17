<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
<!-- 引入jquery的本地包 -->
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
    const $rightMenuTbody = $("#rightMenuTbody");
    const $checkResultTip = $("#checkResultTip");
    const $searchMenu = $("#searchMenu");
    const $replaceMenu = $("#replaceMenu");
    let clickTr; // 保存当前右键点击的tr对象，删除用
	
	// 搜索相关变量
	let highlightArr = []; // 保存所有匹配高亮DOM
	let highlightIndex = -1; // 当前选中索引
	const SEARCH_SCOPE = "body"; // 只检索表格区域
	
	// 屏蔽掉按ctrl+h键这个热键组合
	$(document).keydown(function(e){
	    // 判断按键：Ctrl + H
	    if(e.ctrlKey && e.key.toLowerCase() === 'h'){
	        e.preventDefault();// 阻止浏览器默认行为
	        // 获取鼠标最后坐标
	        let mouseX = lastMouseX;
	        let mouseY = lastMouseY;
	
	        $("#rightMenuTbody").hide();// 隐藏表格内菜单
	        $("#rightMenu").css({//呼出菜单
	            left: mouseX + "px",
	            top: mouseY + "px",
	            display:"block"
	        });
	    }
	});
	
	// 实时记录鼠标坐标
	let lastMouseX = 0;
	let lastMouseY = 0;
	$(document).mousemove(function(e){
	    lastMouseX = e.pageX;
	    lastMouseY = e.pageY;
	});
	
	// 右键统一监听
    $(document).on("contextmenu",function(e){
        e.preventDefault();//屏蔽浏览器原生右键菜单
        // 隐藏两个自定义菜单
        $rightMenuTbody.hide();
        $rightMenu.hide();

        // 判断：右键触发元素是否属于 tbody tr
        let $target = $(e.target);
        let insideTr = $target.closest("#tbody tr").length > 0;
        let mouseX = e.pageX;
        let mouseY = e.pageY;

        if(insideTr){// 右键点击表格行
            clickTr = $target.closest("tr"); // 记录当前行
            $rightMenuTbody.css({
                left: mouseX + "px",
                top: mouseY + "px",
                display: "block"
            });
        }else{
            // 右键页面其他位置
            $rightMenu.css({
                left: mouseX + "px",
                top: mouseY + "px",
                display: "block"
            });
        }
    });
		
    // 点击页面任意位置，菜单消失
    $(document).click(function(){
    	$rightMenuTbody.hide();
        $rightMenu.hide();
    });

    // tbody右键菜单-行追加 
    $addRowMenu.click(function(e){
    	e.stopPropagation(); // 阻止冒泡，防止菜单瞬间消失
        let trHtml =getTrHtml();
        clickTr.after(trHtml);
        $rightMenuTbody.hide();
    });

    // tbody右键菜单-行删除 
    $delRowMenu.click(function(e){
    	e.stopPropagation(); // 阻止冒泡，防止菜单瞬间消失
    	const $tr = clickTr;
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
        $rightMenuTbody.hide();
    });
		
	// 右键菜单【搜索】点击
	$searchMenu.click(function(e){
		e.stopPropagation(); // 阻止冒泡，防止菜单瞬间消失
		console.log("点击搜索");
		$("#rightMenu").hide();
		$("#replaceBox").hide();// 隐藏替换区域
		$("#replaceTxt").val(""); // 清空替换输入框
		$("#rightMenu2nd").css({
			left:lastMouseX + "px",
			top:lastMouseY + "px",
			display:"block"
		});
		$("#SMInput").focus();
	});
	
	// 右键菜单【替换】点击
	$replaceMenu.click(function(e){
	    e.stopPropagation();// 阻止冒泡，防止菜单瞬间消失
	    console.log("点击替换");
	    $("#rightMenu").hide();
	    // 显示替换输入区域
	    $("#replaceBox").show();
	    $("#rightMenu2nd").css({
	        left:lastMouseX + "px",
	        top:lastMouseY + "px",
	        display:"block"
	    });
	    $("#SMInput").focus();
	});
	
	// 全部替换按钮点击
	$("#replaceAllBtn").click(function(){
	    let findVal = $.trim($("#SMInput").val());
	    let repVal = $.trim($("#replaceTxt").val());
	    if(findVal === ""){
	        return;
	    }
	    // 复用搜索方法，生成匹配高亮
	    searchInfo(findVal);
	    if(highlightArr.length === 0){
	        return;
	    }
	    // 批量替换所有搜索匹配到的文字
	    highlightArr.forEach(function(spanEl){
	        spanEl.textContent = repVal;
	    });
	    clearAllHighlight();
	    $("#replaceTxt").val("");
	});

	// 搜索功能
	//清除所有高亮标签，还原文本
	function clearAllHighlight(){
	    // 移除所有高亮span，还原纯文本
	    $(SEARCH_SCOPE).find(".search-highlight").each(function(){
	        $(this).replaceWith($(this).text());
	    });
	    // 合并所有相邻TextNode
	    const root = document.querySelector(SEARCH_SCOPE);
	    function mergeTextNodes(el){
	        let child = el.firstChild;//先赋值为第一个子node
	        while(child){//子节点存在时一直执行
	            if(child.nodeType === Node.TEXT_NODE){//如果节点类型是纯文本
	                let next = child.nextSibling; //声明定义并赋值下一个相邻节点
	                // 合并后面连续的文本节点
	                while(next && next.nodeType === Node.TEXT_NODE){//存在下一个节点(next) 且类型也是文本
	                    child.textContent += next.textContent;//合并文本到本节点
	                    el.removeChild(next);//删除下一个节点
	                    next = child.nextSibling;//将此时的下一个节点赋值到next:不存在的话 下次循环不会启动
	                }
	            }else if(child.nodeType === Node.ELEMENT_NODE){//节点类型不是纯文本，但是HTML 元素标签节点（`<div>`、`<span>`、`<td>`、`<input>` 这种标签）
	                // 跳过input/script/style，递归子元素
	                const tag = child.tagName.toLowerCase();//获取子tag的标签名并转为小写
	                if(["input","script","style"].indexOf(tag) === -1){//tag中不包含集合中的元素时（-1） 才执行
	                    mergeTextNodes(child);//递归调用自己，进入当前标签内部继续遍历
	                }
	            }
	            child = child.nextSibling;//子节点不是纯文本也不是HTML元素标签节点的话，给child赋值为下一个节点，进入下一次循环
	        }
	    }
	    mergeTextNodes(root);//调用合并方法
	    // 重置匹配数组与索引
	    highlightArr = [];
	    highlightIndex = -1;
	}
	
	//递归遍历文本节点，添加高亮
	function walkTextNode(el,keyword){
		let reg = new RegExp("(" + keyword + ")","gi");//创建正则，全局、不区分大小写匹配关键词
		let nodes = Array.from(el.childNodes);//获取当前元素所有子节点，转成数组循环
		nodes.forEach(function(node){//遍历每一个子节点
			if(node.nodeType === Node.TEXT_NODE){//纯文字节点（普通文本，不含标签）
				let text = node.textContent;// 获取文字内容
				if(!reg.test(text)) return;// 如果没有关键词，不处理
				let parent = node.parentNode;// 拿到文字的父标签
				parent.removeChild(node);// 把原来的纯文字节点从页面删掉
				let arr = text.split(reg);// 用关键词切割文字，拆分出普通文字和关键词
				arr.forEach(function(txt){//循环这个被切好的文字数组
					if(reg.test(txt)){// 匹配到关键词
						let span = document.createElement("span");// 创建span标签
						span.className = "search-highlight";//添加标签class属性
						span.style.background="yellow";
						span.style.color="#000";
						span.textContent = txt;
						parent.appendChild(span);// 把高亮span放回父标签
					}else{//如果不是关键字，新建纯文字节点放回页面
						parent.appendChild(document.createTextNode(txt));
					}
				});
			}else if(node.nodeType === Node.ELEMENT_NODE){//当前节点是标签
				let tag = node.tagName.toLowerCase();// 获取标签名称，统一转换成小写
				if(["input","script","style"].indexOf(tag) > -1) return;// 跳过输入框、脚本、样式，不处理里面的文字
				walkTextNode(node,keyword);// 递归：进入这个标签内部，继续遍历它的子节点文字
			}
		});
	}
	
	//执行搜索方法
	function searchInfo(str){
		clearAllHighlight();
		let key = $.trim(str);
		if(key === "") return;
		walkTextNode($(SEARCH_SCOPE)[0],key);
		highlightArr = Array.from($(SEARCH_SCOPE).find(".search-highlight"));
		if(highlightArr.length ===0){
			alert("未找到匹配内容");
			return;
		}
		highlightIndex = -1;
		goNextMatch();
	}
	
	//下一条
	$("#preInfo").click(function(){
		let key = $.trim($("#SMInput").val());
		if(highlightArr.length<=0){
			searchInfo(key);
			return;
		}
		goNextMatch();
	});
	//上一条
	$("#nextInfo").click(function(){
		let key = $.trim($("#SMInput").val());
		if(highlightArr.length<=0){
			searchInfo(key);
			return;
		}
		goPrevMatch();
	});
	
	// 输入框回车触发搜索
	$("#SMInput").on("keydown",function(e){
		if(e.key === "Enter"){
			searchInfo($(this).val());
		}
	});
	
	//跳转到下一处匹配
	function goNextMatch(){
		if(highlightArr.length ===0) return;
		highlightArr.forEach(function(item){
			item.style.background="#ffeb3b";
		});
		highlightIndex ++;
		if(highlightIndex >= highlightArr.length){
			highlightIndex = 0;
		}
		let target = highlightArr[highlightIndex];
		target.style.background="#ff9800";
		target.scrollIntoView({behavior:"smooth",block:"center"});
	}
	//跳转到上一处匹配
	function goPrevMatch(){
		if(highlightArr.length ===0) return;
		highlightArr.forEach(function(item){
			item.style.background="#ffeb3b";
		});
		highlightIndex --;
		if(highlightIndex <0){
			highlightIndex = highlightArr.length -1;
		}
		let target = highlightArr[highlightIndex];
		target.style.background="#ff9800";
		target.scrollIntoView({behavior:"smooth",block:"center"});
	}
	
	// 点击空白关闭搜索面板	
	$(document).click(function(e){
		// 判断点击目标不在搜索替换面板内，才关闭
		if(!$(e.target).closest("#rightMenu2nd").length){
			$("#rightMenu2nd").hide();//关闭菜单
			clearAllHighlight();
			$("#SMInput").val("");
			$("#replaceTxt").val("");
		}
	});
	
	// ==================搜索功能结束====================

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
		$tbody.on("blur","."+ everyCheck.className,function(){
			const inputVal = $.trim($(this).val());
			$checkResultTip.text("");
			if(inputVal === ""){
				$checkResultTip.text(everyCheck.emptyMsg);
	        	console.log("前端：" + everyCheck.emptyMsg);
	        	return;
			}
			if(everyCheck.maxByte != null && getUtf8ByteLength(inputVal) > everyCheck.maxByte){
				$checkResultTip.text(everyCheck.oversizeMsg);
				console.log("前端：" + everyCheck.oversizeMsg);
				return;
			}
			if(everyCheck.reg && !everyCheck.reg.test(inputVal)){
				$checkResultTip.text(everyCheck.illegalMsg);
				console.log("前端：" + everyCheck.illegalMsg);
				return;
			}
			console.log("前端:" + everyCheck.className + "校验通过");
			
			let sendParam = {};
			sendParam[everyCheck.ajaxParam] = inputVal;
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
	    const $preSaveCheckTip = $("#preSaveCheckTip");
	    
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
	        	$preSaveCheckTip.text("");
	            if(res === "success"){
	                console.log("当前行存入成功");
	            }else if(res === "fail"){
	                console.log("存入失败");
	            }else if(res === "noName"){
	            	$preSaveCheckTip.text("请先输入姓名");
	                console.log("请先输入姓名");
	            }else if(res === "illegal"){
					$preSaveCheckTip.text("该行数据存在不合规，请检查");
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
	    var $ageInput = $(this);
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
	        	$ageInput.next(".ageCN").text(res);
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
	<!-- 表格右键菜单 -->
	<div id="rightMenuTbody" style="position:absolute;display:none;border:1px solid #999;background:#FFF;z-index:9999;">
	    <div style="padding:4px 10px;cursor:pointer;border-bottom:1px solid #eee;" id="addRowMenu">行追加</div>
	    <div style="padding:4px 10px;cursor:pointer;" id="delRowMenu">行删除</div>
	</div>
	
	<!-- 空白区域右键菜单 -->
	<div id="rightMenu" style="position:absolute;display:none;border:1px solid #999;background:#FFF;z-index:9999;">
	    <div style="padding:4px 10px;cursor:pointer;border-bottom:1px solid #eee;" id="searchMenu">搜索</div>
	    <div style="padding:4px 10px;cursor:pointer;" id="replaceMenu">替换</div>
	</div>
	
	<!-- 搜索+替换面板 -->
	<div id="rightMenu2nd" style="position:absolute;display:none;border:1px solid #999;background:#FFF;z-index:9999;padding:6px;">
	    <div>查找：<input type="text" id="SMInput" style="width:120px;padding:2px;" placeholder="输入查找内容"></div>
	    <!-- 替换区域，默认隐藏，点击替换菜单才显示 -->
	    <div id="replaceBox" style="display:none;margin:4px 0;">
		  替换：<input type="text" id="replaceTxt" style="width:120px;padding:2px;">
	        <input type="button" id="replaceAllBtn" value="全部替换">
	    </div>
	    <div style="margin-top:4px;">
	        <input type="button" id="nextInfo" value="上一条">
	        <input type="button" id="preInfo" value="下一条">
	    </div>
	</div>
	
	<input type="button" id="addNewRowBtn" value="测试按钮：追加一行" style="display:none">
	<span>-</span><span id="checkResultTip" style="color:red"></span><br>
	<span>-</span><span id="preSaveCheckTip" style="color:red"></span><br>
	
	<form action="addInfo.do" method="post" id="form">
		<table border="1" style="width:80%">
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
