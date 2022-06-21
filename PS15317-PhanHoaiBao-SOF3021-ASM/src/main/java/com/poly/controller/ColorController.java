package com.poly.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.entity.Product;

@Controller
public class ColorController {
	@Autowired
	HttpServletRequest request;

	@RequestMapping("/admin/color-editform")
	public String viewColorEditForm(Model model) {
		model.addAttribute("prod", new Product());
		request.setAttribute("pageName", "Color Management");
		return "admin/color-editform";
	}
}
