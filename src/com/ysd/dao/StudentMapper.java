package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Student;

public interface StudentMapper {
	//��ѯ������
	 Integer selectCount(Fenye<Student>  fenye);
	//��������ѯ����
	 List<Student> selectStu(Fenye<Student>  fenye);
	//���
	 Integer addStu(Student student);
	//ɾ��
	Integer delStu(Integer id);
	//�޸�
	Integer updateStu(Student student);
		
	
}
