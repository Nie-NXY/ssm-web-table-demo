package cn.jp.myTest.webTable.service.impl;

import org.springframework.stereotype.Service;

import cn.jp.myTest.webTable.service.CheckPasswordService;

@Service
public class CheckPasswordServiceImpl implements CheckPasswordService{
	private int upperCharCount = 0;
	private int lowerCharCount = 0;
	private int specialCharCount = 0;

	@Override
	public String checkPassword(String password){
		if(password == null || password == ""){
			return "empty";
		}
		
		String upperCharRgx = "[A-Z]";
		String lowerCharRgx = "[a-z]";
		String specialCharRgx = "[!@#$%^&*]";
		
		char[] passwordCharArray = password.toCharArray();
		for(char temp : passwordCharArray){
			String tempStr = temp + "";
			if(tempStr.matches(upperCharRgx)){
				upperCharCount++;
				continue;
			}
			if(tempStr.matches(lowerCharRgx)){
				lowerCharCount++;
				continue;
			}
			if(tempStr.matches(specialCharRgx)){
				specialCharCount++;
				continue;
			}
		}
		
		if(upperCharCount > 0 && lowerCharCount > 0 && specialCharCount > 0){
			return "legal";
		}else{
			return "illegal";
		}
	}
	
	@Override
	public boolean checkPasswordResult(String password){
		System.out.println("password:"+checkPassword(password));
		return checkPassword(password).equals("legal") || checkPassword(password).equals("empty");
	}
}
