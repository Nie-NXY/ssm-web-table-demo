package cn.jp.myTest.webTable.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jp.myTest.webTable.service.CheckEmailService;


@Controller
public class CheckEmailController{
	@Autowired
	CheckEmailService checkEmailService;
	
	@RequestMapping(value = "checkEmail.do" , method = RequestMethod.POST)
	@ResponseBody
	public String checkEmail(String email){
		//调用service
		String res = checkEmailService.checkEmail(email);
        System.out.println("后端邮箱校验结果：" + res);
		return res;
	}
}
