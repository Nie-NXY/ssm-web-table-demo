package cn.jp.myTest.webTable.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jp.myTest.webTable.service.CheckNameService;

@Controller
public class CheckNameController{
	@Autowired
    private CheckNameService checkNameService;
	
	@RequestMapping(value = "checkName.do", method = RequestMethod.POST)
    @ResponseBody
    public String checkName(String userName){
        // 调用service
        String res = checkNameService.checkName(userName);
        System.out.println("后端姓名校验结果：" + res);
        return res;
    }
	
}
