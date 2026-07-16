package cn.jp.myTest.webTable.mapper;


import cn.jp.myTest.webTable.entity.RegisterInfoEntity;

public interface RegisterInfoMapper {
	//增
	int save(RegisterInfoEntity registerInfo);

	//删
	int deleteByName(String username);

	//查
	RegisterInfoEntity findAllInfo(String username);
}
