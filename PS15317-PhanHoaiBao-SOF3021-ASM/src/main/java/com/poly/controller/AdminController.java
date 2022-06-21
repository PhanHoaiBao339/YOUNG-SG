package com.poly.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	HttpServletRequest request;

	@RequestMapping("/index")
	public String index() {
		request.setAttribute("pageName", "Dashboard");
		return "admin/index";
	}
}
