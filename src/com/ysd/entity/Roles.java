package com.ysd.entity;

import org.springframework.stereotype.Component;

@Component
public class Roles {//��ɫ
	
	private Integer rolesid;		//��ɫ���
	private String rolesName;	//��ɫ����
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
