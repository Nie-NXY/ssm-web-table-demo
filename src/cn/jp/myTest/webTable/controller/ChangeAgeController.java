package cn.jp.myTest.webTable.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jp.myTest.webTable.service.ChangeAgeService;

@Controller
public class ChangeAgeController{
	@Autowired
	ChangeAgeService changeAgeService;
	
	@RequestMapping(value="changeAge.do" , method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String changeAge(String age){
		//调用service
		String ageCN = changeAgeService.changeAge(age);
		return ageCN;
	}
}
