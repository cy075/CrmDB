package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Roles;
import com.ysd.entity.Users;

public interface LoginUsersMapper {
	/**
	 * ��ѯ�û��Ƿ����
	 * @return
	 */
	Users selectUsersByName(String loginName);
	
	/**
	 * ��ѯ����½�û��Ľ�ɫ
	 * @param loginName
	 * @return
	 */
	List<Roles> selectUsersRoles(String loginName);
	/**
	 * ��½ʱ��������쳣���߳ɹ�
	 * @param users
	 * @return
	 */
	Integer updateUsersLoginYi(Users users);
	/**
	 * �޸��û���Ϣ
	 * @param users
	 * @return
	 */
	Integer updateUsersInfo(Users users);
	/**
	 * �޸�����
	 * @param users
	 * @return
	 */
	Integer updateUsersPsw(Users users);
	/**
	 * ��������(ysd123)
	 * @return
	 */
	Integer reloadPsw(Integer id);
}
