package com.ysd.entity;

public class Askers {
	
private Integer askerId;//id
private String askerName;//����������
private String checkState;//����״̬
private String checkInTime;//���ʵ�ʱ��
private String changeState;//�ı�״̬
private Integer weight;//����
private String roleName;//ְҵ����
private String bakContent;//����
public Integer getAskerId() {
	return askerId;
}
public void setAskerId(Integer askerId) {
	this.askerId = askerId;
}
public String getAskerName() {
	return askerName;
}
public void setAskerName(String askerName) {
	this.askerName = askerName;
}
public String getCheckState() {
	return checkState;
}
public void setCheckState(String checkState) {
	this.checkState = checkState;
}
public String getCheckInTime() {
	return checkInTime;
}
public void setCheckInTime(String checkInTime) {
	this.checkInTime = checkInTime;
}
public String getChangeState() {
	return changeState;
}
public void setChangeState(String changeState) {
	this.changeState = changeState;
}
public Integer getWeight() {
	return weight;
}
public void setWeight(Integer weight) {
	this.weight = weight;
}
public String getRoleName() {
	return roleName;
}
public void setRoleName(String roleName) {
	this.roleName = roleName;
}
public String getBakContent() {
	return bakContent;
}
public void setBakContent(String bakContent) {
	this.bakContent = bakContent;
}
@Override
public String toString() {
	return "Askers [askerId=" + askerId + ", askerName=" + askerName + ", checkState=" + checkState + ", checkInTime="
			+ checkInTime + ", changeState=" + changeState + ", weight=" + weight + ", roleName=" + roleName
			+ ", bakContent=" + bakContent + "]";
}


}
