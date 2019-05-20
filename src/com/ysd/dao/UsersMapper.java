package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Users;

public interface UsersMapper {
	/**
	 * ��ѯ�����û�
	 * @return
	 */
	List<Users> selectAllUsers(Fenye<Users> fenye);
	/**
	 * ������û�
	 * 
	 * @param users
	 * @return
	 */
	Integer addUsers(Users users);

	/**
	 * ��ѯ�����û�
	 * @return
	 */
	Integer selectAllUsersCount(Fenye<Users> fenye);
	/**
	 * �޸�
	 * @param users
	 * @return
	 */
	Integer updateUsers(Users users);
	
	/**
	 * ɾ��
	 * @param id
	 * @return
	 */
	Integer delUsers(Integer id);
	
	/**
	 * �����������û���Ϣ
	 */
	Integer updateYonghujiesoByisLockout(Users users);
	
	/**
	 * ��������
	 * @param users
	 * @return
	 */
	Integer updateResetpas(Users users);
}
