package com.ysd.service;

import com.ysd.entity.Fenye;
import com.ysd.entity.Users;

public interface UsersService {
	/**
	 * ��ѯ�����û�
	 * @return
	 */
	Fenye<Users> selectAllUsers(Fenye<Users> fenye);
	
	/**
	 * ������û�
	 * 
	 * @param users
	 * @return
	 */
	Integer addUsers(Users users);
	/**
	 * ɾ��
	 * @param id
	 * @return
	 */
		Integer delUsers(Integer id);
	/**
	 * �޸�
	 * @param users
	 * @return
	 */
		Integer updateUsers(Users users);
	/**
	 * �����������û���Ϣ
	 */
		Integer updateYonghujiesoByisLockout(Users users);
		
		/**
		 *  �û���Ϣ�����ܴa
		 */
		  Integer updateResetpas(Users users);
}
