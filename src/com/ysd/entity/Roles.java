package com.ysd.entity;

import org.springframework.stereotype.Component;

@Component
public class Roles {//角色
	
	private Integer rolesid;		//角色编号
	private String rolesName;	//角色名称
	public Integer getRolesid() {
		return rolesid;
	}
	public void setRolesid(Integer rolesid) {
		this.rolesid = rolesid;
	}
	public String getRolesName() {
		return rolesName;
	}
	public void setRolesName(String rolesName) {
		this.rolesName = rolesName;
	}
	@Override
	public String toString() {
		return "Roles [rolesid=" + rolesid + ", rolesName=" + rolesName + "]";
	}
	
}
