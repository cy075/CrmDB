package com.ysd.entity;

import org.springframework.stereotype.Component;

@Component
public class Modules {//功能模块
	private Integer Id;			//模块编号
	private String Mname;		//模块名称
	private String text;
	private Integer ParentId;	//父模块编号
	private String Path;		//模块路径
	private Double Weight;		//权重
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	public String getMname() {
		return Mname;
	}
	public void setMname(String mname) {
		Mname = mname;
	}
	public Integer getParentId() {
		return ParentId;
	}
	public void setParentId(Integer parentId) {
		ParentId = parentId;
	}
	public String getPath() {
		return Path;
	}
	public void setPath(String path) {
		Path = path;
	}
	public Double getWeight() {
		return Weight;
	}
	public void setWeight(Double weight) {
		Weight = weight;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	@Override
	public String toString() {
		return "Modules [Id=" + Id + ", Mname=" + Mname + ", text=" + text + ", ParentId=" + ParentId + ", Path=" + Path
				+ ", Weight=" + Weight + "]";
	}
	
	
	
}
