package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Users;

public interface UsersMapper {
	/**
	 * 查询所有用户
	 * @return
	 */
	List<Users> selectAllUsers(Fenye<Users> fenye);
	/**
	 * 添加新用户
	 * 
	 * @param users
	 * @return
	 */
	Integer addUsers(Users users);

	/**
	 * 查询所有用户
	 * @return
	 */
	Integer selectAllUsersCount(Fenye<Users> fenye);
	/**
	 * 修改
	 * @param users
	 * @return
	 */
	Integer updateUsers(Users users);
	
	/**
	 * 删除
	 * @param id
	 * @return
	 */
	Integer delUsers(Integer id);
	
	/**
	 * 解锁，锁定用户信息
	 */
	Integer updateYonghujiesoByisLockout(Users users);
	
	/**
	 * 重置密码
	 * @param users
	 * @return
	 */
	Integer updateResetpas(Users users);
}
