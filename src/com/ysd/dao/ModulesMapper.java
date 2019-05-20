package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Modules;
import com.ysd.entity.ModulesPrent;
import com.ysd.entity.ModulesTree;

//����ģ��
public interface ModulesMapper {
	/**
	 * ���ݽ�ɫ����ͬ��ģ��
	 * @param userRoles
	 * @return
	 */
	List<ModulesTree> selectRolesModules(Integer rolesid);
	/**
	 * ��ɫ������ģ���Լ���id
	 * @param prentid
	 * @return
	 */
	List<Modules> selectModulesPrent(Integer rolesid);
	/**
	 * ��ѯģ��ĸ��ڵ�
	 * @param id
	 * @return
	 */
	List<ModulesPrent> selectModulesPrentById();
	
}
