package com.ysd.entity;


import org.springframework.stereotype.Component;
@Component
public class ModulesPrent {//ģ�鸸�ӿ�
	
	private Integer id;				//ģ�鸸���
	private String name;			//ģ�鸸����
	
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
