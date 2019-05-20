package com.ysd.entity;

public class Netfollows {
private Integer id;//id
private Integer studentId;//学生编号
private String studentName;//学生姓名
private String followTime;//跟踪时间
private String nextFollowTime;//下一次跟踪时间
private String content;//内容
private Integer userId;//用户编号
private String followType;//跟踪类别
private String createTime;//创建时间
private String followState;//跟踪状态
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}
public Integer getStudentId() {
	return studentId;
}
public void setStudentId(Integer studentId) {
	this.studentId = studentId;
}
public String getStudentName() {
	return studentName;
}
public void setStudentName(String studentName) {
	this.studentName = studentName;
}
public String getFollowTime() {
	return followTime;
}
public void setFollowTime(String followTime) {
	this.followTime = followTime;
}
public String getNextFollowTime() {
	return nextFollowTime;
}
public void setNextFollowTime(String nextFollowTime) {
	this.nextFollowTime = nextFollowTime;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public Integer getUserId() {
	return userId;
}
public void setUserId(Integer userId) {
	this.userId = userId;
}
public String getFollowType() {
	return followType;
}
public void setFollowType(String followType) {
	this.followType = followType;
}
public String getCreateTime() {
	return createTime;
}
public void setCreateTime(String createTime) {
	this.createTime = createTime;
}
public String getFollowState() {
	return followState;
}
public void setFollowState(String followState) {
	this.followState = followState;
}
@Override
public String toString() {
	return "Netfollows [id=" + id + ", studentId=" + studentId + ", studentName=" + studentName + ", followTime="
			+ followTime + ", nextFollowTime=" + nextFollowTime + ", content=" + content + ", userId=" + userId
			+ ", followType=" + followType + ", createTime=" + createTime + ", followState=" + followState + "]";
}


}
