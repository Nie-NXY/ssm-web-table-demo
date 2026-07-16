package cn.jp.myTest.webTable.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jp.myTest.webTable.service.CheckPasswordService;

@Controller
public class CheckPasswordController{
	@Autowired
	CheckPasswordService checkPasswordService;
	
	@RequestMapping("checkPassword.do")
	@ResponseBody
	public String checkPassword(String password){
        // 调用service
        String res = checkPasswordService.checkPassword(password);
        System.out.println("后端密码校验结果：" + res);
        return res;	
	}
}
