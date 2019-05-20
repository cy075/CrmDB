package com.ysd.service;

import com.ysd.entity.Fenye;
import com.ysd.entity.Student;

public interface StudentService {
//²éÑ¯
	Fenye<Student> selectStu(Fenye<Student> fenye);
//Ìí¼Ó
	Integer addStu(Student student);
//É¾³ı
	Integer delStu(Integer id);
//ĞŞ¸Ä
	Integer updateStu(Student student);

}
