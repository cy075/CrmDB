package com.ysd.entity;

import org.springframework.stereotype.Component;

@Component
public class Modules {//����ģ��
	private Integer Id;			//ģ����
	private String Mname;		//ģ������
	private String text;
	private Integer ParentId;	//��ģ����
	private String Path;		//ģ��·��
	private Double Weight;		//Ȩ��
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
