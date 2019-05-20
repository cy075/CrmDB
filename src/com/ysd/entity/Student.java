package com.ysd.entity;

import org.springframework.stereotype.Component;

@Component
public class Student {
private Integer id;
private String name;//姓名
private String sex;//性别
private Integer age;//年龄
private String phone;//电话
private String status;//学历
private String state;//状态
private String msgSource;//来源渠道
private String sourceUrl;//来源网站
private String sourceKeyWorld;//来源关键词
private String address;//地址
private Integer netPusherId;//推销者id
private Integer askerId;//发布者id
private String qq;//qq
private String weixin;//微信
private String content;//内容
private String createTime;//创建时间
private String learnForward;//来源部门
private String isValid;//是否报备
private String record;//课程方向
private String isReturnVist;//是否回访
private String firstVistTime;//第一次回访时间
private String isHome;//是否上门
private String homeTime;//上门时间
private String lostValid;//无效原因
private String isPay;//是否缴费
private String payTime;//缴费时间
private String money;//金额
private String isReturnMoney;//是否退费
private String isInClass;//是否进班
private String inClassTime;//进班时间
private String inClassContent;//进班备注
private String askerContent;//退费原因
private String isDel;//是否删除
private String formPart;//来源部门
private String concern;//影响
private String isBaoBei;//是否报备
private String ziXunName;//咨询师姓名
private String createUser;//录入人
private String returnMoneyReason;//退费原因
private String preMoney;//定金金额
private String preMoneyTime;//定金时间

private String askerName;
public String getAskerName() {
	return askerName;
}
public void setAskerName(String askerName) {
	this.askerName = askerName;
}
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
public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
public Integer getAge() {
	return age;
}
public void setAge(Integer age) {
	this.age = age;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public String getMsgSource() {
	return msgSource;
}
public void setMsgSource(String msgSource) {
	this.msgSource = msgSource;
}
public String getSourceUrl() {
	return sourceUrl;
}
public void setSourceUrl(String sourceUrl) {
	this.sourceUrl = sourceUrl;
}
public String getSourceKeyWorld() {
	return sourceKeyWorld;
}
public void setSourceKeyWorld(String sourceKeyWorld) {
	this.sourceKeyWorld = sourceKeyWorld;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public Integer getNetPusherId() {
	return netPusherId;
}
public void setNetPusherId(Integer netPusherId) {
	this.netPusherId = netPusherId;
}
public Integer getAskerId() {
	return askerId;
}
public void setAskerId(Integer askerId) {
	this.askerId = askerId;
}
public String getQq() {
	return qq;
}
public void setQq(String qq) {
	this.qq = qq;
}
public String getWeixin() {
	return weixin;
}
public void setWeixin(String weixin) {
	this.weixin = weixin;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getCreateTime() {
	return createTime;
}
public void setCreateTime(String createTime) {
	this.createTime = createTime;
}
public String getLearnForward() {
	return learnForward;
}
public void setLearnForward(String learnForward) {
	this.learnForward = learnForward;
}
public String getIsValid() {
	return isValid;
}
public void setIsValid(String isValid) {
	this.isValid = isValid;
}
public String getRecord() {
	return record;
}
public void setRecord(String record) {
	this.record = record;
}
public String getIsReturnVist() {
	return isReturnVist;
}
public void setIsReturnVist(String isReturnVist) {
	this.isReturnVist = isReturnVist;
}
public String getFirstVistTime() {
	return firstVistTime;
}
public void setFirstVistTime(String firstVistTime) {
	this.firstVistTime = firstVistTime;
}
public String getIsHome() {
	return isHome;
}
public void setIsHome(String isHome) {
	this.isHome = isHome;
}
public String getHomeTime() {
	return homeTime;
}
public void setHomeTime(String homeTime) {
	this.homeTime = homeTime;
}
public String getLostValid() {
	return lostValid;
}
public void setLostValid(String lostValid) {
	this.lostValid = lostValid;
}
public String getIsPay() {
	return isPay;
}
public void setIsPay(String isPay) {
	this.isPay = isPay;
}
public String getPayTime() {
	return payTime;
}
public void setPayTime(String payTime) {
	this.payTime = payTime;
}
public String getMoney() {
	return money;
}
public void setMoney(String money) {
	this.money = money;
}
public String getIsReturnMoney() {
	return isReturnMoney;
}
public void setIsReturnMoney(String isReturnMoney) {
	this.isReturnMoney = isReturnMoney;
}
public String getIsInClass() {
	return isInClass;
}
public void setIsInClass(String isInClass) {
	this.isInClass = isInClass;
}
public String getInClassTime() {
	return inClassTime;
}
public void setInClassTime(String inClassTime) {
	this.inClassTime = inClassTime;
}
public String getInClassContent() {
	return inClassContent;
}
public void setInClassContent(String inClassContent) {
	this.inClassContent = inClassContent;
}
public String getAskerContent() {
	return askerContent;
}
public void setAskerContent(String askerContent) {
	this.askerContent = askerContent;
}
public String getIsDel() {
	return isDel;
}
public void setIsDel(String isDel) {
	this.isDel = isDel;
}
public String getFormPart() {
	return formPart;
}
public void setFormPart(String formPart) {
	this.formPart = formPart;
}
public String getConcern() {
	return concern;
}
public void setConcern(String concern) {
	this.concern = concern;
}
public String getIsBaoBei() {
	return isBaoBei;
}
public void setIsBaoBei(String isBaoBei) {
	this.isBaoBei = isBaoBei;
}
public String getZiXunName() {
	return ziXunName;
}
public void setZiXunName(String ziXunName) {
	this.ziXunName = ziXunName;
}
public String getCreateUser() {
	return createUser;
}
public void setCreateUser(String createUser) {
	this.createUser = createUser;
}
public String getReturnMoneyReason() {
	return returnMoneyReason;
}
public void setReturnMoneyReason(String returnMoneyReason) {
	this.returnMoneyReason = returnMoneyReason;
}
public String getPreMoney() {
	return preMoney;
}
public void setPreMoney(String preMoney) {
	this.preMoney = preMoney;
}
public String getPreMoneyTime() {
	return preMoneyTime;
}
public void setPreMoneyTime(String preMoneyTime) {
	this.preMoneyTime = preMoneyTime;
}
@Override
public String toString() {
	return "Student [id=" + id + ", name=" + name + ", sex=" + sex + ", age=" + age + ", phone=" + phone + ", status="
			+ status + ", state=" + state + ", msgSource=" + msgSource + ", sourceUrl=" + sourceUrl
			+ ", sourceKeyWorld=" + sourceKeyWorld + ", address=" + address + ", netPusherId=" + netPusherId
			+ ", askerId=" + askerId + ", qq=" + qq + ", weixin=" + weixin + ", content=" + content + ", createTime="
			+ createTime + ", learnForward=" + learnForward + ", isValid=" + isValid + ", record=" + record
			+ ", isReturnVist=" + isReturnVist + ", firstVistTime=" + firstVistTime + ", isHome=" + isHome
			+ ", homeTime=" + homeTime + ", lostValid=" + lostValid + ", isPay=" + isPay + ", payTime=" + payTime
			+ ", money=" + money + ", isReturnMoney=" + isReturnMoney + ", isInClass=" + isInClass + ", inClassTime="
			+ inClassTime + ", inClassContent=" + inClassContent + ", askerContent=" + askerContent + ", isDel=" + isDel
			+ ", formPart=" + formPart + ", concern=" + concern + ", isBaoBei=" + isBaoBei + ", ziXunName=" + ziXunName
			+ ", createUser=" + createUser + ", returnMoneyReason=" + returnMoneyReason + ", preMoney=" + preMoney
			+ ", preMoneyTime=" + preMoneyTime + "]";
}


}
