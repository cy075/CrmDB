package com.ysd.entity;

import java.util.List;

public class RolesTree {
	
	private Integer id;
	private String text;
	private List<ModulesTree> children;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public List<ModulesTree> getChildren() {
		return children;
	}
	public void setChildren(List<ModulesTree> children) {
		this.children = children;
	}
	
	
	
	public RolesTree(Integer id, String text, List<ModulesTree> children) {
		super();
		this.id = id;
		this.text = text;
		this.children = children;
	}
	public RolesTree() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "RolesTree [id=" + id + ", text=" + text + ", children="
				+ children + "]";
	}
	
	
}
