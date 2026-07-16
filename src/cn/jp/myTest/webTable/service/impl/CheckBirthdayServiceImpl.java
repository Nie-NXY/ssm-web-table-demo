package cn.jp.myTest.webTable.service.impl;

import org.springframework.stereotype.Service;

import cn.jp.myTest.webTable.service.CheckBirthdayService;

@Service
public class CheckBirthdayServiceImpl implements CheckBirthdayService{
	@Override
	public String checkBirthday(String birthday){
		if(birthday == null || birthday == ""){
			return "empty";
		}else{
			String dateReg = "^[0-9]{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$";
			if(birthday.matches(dateReg)){
				return "legal";
			}else{
				return "illegal";
			}
		}
	}
	
	@Override
	public boolean checkBirthdayResult(String birthday){	
		System.out.println("birthday:"+checkBirthday(birthday));
		return checkBirthday(birthday).equals("legal") || checkBirthday(birthday).equals("empty");
	}
}
