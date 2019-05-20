package com.ysd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.LoginUsersMapper;
import com.ysd.dao.ModulesMapper;
import com.ysd.entity.Modules;
import com.ysd.entity.ModulesPrent;
import com.ysd.entity.ModulesTree;
import com.ysd.entity.Roles;
import com.ysd.entity.Users;

@Service
public class LoginUsersServiceImp implements LoginUsersService{
	@Autowired
	private LoginUsersMapper loginUsersMapper;
	@Autowired
	private ModulesMapper modulesMapper;

	@Override
	public Users selectUsersByName(String loginName) {
		// TODO Auto-generated method stub
		
		return loginUsersMapper.selectUsersByName(loginName);
	}

	@Override
	public List<Roles> selectUsersRoles(String loginName) {
		// TODO Auto-generated method stub
		return loginUsersMapper.selectUsersRoles(loginName);
	}

	@Override
	public List<ModulesTree> selectRolesModulesTree(Integer rolesid) {
		// TODO Auto-generated method stub
		return modulesMapper.selectRolesModules(rolesid);
	}

	@Override
	public List<Modules> selectRolesModules(Integer rolesid) {
		// TODO Auto-generated method stub
		return modulesMapper.selectModulesPrent(rolesid);
	}

	@Override
	public List<ModulesPrent> selectModulesPrent() {
		// TODO Auto-generated method stub
		return modulesMapper.selectModulesPrentById();
	}

	@Override
	public Integer updateUsersLogin(Users users) {
		// TODO Auto-generated method stub
		return loginUsersMapper.updateUsersLoginYi(users);
	}

	@Override
	public Integer updateUsersInfo(Users users) {
		// TODO Auto-generated method stub
		users.setProtectEMail(users.getProtectEMail().trim());
		users.setProtectMtel(users.getProtectMtel().trim());
		return loginUsersMapper.updateUsersInfo(users);
	}

	@Override
	public Integer updateUsersPsw(Users users) {
		// TODO Auto-generated method stub
		return loginUsersMapper.updateUsersPsw(users);
	}

	@Override
	public Integer reloadPsw(Integer id) {
		// TODO Auto-generated method stub
		return loginUsersMapper.reloadPsw(id);
	}

	
	
}
