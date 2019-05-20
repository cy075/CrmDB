package com.ysd.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.service.UserchecksService;

@Controller
public class userchecksController {
	@Autowired
	private UserchecksService userchecksService;
	
	//���Ա��ǩ����Ϣ
		@RequestMapping(value="addUserCheck",method=RequestMethod.POST)
		@ResponseBody
		public Integer addUserCheck(HttpServletRequest request){
			return userchecksService.addUsercheck(request);
		}
		
		//���Ա��ǩ��
		@RequestMapping(value="updateUserCheck",method=RequestMethod.POST)
		@ResponseBody
		public Integer updateUserCheck(HttpServletRequest request){
			return userchecksService.updateUserCheck(request);
		}

}
