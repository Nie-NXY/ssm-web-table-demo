package cn.jp.myTest.webTable.service.impl;

import java.nio.charset.StandardCharsets;

import org.springframework.stereotype.Service;

import cn.jp.myTest.webTable.service.CheckNameService;

@Service
public class CheckNameServiceImpl implements CheckNameService{

    @Override
    public String checkName(String userName){
    	//非空判断
        if(userName == null || userName.trim().length() == 0){
            return "empty";
        }
        String name = userName.trim();
        if(name.getBytes(StandardCharsets.UTF_8).length > 8){
            return "oversize";
        }
        return "legal";
    }
    
    @Override
    public boolean checkNameResult(String userName){  
		System.out.println("userName:"+checkName(userName));
    	return checkName(userName).equals("legal");
    }
    
}
