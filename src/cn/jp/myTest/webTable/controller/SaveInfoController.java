package cn.jp.myTest.webTable.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.jp.myTest.webTable.entity.RegisterInfoEntity;
import cn.jp.myTest.webTable.service.SaveInfoService;

@Controller
public class SaveInfoController{
	@Autowired
	SaveInfoService saveInfoService;
	
	@RequestMapping(value="saveInfo.do")
	@ResponseBody
	public String saveInfo(RegisterInfoEntity registerInfo){
		//调用service
		int saveResult = saveInfoService.saveInfo(registerInfo);
		if(saveResult == 1){
			return "success";
		}else if(saveResult == -1){
			return "noName";
		}else if(saveResult == -2){
			return "illegal";
		}else{
			return "fail";
		}
	 };
}
