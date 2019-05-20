package com.ysd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Fenye;
import com.ysd.entity.Student;
import com.ysd.entity.Users;
import com.ysd.service.UsersService;

@Controller
@RequestMapping("/users")
public class UsersController {
	@Autowired
	private UsersService usersService;
	
	@RequestMapping(value="/selectUsers",method=RequestMethod.POST)
	@ResponseBody
	public Fenye<Users> selectUsers(Fenye<Users> fenye,Integer rows,String LoginName,Integer IsLockout,String StartcreateTime,String EndcreateTime){
		
		fenye.setPage((fenye.getPage()-1)*rows);
		fenye.setPageSize(rows);
		
		fenye.setLoginName(LoginName);
		fenye.setStartcreateTime(StartcreateTime);
		fenye.setEndcreateTime(EndcreateTime);
		fenye.setIsLockout(IsLockout);
		
		fenye = usersService.selectAllUsers(fenye);
		
		return fenye;
	}
	

	
	@RequestMapping(value="/updateUsers",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateUsers(Users users){
		return usersService.updateUsers(users);
		
	}
	
	@RequestMapping(value="/delUsers",method=RequestMethod.POST)
	@ResponseBody
	public Integer delUsers(Integer id) {
		return usersService.delUsers(id);

	}

	@RequestMapping(value="/addAllUsers",method=RequestMethod.POST)
	@ResponseBody
	public Integer addAllUsers(Users users) {
		return usersService.addUsers(users);

	}

	
	/*锁定，解锁用户*/
	@RequestMapping(value="/openCloseUser",method=RequestMethod.POST)
	@ResponseBody
	public Integer OpenCloseUser(Users users) {
		System.out.println(users);
		return usersService.updateYonghujiesoByisLockout(users);
	}
	
	/*重置密碼 */
	@RequestMapping(value=("ResetUserPas"),method=RequestMethod.POST)
	@ResponseBody
	public Integer ResetUserPas(Users users) { 
		return usersService.updateResetpas(users);
	}

	
}
