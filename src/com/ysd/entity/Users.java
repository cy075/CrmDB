package com.ysd.entity;


import org.springframework.stereotype.Component;

@Component
public class Users {//用户
	
	private Integer Id;				//编号
	private String LoginName;		//登录名
	private String Password;		//密码
	private Integer IsLockout;		//是否锁定
	private String LastLoginTime;	//最后一次登录时间
	private String CreateTime;		//账户创立时间
	private String LockTime;		//被锁定时间
	private Integer PsdWrongTime;	//密码错误次数
	private String ProtectEMail;	//密保邮箱
	private String ProtectMtel;		//密保手机号
	
	private String resetPassword; //重置密码
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
