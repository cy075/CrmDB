package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Roles;
import com.ysd.entity.Users;

public interface LoginUsersMapper {
	/**
	 * 查询用户是否存在
	 * @return
	 */
	Users selectUsersByName(String loginName);
	
	/**
	 * 查询出登陆用户的角色
	 * @param loginName
	 * @return
	 */
	List<Roles> selectUsersRoles(String loginName);
	/**
	 * 登陆时密码错误异常或者成功
	 * @param users
	 * @return
	 */
	Integer updateUsersLoginYi(Users users);
	/**
	 * 修改用户信息
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
	 * 重置密码(ysd123)
	 * @return
	 */
	Integer reloadPsw(Integer id);
}
