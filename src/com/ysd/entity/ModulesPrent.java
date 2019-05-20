package com.ysd.entity;


import org.springframework.stereotype.Component;
@Component
public class ModulesPrent {//模块父接口
	
	private Integer id;				//模块父编号
	private String name;			//模块父名称
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "ModulesPrent [id=" + id + ", name=" + name + "]";
	}
	
}
