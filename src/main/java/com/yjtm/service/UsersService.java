package com.yjtm.service;

import com.yjtm.domian.Users;

public interface UsersService {
	int deleteByPrimaryKey(Integer id);

	int insert(Users record);

	int insertSelective(Users record);

	Users selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(Users record);

	int updateByPrimaryKey(Users record);
}