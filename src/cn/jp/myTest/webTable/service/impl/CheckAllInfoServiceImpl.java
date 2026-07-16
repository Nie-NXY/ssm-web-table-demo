package cn.jp.myTest.webTable.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jp.myTest.webTable.entity.RegisterInfoEntity;
import cn.jp.myTest.webTable.mapper.RegisterInfoMapper;
import cn.jp.myTest.webTable.service.CheckAgeService;
import cn.jp.myTest.webTable.service.CheckAllInfoService;
import cn.jp.myTest.webTable.service.CheckBirthdayService;
import cn.jp.myTest.webTable.service.CheckEmailService;
import cn.jp.myTest.webTable.service.CheckNameService;
import cn.jp.myTest.webTable.service.CheckPasswordService;

@Service
public class CheckAllInfoServiceImpl implements CheckAllInfoService{
	@Autowired
	private CheckNameService checkNameService;
	@Autowired
	private CheckEmailService checkEmailService;
	@Autowired
	private CheckPasswordService checkPasswordService;
	@Autowired
	private CheckAgeService checkAgeService;
	@Autowired
	private CheckBirthdayService checkBirthdayService;
	@Autowired
	private RegisterInfoMapper registerInfoMapper;
	
	@Override
	public boolean checkAllInfo(RegisterInfoEntity registerInfo){
		//后端验证
		//验证姓名
		boolean checkNameFlg = checkNameService.checkNameResult(registerInfo.getUsername());
		//验证邮箱
		boolean checkEmailFlg = checkEmailService.checkEmailResult(registerInfo.getEmail());
		//验证密码
		boolean checkPasswordFlg = checkPasswordService.checkPasswordResult(registerInfo.getPassword());
		//转换年龄	
		boolean checkAgeFlg = checkAgeService.checkAgeResult(registerInfo.getAge());
		//验证日期		
		boolean checkBirthdayFlg = checkBirthdayService.checkBirthdayResult(registerInfo.getBirthday());
		
		return (checkNameFlg && checkEmailFlg && checkPasswordFlg && checkAgeFlg && checkBirthdayFlg);
	}
}
