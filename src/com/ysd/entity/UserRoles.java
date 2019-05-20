package com.ysd.entity;

import org.springframework.stereotype.Component;

@Component
public class UserRoles {//用户角色
	
	private Integer Id;		//编号
	private Integer UserId; //用户编号
	private Integer RoleId;	//角色编号
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
