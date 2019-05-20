package com.ysd.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.UserchecksMapper;
import com.ysd.entity.Userchecks;
import com.ysd.entity.Users;
@Service
public class UserchecksServiceImp implements UserchecksService {
	@Autowired
	private UserchecksMapper userchecksMapper;
	
	@Autowired
	private LoginUsersService loginUsersService;
	@Override
	public Integer addUsercheck(HttpServletRequest request) {
		Userchecks userchecks=new Userchecks();
		HttpSession session = request.getSession();
		String loginName = (String) session.getAttribute("loginName");
		Users u = new Users();
		u.setLoginName(loginName);
		/* 根据名称查询用户信息 */
		 Users selectUsersByName = loginUsersService.selectUsersByName(loginName);
		 Date date = new Date();
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String format = sdf.format(date);
			userchecks.setUserId(selectUsersByName.getId());
			userchecks.setUserName(loginName);
			userchecks.setCheckInTime(format);
			userchecks.setCheckState(request.getParameter("checkState"));
			return userchecksMapper.addUsercheck(userchecks);
	}

	@Override
	public List<Userchecks> selectCheckUserJinTian(HttpServletRequest request) {
		Userchecks userchecks=new Userchecks();
		HttpSession session = request.getSession();
		String loginName = (String) session.getAttribute("loginName");
		Users u = new Users();
		u.setLoginName(loginName);
		Users selectUsersByName = loginUsersService.selectUsersByName(loginName);
		userchecks.setUserId(selectUsersByName.getId());
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String format = sdf.format(date);
		userchecks.setCheckInTime(format);
		return userchecksMapper.selectCheckUserJinTian(userchecks);
	}

	@Override
	public Integer updateUserCheck(HttpServletRequest request) {
		Integer i=0;
		Userchecks userchecks=new Userchecks();
		HttpSession session = request.getSession();
		String loginName = (String) session.getAttribute("loginName");
		Users u = new Users();
		u.setLoginName(loginName);
		/* 根据名称查询用户信息 */
		  Users selectUsersByName = loginUsersService.selectUsersByName(loginName);
		Date date = new Date();
	
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		String checkTime = sdf1.format(date);
		userchecks.setUserName(loginName);
		userchecks.setCheckInTime(checkTime);
		userchecks.setUserId(selectUsersByName.getId());
		List<Userchecks> selectCheckUserJinTian = userchecksMapper.selectCheckUserJinTian(userchecks);
		if(selectCheckUserJinTian.size()>0){
			String isCancel = request.getParameter("isCancel");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String CheckOutTime = sdf.format(date);
			userchecks.setCheckOutTime(CheckOutTime);
			userchecks.setIsCancel(isCancel);
			userchecks.setCheckInTime(selectCheckUserJinTian.get(0).getCheckInTime());
			userchecksMapper.updateUserCheck(userchecks);
			i=1;
		}
		return i;
	}

}
