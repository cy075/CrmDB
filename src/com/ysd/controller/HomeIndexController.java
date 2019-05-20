package com.ysd.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ysd.entity.Modules;
import com.ysd.entity.ModulesPrent;
import com.ysd.entity.ModulesTree;
import com.ysd.entity.Roles;
import com.ysd.entity.RolesTree;
import com.ysd.entity.Users;
import com.ysd.service.LoginUsersService;

@Controller
@RequestMapping("/Home")
public class HomeIndexController {
	@Autowired
	private LoginUsersService loginUsersService;
	
	
	@RequestMapping("/index")
	public String Index(){
		return "index";
	}
	
	@RequestMapping("/login")
	public String Login(){
		System.out.println("login");
		return "login";
	}
	
	@RequestMapping(value="/userLogin",method=RequestMethod.POST)
	@ResponseBody
	public Integer UserLogin(Users users,HttpServletRequest request,HttpServletResponse response){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String sj = sdf.format(new Date());
		HttpSession session = request.getSession();
		session.setAttribute("loginName", users.getLoginName());
		
		Users u = loginUsersService.selectUsersByName(users.getLoginName());
		if(null != u){//判断用户名是否存在
			users.setId(u.getId());
			if(2!=u.getIsLockout()){//判断该用户名是否被锁定
				if(!users.getPassword().equals(u.getPassword())){//判断密码是否错误
					System.out.println("密码错误");
					users.setPsdWrongTime(u.getPsdWrongTime()+1);//密码输入错误次数+1
					if(users.getPsdWrongTime()<=3){//如果密码错误次数大于3次则锁定
						System.out.println("密码错误次数+1");
						loginUsersService.updateUsersLogin(users);
						return 4;
					}else {
						System.out.println("该用户已被锁定");
						users.setLockTime(sj);//锁定时间
						users.setIsLockout(2);
						loginUsersService.updateUsersLogin(users);
						return 3;
					}
					
					
				}else {
					System.out.println("登陆成功");
					
					List<Roles> selectUsersRoles = loginUsersService.selectUsersRoles(users.getLoginName());
					session.setAttribute("userRoles", selectUsersRoles);
					
					users.setLastLoginTime(sj);//最后一次登陆时间
					users.setPsdWrongTime(1);//登录成功重置密码错误次数
					
					loginUsersService.updateUsersLogin(users);
					session.setAttribute("loginUser", u);//登录完成存入session,方便后续使用
					return 5;
				}
				
			}else {
				System.out.println("用户是锁定用户，如需解锁请联系管理员");
				return 2;
			}
			
		}else {
			System.out.println("该用户不存在");
			return 1;
		}
		
	}
	
	@RequestMapping(value="/sysRolesModules",method=RequestMethod.POST)
	@ResponseBody
	public List<RolesTree> selectRolesModules(HttpServletRequest request,HttpServletResponse response,String treeUlId){
		
		HttpSession session = request.getSession();
		List<Roles> userRoles = (List<Roles>) session.getAttribute("userRoles");
		
		
		List<RolesTree> rt = new ArrayList<RolesTree>();
		
		for(int i=0;i<userRoles.size();i++){
			
			List<ModulesTree> mt = new ArrayList<ModulesTree>();
			
			Integer rolesid = userRoles.get(i).getRolesid();
			
			ModulesPrent mp = new ModulesPrent();
			
			List<ModulesPrent> selectModulesPrent = loginUsersService.selectModulesPrent();
			
			List<ModulesTree> selectRolesModulesTree = loginUsersService.selectRolesModulesTree(rolesid);
			
			
			List<Modules> selectRolesModules = loginUsersService.selectRolesModules(rolesid);
			
			for(int l=0;l<selectModulesPrent.size();l++){
				Integer id = selectModulesPrent.get(l).getId();
				for(int k=0;k<selectRolesModules.size();k++){
					
					if(id==selectRolesModules.get(k).getParentId()){
						
						mp.setId(id);
						mp.setName(selectModulesPrent.get(l).getName());
					}
				}
			}
			for(int j=0;j<selectRolesModulesTree.size();j++){
				mt.add(new ModulesTree(selectRolesModulesTree.get(j).getId(),selectRolesModulesTree.get(j).getText(),selectRolesModulesTree.get(j).getPath()));
			}
			rt.add(new RolesTree(mp.getId(),mp.getName(),mt));
		}
		
		return rt;
	}
	
	@RequestMapping("/tuichu")
	public String tuichudenglu(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();
		session.removeAttribute("loginName");
		return "login";
	}
	
	@RequestMapping(value="/updateInfo",method=RequestMethod.POST)
	@ResponseBody
	public Integer updateInfo(Users users){
		
		return loginUsersService.updateUsersInfo(users);
	}
	
	@RequestMapping(value="/updatePsw",method=RequestMethod.POST)
	@ResponseBody
	public Integer updatePsw(String yuanPsw,String xinPsw,HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();
		Users users = (Users) session.getAttribute("loginUser");
		if(!yuanPsw.trim().equals(users.getPassword())){//如果输入密码不一致返回2代表密码错误
			
			return 2;
		}else {//正确则修改密码
			users.setPassword(xinPsw);
			loginUsersService.updateUsersPsw(users);
			return loginUsersService.updateUsersPsw(users);
		}
	}
	
	@RequestMapping(value="/reloadPsw",method=RequestMethod.POST)
	@ResponseBody
	public Integer reloadPsw(String metelPsw,String emailPsw,HttpServletRequest request,HttpServletResponse response){
		
		HttpSession session = request.getSession();
		Users users = (Users) session.getAttribute("loginUser");
		if("".equals(emailPsw.trim())){
			if(!metelPsw.trim().equals(users.getProtectMtel())){
				System.out.println("邮箱未输入,手机号不正确");
				
				return 4;
			}else {
				
				return loginUsersService.reloadPsw(users.getId());
			}
			
		}else if("".equals(metelPsw.trim())){
			if(!emailPsw.trim().equals(users.getProtectEMail())){
				System.out.println("手机号未输入，邮箱不正确");
				
				return 5;
			}else {
				
				return loginUsersService.reloadPsw(users.getId());
			}
		}else{
			if(!emailPsw.trim().equals(users.getProtectEMail()) && !metelPsw.trim().equals(users.getProtectMtel()) ){
				System.out.println("手机号和邮箱都不正确");
				
				return 6;
			}else {
				
				return loginUsersService.reloadPsw(users.getId());
			}
		}
		
	}
}
