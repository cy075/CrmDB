package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Userchecks;


public interface UserchecksMapper {
	//签到信息
	Integer addUsercheck(Userchecks userchecks);
	//查询今日签到
	List<Userchecks> selectCheckUserJinTian(Userchecks userchecks);
	//添加签出信息
	Integer updateUserCheck(Userchecks userchecks);
}
