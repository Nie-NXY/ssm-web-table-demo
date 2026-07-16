package cn.jp.myTest.webTable.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jp.myTest.webTable.service.DelInfoService;

@Controller
public class DelInfoController{
	@Autowired
	DelInfoService delInfoService;
	
	@RequestMapping(value="delInfo.do")
	@ResponseBody
	public String delInfo(String username){
		//调用service
		delInfoService.delInfo(username);
		return "success";
	};
}
