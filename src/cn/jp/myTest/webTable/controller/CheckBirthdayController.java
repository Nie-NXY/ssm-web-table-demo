package cn.jp.myTest.webTable.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jp.myTest.webTable.service.CheckBirthdayService;

@Controller
public class CheckBirthdayController {
	@Autowired
	private CheckBirthdayService checkBirthdayService;
	
	@RequestMapping(value = "checkBirthday.do", method = RequestMethod.POST)
    @ResponseBody
	public String checkBirthday(String birthday){
		//调用service
		String res = checkBirthdayService.checkBirthday(birthday);
        System.out.println("后端生日校验结果：" + res);
        return res;
	};
}
