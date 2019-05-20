package com.ysd.service;

import java.util.List;

import com.ysd.entity.Modules;
import com.ysd.entity.ModulesPrent;
import com.ysd.entity.ModulesTree;
import com.ysd.entity.Roles;
import com.ysd.entity.Users;

public interface LoginUsersService {
	/**
	 * ��ѯ��¼�û��Ƿ����
	 * @param loginName
	 * @return
	 */
	Users selectUsersByName(String loginName);
	/**
	 * ��¼�û��Ľ�ɫ
	 * @param loginName
	 * @return
	 */
	List<Roles> selectUsersRoles(String loginName);
	/**
	 * ģ����
	 * @param rolesid
	 * @return
	 */
	List<ModulesTree> selectRolesModulesTree(Integer rolesid);
	/**
	 * ��ѯ��ɫ�����ģ��
	 * @param rolesid
	 * @return
	 */
	List<Modules> selectRolesModules(Integer rolesid);
	/**
	 * �����ӽڵ��ѯ���ڵ�
	 * @return
	 */
	List<ModulesPrent> selectModulesPrent();
	
	/**
	 * �û���¼���ߵ�½ʧ���쳣
	 * @param users
	 * @return
	 */
	Integer updateUsersLogin(Users users);
	/**
	 *�û��޸���Ϣ
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
	 * ��������
	 * @param id
	 * @return
	 */
	Integer reloadPsw(Integer id);
}
