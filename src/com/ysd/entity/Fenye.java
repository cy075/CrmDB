package com.ysd.entity;

import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class Fenye<T> {
	
	private Integer page;
	private Integer pageSize;
	private Integer total;
	private List<T> rows;
	
	private String LoginName;
	private Integer IsLockout;
	private String StartcreateTime;
	private String EndcreateTime;
	
	private String stuname;
	private String stuphone;
	private String stuqq;
	private String stucreateTime;
	private String stuziXunName;
	private String stuisPay;
	private String stuisValid;
	private String stuisReturnVist;
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	public String getLoginName() {
		return LoginName;
	}
	public void setLoginName(String loginName) {
		LoginName = loginName;
	}
	public Integer getIsLockout() {
		return IsLockout;
	}
	public void setIsLockout(Integer isLockout) {
		IsLockout = isLockout;
	}
	public String getStartcreateTime() {
		return StartcreateTime;
	}
	public void setStartcreateTime(String startcreateTime) {
		StartcreateTime = startcreateTime;
	}
	public String getEndcreateTime() {
		return EndcreateTime;
	}
	public void setEndcreateTime(String endcreateTime) {
		EndcreateTime = endcreateTime;
	}
	public String getStuname() {
		return stuname;
	}
	public void setStuname(String stuname) {
		this.stuname = stuname;
	}
	public String getStuphone() {
		return stuphone;
	}
	public void setStuphone(String stuphone) {
		this.stuphone = stuphone;
	}
	public String getStuqq() {
		return stuqq;
	}
	public void setStuqq(String stuqq) {
		this.stuqq = stuqq;
	}
	public String getStucreateTime() {
		return stucreateTime;
	}
	public void setStucreateTime(String stucreateTime) {
		this.stucreateTime = stucreateTime;
	}
	public String getStuziXunName() {
		return stuziXunName;
	}
	public void setStuziXunName(String stuziXunName) {
		this.stuziXunName = stuziXunName;
	}
	public String getStuisPay() {
		return stuisPay;
	}
	public void setStuisPay(String stuisPay) {
		this.stuisPay = stuisPay;
	}
	public String getStuisValid() {
		return stuisValid;
	}
	public void setStuisValid(String stuisValid) {
		this.stuisValid = stuisValid;
	}
	public String getStuisReturnVist() {
		return stuisReturnVist;
	}
	public void setStuisReturnVist(String stuisReturnVist) {
		this.stuisReturnVist = stuisReturnVist;
	}
	@Override
	public String toString() {
		return "Fenye [page=" + page + ", pageSize=" + pageSize + ", total=" + total + ", rows=" + rows + ", LoginName="
				+ LoginName + ", IsLockout=" + IsLockout + ", StartcreateTime=" + StartcreateTime + ", EndcreateTime="
				+ EndcreateTime + ", stuname=" + stuname + ", stuphone=" + stuphone + ", stuqq=" + stuqq
				+ ", stucreateTime=" + stucreateTime + ", stuziXunName=" + stuziXunName + ", stuisPay=" + stuisPay
				+ ", stuisValid=" + stuisValid + ", stuisReturnVist=" + stuisReturnVist + "]";
	}
	
	
	
	
}
