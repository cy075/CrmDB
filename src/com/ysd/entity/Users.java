package com.ysd.entity;


import org.springframework.stereotype.Component;

@Component
public class Users {//�û�
	
	private Integer Id;				//���
	private String LoginName;		//��¼��
	private String Password;		//����
	private Integer IsLockout;		//�Ƿ�����
	private String LastLoginTime;	//���һ�ε�¼ʱ��
	private String CreateTime;		//�˻�����ʱ��
	private String LockTime;		//������ʱ��
	private Integer PsdWrongTime;	//����������
	private String ProtectEMail;	//�ܱ�����
	private String ProtectMtel;		//�ܱ��ֻ���
	
	private String resetPassword; //��������
	public String getResetPassword() {
		return resetPassword;
	}
	public void setResetPassword(String resetPassword) {
		this.resetPassword = resetPassword;
	}
	public Integer getId() {
		return Id;
	}
	public void setId(Integer id) {
		Id = id;
	}
	public String getLoginName() {
		return LoginName;
	}
	public void setLoginName(String loginName) {
		LoginName = loginName;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public Integer getIsLockout() {
		return IsLockout;
	}
	public void setIsLockout(Integer isLockout) {
		IsLockout = isLockout;
	}
	public String getLastLoginTime() {
		return LastLoginTime;
	}
	public void setLastLoginTime(String lastLoginTime) {
		LastLoginTime = lastLoginTime;
	}
	public String getCreateTime() {
		return CreateTime;
	}
	public void setCreateTime(String createTime) {
		CreateTime = createTime;
	}
	public String getLockTime() {
		return LockTime;
	}
	public void setLockTime(String lockTime) {
		LockTime = lockTime;
	}
	public Integer getPsdWrongTime() {
		return PsdWrongTime;
	}
	public void setPsdWrongTime(Integer psdWrongTime) {
		PsdWrongTime = psdWrongTime;
	}
	public String getProtectEMail() {
		return ProtectEMail;
	}
	public void setProtectEMail(String protectEMail) {
		ProtectEMail = protectEMail;
	}
	public String getProtectMtel() {
		return ProtectMtel;
	}
	public void setProtectMtel(String protectMtel) {
		ProtectMtel = protectMtel;
	}
	@Override
	public String toString() {
		return "Users [Id=" + Id + ", LoginName=" + LoginName + ", Password=" + Password + ", IsLockout=" + IsLockout
				+ ", LastLoginTime=" + LastLoginTime + ", CreateTime=" + CreateTime + ", LockTime=" + LockTime
				+ ", PsdWrongTime=" + PsdWrongTime + ", ProtectEMail=" + ProtectEMail + ", ProtectMtel=" + ProtectMtel
				+ ", resetPassword=" + resetPassword + "]";
	}
	
	
	
}
