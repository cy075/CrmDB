package com.ysd.dao;

import java.util.List;

import com.ysd.entity.Fenye;
import com.ysd.entity.Student;

public interface StudentMapper {
	//查询总条数
	 Integer selectCount(Fenye<Student>  fenye);
	//都条件查询数据
	 List<Student> selectStu(Fenye<Student>  fenye);
	//添加
	 Integer addStu(Student student);
	//删除
	Integer delStu(Integer id);
	//修改
	Integer updateStu(Student student);
		
	
}
