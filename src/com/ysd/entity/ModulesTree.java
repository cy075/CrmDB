package com.ysd.entity;

public class ModulesTree {
	private Integer id;
	private String text;
	private String path;
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
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public ModulesTree() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ModulesTree(Integer id, String text, String path) {
		super();
		this.id = id;
		this.text = text;
		this.path = path;
	}
	@Override
	public String toString() {
		return "ModulesTree [id=" + id + ", text=" + text + ", path=" + path
				+ "]";
	}
	
}
