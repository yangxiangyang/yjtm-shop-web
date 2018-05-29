package com.yjtm.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yjtm.domian.Users;
import com.yjtm.service.UsersService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UsersService usersService;

	@RequestMapping("/showUser")
	public String toIndex(HttpServletRequest request, Model model) {
		Users users = this.usersService.selectByPrimaryKey(1);
		model.addAttribute("user", users);
		return "/user/userLogin";
	}
}
