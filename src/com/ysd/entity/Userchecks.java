package com.ysd.entity;

public class Userchecks {
private Integer Id;//id
private Integer userId;//�û�ID
private String userName;//�û�����
private String checkInTime;//���ʵ�ʱ��
private String checkState;//���ʵ�ʱ��
private String isCancel;//ȡ��
private String checkOutTime;//����˳�ʱ��
public Integer getId() {
	return Id;
}
public void setId(Integer id) {
	Id = id;
}
public Integer getUserId() {
	return userId;
}
public void setUserId(Integer userId) {
	this.userId = userId;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getCheckInTime() {
	return checkInTime;
}
public void setCheckInTime(String checkInTime) {
	this.checkInTime = checkInTime;
}
public String getCheckState() {
	return checkState;
}
public void setCheckState(String checkState) {
	this.checkState = checkState;
}
public String getIsCancel() {
	return isCancel;
}
public void setIsCancel(String isCancel) {
	this.isCancel = isCancel;
}
public String getCheckOutTime() {
	return checkOutTime;
}
public void setCheckOutTime(String checkOutTime) {
	this.checkOutTime = checkOutTime;
}
@Override
public String toString() {
	return "Userchecks [Id=" + Id + ", userId=" + userId + ", userName=" + userName + ", checkInTime=" + checkInTime
			+ ", checkState=" + checkState + ", isCancel=" + isCancel + ", checkOutTime=" + checkOutTime + "]";
}

}
