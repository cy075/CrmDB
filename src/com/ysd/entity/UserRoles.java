package com.ysd.entity;

import org.springframework.stereotype.Component;

@Component
public class UserRoles {//�û���ɫ
	
	private Integer Id;		//���
	private Integer UserId; //�û����
	private Integer RoleId;	//��ɫ���
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	public Integer getUserId() {
		return UserId;
	}
	public void setUserId(Integer userId) {
		UserId = userId;
	}
	public Integer getRoleId() {
		return RoleId;
	}
	public void setRoleId(Integer roleId) {
		RoleId = roleId;
	}
	
	
}
