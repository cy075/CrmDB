package com.ysd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ysd.dao.StudentMapper;
import com.ysd.entity.Fenye;
import com.ysd.entity.Student;
@Service
public class StudentServiceImp implements StudentService {
	@Autowired
	private StudentMapper studentMapper;
	@Override
	public Fenye<Student> selectStu(Fenye<Student> fenye) {

		Integer total = studentMapper.selectCount(fenye);
		List<Student> selectStu = studentMapper.selectStu(fenye);
		
		fenye.setTotal(total);
		fenye.setRows(selectStu);
		return fenye;
	}
	@Override
	public Integer addStu(Student student) {
		// TODO Auto-generated method stub
		return studentMapper.addStu(student);
	}
	@Override
	public Integer delStu(Integer id) {
		// TODO Auto-generated method stub
		return studentMapper.delStu(id);
	}
	@Override
	public Integer updateStu(Student student) {
		// TODO Auto-generated method stub
		return studentMapper.updateStu(student);
	}

}
