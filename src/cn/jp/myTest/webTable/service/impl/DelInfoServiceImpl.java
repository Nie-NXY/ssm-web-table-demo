package cn.jp.myTest.webTable.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.jp.myTest.webTable.mapper.RegisterInfoMapper;
import cn.jp.myTest.webTable.service.DelInfoService;

@Service
public class DelInfoServiceImpl implements DelInfoService{
	@Autowired
	public RegisterInfoMapper registerInfoMapper;
	
	@Override
	public int delInfo(String username){
		
		int delResult = registerInfoMapper.deleteByName(username);
		return delResult;
	};
}
