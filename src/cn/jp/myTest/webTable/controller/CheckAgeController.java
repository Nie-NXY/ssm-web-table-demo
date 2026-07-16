package cn.jp.myTest.webTable.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jp.myTest.webTable.service.CheckAgeService;

@Controller
public class CheckAgeController {
	@Autowired
	private CheckAgeService checkAgeService;
	
	@RequestMapping(value = "checkAge.do", method = RequestMethod.POST)
    @ResponseBody
	public String checkAge(String age){
		//调用service
		String res = checkAgeService.checkAge(age);
        System.out.println("后端年龄校验结果：" + res);
        return res;
	};
}
