package com.yjtm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yjtm.domian.Users;

@Controller
@RequestMapping("/login")
public class LoginController {

	@RequestMapping("/person")
	@ResponseBody
	public Users register(Users person) {
		Users users=new Users();
		users.setSex("1");
		return users;
	}
}
