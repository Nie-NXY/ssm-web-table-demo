package cn.jp.myTest.webTable.service.impl;

import org.springframework.stereotype.Service;

import cn.jp.myTest.webTable.service.CheckAgeService;

@Service
public class CheckAgeServiceImpl implements CheckAgeService{
	@Override
	public String checkAge(String age){

		age = age == null ? "" : age.trim();
	    if(age.length() == 0){
	        return "empty";
	    }

	    // 正则校验数字格式 1~150
		String ageRegex = "^(?:[1-9]|[1-9]\\d|1[0-4][0-9])$";
		if(!age.matches(ageRegex)){
			System.out.println("年龄格式错误，只能输入1-150纯数字");
			return "illegal";
		}
		
		// 转int校验
		int numAge;
		try{
			numAge = Integer.parseInt(age);
		}catch (NumberFormatException e){
			return "illegal";
		}
		if(numAge > 150){
			System.out.println("年龄必须是1~149数字");
			return "illegal";
		}
		return "legal";
	}
	
	@Override
	public boolean checkAgeResult(String age){
		System.out.println("age:" + checkAge(age));
		return checkAge(age).equals("legal") || checkAge(age).equals("empty");
	}
}
