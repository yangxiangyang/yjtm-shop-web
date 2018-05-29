package com.yjtm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yjtm.dao.UsersDao;
import com.yjtm.domian.Users;
import com.yjtm.service.UsersService;

@Service("userService")
public class UsersServiceImpl implements UsersService {
	@Autowired
	private UsersDao usersMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Users record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertSelective(Users record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Users selectByPrimaryKey(Integer id) {
		return usersMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Users record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Users record) {
		// TODO Auto-generated method stub
		return 0;
	}

}
