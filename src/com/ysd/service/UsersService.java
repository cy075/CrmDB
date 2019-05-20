package com.ysd.service;

import com.ysd.entity.Fenye;
import com.ysd.entity.Users;

public interface UsersService {
	/**
	 * 查询所有用户
	 * @return
	 */
	Fenye<Users> selectAllUsers(Fenye<Users> fenye);
	
	/**
	 * 添加新用户
	 * 
	 * @param users
	 * @return
	 */
	Integer addUsers(Users users);
	/**
	 * 删除
	 * @param id
	 * @return
	 */
		Integer delUsers(Integer id);
	/**
	 * 修改
	 * @param users
	 * @return
	 */
		Integer updateUsers(Users users);
	/**
	 * 锁定，解锁用户信息
	 */
		Integer updateYonghujiesoByisLockout(Users users);
		
		/**
		 *  用户信息重置密碼
		 */
		  Integer updateResetpas(Users users);
}
