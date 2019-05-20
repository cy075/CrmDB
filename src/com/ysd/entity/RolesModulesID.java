package com.ysd.entity;

public class RolesModulesID {
	private Integer rolesId;
	private Integer modulesPrentID;
	public Integer getRolesId() {
		return rolesId;
	}
	public void setRolesId(Integer rolesId) {
		this.rolesId = rolesId;
	}
	public Integer getModulesPrentID() {
		return modulesPrentID;
	}
	public void setModulesPrentID(Integer modulesPrentID) {
		this.modulesPrentID = modulesPrentID;
	}
	@Override
	public String toString() {
		return "RolesModulesID [rolesId=" + rolesId + ", modulesPrentID="
				+ modulesPrentID + "]";
	}
	
}
