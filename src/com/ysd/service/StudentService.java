package com.ysd.service;

import com.ysd.entity.Fenye;
import com.ysd.entity.Student;

public interface StudentService {
//��ѯ
	Fenye<Student> selectStu(Fenye<Student> fenye);
//���
	Integer addStu(Student student);
//ɾ��
	Integer delStu(Integer id);
//�޸�
	Integer updateStu(Student student);

}
