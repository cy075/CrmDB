package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Modules;
import com.ysd.entity.ModulesPrent;
import com.ysd.entity.ModulesTree;

//功能模块
public interface ModulesMapper {
	/**
	 * 根据角色管理不同的模块
	 * @param userRoles
	 * @return
	 */
	List<ModulesTree> selectRolesModules(Integer rolesid);
	/**
	 * 角色的所有模块以及父id
	 * @param prentid
	 * @return
	 */
	List<Modules> selectModulesPrent(Integer rolesid);
	/**
	 * 查询模块的父节点
	 * @param id
	 * @return
	 */
	List<ModulesPrent> selectModulesPrentById();
	
}
