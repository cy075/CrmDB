package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Userchecks;


public interface UserchecksMapper {
	//ǩ����Ϣ
	Integer addUsercheck(Userchecks userchecks);
	//��ѯ����ǩ��
	List<Userchecks> selectCheckUserJinTian(Userchecks userchecks);
	//���ǩ����Ϣ
	Integer updateUserCheck(Userchecks userchecks);
}
