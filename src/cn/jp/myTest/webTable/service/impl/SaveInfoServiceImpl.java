package cn.jp.myTest.webTable.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jp.myTest.webTable.entity.RegisterInfoEntity;
import cn.jp.myTest.webTable.mapper.RegisterInfoMapper;
import cn.jp.myTest.webTable.service.CheckAllInfoService;
import cn.jp.myTest.webTable.service.SaveInfoService;

@Service
public class SaveInfoServiceImpl implements SaveInfoService{
	@Autowired
	private RegisterInfoMapper registerInfoMapper;
	@Autowired
	private CheckAllInfoService checkAllInfoService;
	
	@Override
	public int saveInfo(RegisterInfoEntity registerInfo){
		//名字非空判断
		if(registerInfo.getUsername() == null || registerInfo.getUsername() == ""){
			return -1;
		}
		
		//所有内容合规判断
		boolean checkResult = checkAllInfoService.checkAllInfo(registerInfo);
		if(!checkResult){
			System.out.println("该行数据部分不合规");
			return -2;
		}
		 //伦理删除
		registerInfoMapper.deleteByName(registerInfo.getUsername());
		 //追加新内容
		int saveResult = registerInfoMapper.save(registerInfo);
		return saveResult;
	 };
}
