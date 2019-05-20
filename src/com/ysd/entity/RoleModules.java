package com.ysd.entity;

import org.springframework.stereotype.Component;

@Component
public class RoleModules {//½ÇÉ«Ä£¿é
	
	private Integer Id;			//±àºÅ
	private Integer RoleId;		//½ÇÉ«±àºÅ
	private Integer ModuleId;	//¹¦ÄÜÄ£¿é±àºÅ
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	public Integer getRoleId() {
		return RoleId;
	}
	public void setRoleId(Integer roleId) {
		RoleId = roleId;
	}
	public Integer getModuleId() {
		return ModuleId;
	}
	public void setModuleId(Integer moduleId) {
		ModuleId = moduleId;
	}
	
	
}
