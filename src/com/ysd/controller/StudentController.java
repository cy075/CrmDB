package com.ysd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Fenye;
import com.ysd.entity.Student;
import com.ysd.service.StudentService;

@Controller
public class StudentController {
	@Autowired
	private StudentService studentService;
	@Autowired
	private Fenye<Student> fenye;
	
	@RequestMapping(value="/getStu",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Student> getStu(Integer page,Integer rows,String stuname,String stuphone,String stuqq,String stuziXunName,String stucreateTime,String stuisPay,String stuisValid,String stuisReturnVist){
		fenye.setPage((page-1)*rows);
		fenye.setPageSize(rows);
		fenye.setStuname(stuname);
		fenye.setStuphone(stuphone);
		fenye.setStuqq(stuqq);
		fenye.setStuziXunName(stuziXunName);
		fenye.setStucreateTime(stucreateTime);
		fenye.setStuisPay(stuisPay);
		fenye.setStuisValid(stuisValid);
		
		fenye.setStucreateTime(stucreateTime);
		fenye.setStuisReturnVist(stuisReturnVist);
		
		fenye=studentService.selectStu(fenye);
		return fenye;
	}
	
	@RequestMapping(value="/addStu",method=RequestMethod.POST)
	@ResponseBody
	public Integer addStu(Student student){
		return studentService.addStu(student);
		
	}
	
	@RequestMapping(value="/delStu",method=RequestMethod.POST)
	@ResponseBody
	public Integer delStu(Integer id){
		return studentService.delStu(id);
		
	}
	
	@RequestMapping(value="/updateStu",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateStu(Student student){
		return studentService.updateStu(student);
		
	}
}
