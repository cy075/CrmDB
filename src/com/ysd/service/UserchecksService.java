package com.ysd.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.ysd.entity.Userchecks;


public interface UserchecksService {
	//���ǩ����Ϣ
		Integer addUsercheck(HttpServletRequest request);
		//��ѯǩ�����
		List<Userchecks> selectCheckUserJinTian(HttpServletRequest request);
		//���ǩ����Ϣ
		Integer updateUserCheck(HttpServletRequest request);
}
