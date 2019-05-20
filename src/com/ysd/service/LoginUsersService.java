package com.ysd.service;

import java.util.List;

import com.ysd.entity.Modules;
import com.ysd.entity.ModulesPrent;
import com.ysd.entity.ModulesTree;
import com.ysd.entity.Roles;
import com.ysd.entity.Users;

public interface LoginUsersService {
	/**
	 * 查询登录用户是否存在
	 * @param loginName
	 * @return
	 */
	Users selectUsersByName(String loginName);
	/**
	 * 登录用户的角色
	 * @param loginName
	 * @return
	 */
	List<Roles> selectUsersRoles(String loginName);
	/**
	 * 模块树
	 * @param rolesid
	 * @return
	 */
	List<ModulesTree> selectRolesModulesTree(Integer rolesid);
	/**
	 * 查询角色管理的模块
	 * @param rolesid
	 * @return
	 */
	List<Modules> selectRolesModules(Integer rolesid);
	/**
	 * 根据子节点查询父节点
	 * @return
	 */
	List<ModulesPrent> selectModulesPrent();
	
	/**
	 * 用户登录或者登陆失败异常
	 * @param users
	 * @return
	 */
	Integer updateUsersLogin(Users users);
	/**
	 *用户修改信息
	 * @param users
	 * @return
	 */
	Integer updateUsersInfo(Users users);
	/**
	 * 修改密码
	 * @param users
	 * @return
	 */
	Integer updateUsersPsw(Users users);
	/**
	 * 重置密码
	 * @param id
	 * @return
	 */
	Integer reloadPsw(Integer id);
}
