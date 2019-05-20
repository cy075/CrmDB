package com.ysd.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.UsersMapper;
import com.ysd.entity.Fenye;
import com.ysd.entity.Users;

@Service
public class UsersServiceImp implements UsersService {
	
	@Autowired
	private UsersMapper usersMapper;
	
	@Override
	public Fenye<Users> selectAllUsers(Fenye<Users> fenye) {
		// TODO Auto-generated method stub
		fenye.setRows(usersMapper.selectAllUsers(fenye));
		fenye.setTotal(usersMapper.selectAllUsersCount(fenye));
		
		return fenye;
	}

	
	@Override
	public Integer delUsers(Integer id) {
		// TODO Auto-generated method stub
		return usersMapper.delUsers(id);
	}

	@Override
	public Integer updateUsers(Users users) {
		// TODO Auto-generated method stub
		return usersMapper.updateUsers(users);
	}


	@Override
	public Integer addUsers(Users users) {
		// TODO Auto-generated method stub
		return usersMapper.addUsers(users);
	}


	@Override
	public Integer updateYonghujiesoByisLockout(Users users) {
		// TODO Auto-generated method stub
		return usersMapper.updateYonghujiesoByisLockout(users);
	}


	@Override
	public Integer updateResetpas(Users users) {
		// TODO Auto-generated method stub
		return usersMapper.updateResetpas(users);
	}

}
