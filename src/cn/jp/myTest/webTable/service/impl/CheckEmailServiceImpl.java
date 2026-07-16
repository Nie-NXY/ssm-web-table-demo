package cn.jp.myTest.webTable.service.impl;

import org.springframework.stereotype.Service;

import cn.jp.myTest.webTable.service.CheckEmailService;

@Service
public class CheckEmailServiceImpl implements CheckEmailService{
	
	@Override
	public String checkEmail(String email){
		if(email == null || email == ""){
			return "empty";
		}
		email = email.trim();
		String emailRegex = "^[a-zA-Z0-9_-]+@[a-zA-Z0-9]+(\\.[a-zA-Z0-9]+)+$";
		
		if(!email.matches(emailRegex)){
			System.out.println("邮箱格式不正确");
			return "illegal";
		}		
		return "legal";
	}
	
	@Override
	public boolean checkEmailResult(String email){
		System.out.println("email:"+checkEmail(email));
		return checkEmail(email).equals("legal") || checkEmail(email).equals("empty");
	}
}
