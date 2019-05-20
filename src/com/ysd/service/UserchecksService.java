package com.ysd.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ysd.entity.Userchecks;


public interface UserchecksService {
	//添加签到信息
		Integer addUsercheck(HttpServletRequest request);
		//查询签到情况
		List<Userchecks> selectCheckUserJinTian(HttpServletRequest request);
		//添加签出信息
		Integer updateUserCheck(HttpServletRequest request);
}
