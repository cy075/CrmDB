package com.ysd.entity;

import org.springframework.stereotype.Component;

@Component
public class RoleModules {//��ɫģ��
	
	private Integer Id;			//���
	private Integer RoleId;		//��ɫ���
	private Integer ModuleId;	//����ģ����
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
