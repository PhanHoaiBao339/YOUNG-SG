package com.poly.controller;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.utils.PageShow;

@Controller
public class ImageController {
	@Autowired
	HttpServletRequest request;
	@Autowired
	PageShow pageShow;

	@RequestMapping("/admin/image-editform")
	public String viewImageEditForm(@RequestParam("p") Optional<Integer> p, Model model,
			@RequestParam("field") Optional<String> field) {
		request.setAttribute("pageName", "Image Management");
		pageShow.pageImageAll(p, field, model, "page");
		return "admin/image-editform";
	}

	@RequestMapping("/admin/image-seachid")
	public String viewImageSeachId(@RequestParam("p") Optional<Integer> p, Model model,
			@RequestParam("field") Optional<String> field, @RequestParam("idimgseach") String id) {
		request.setAttribute("pageName", "Image Management");
		pageShow.pageImageSeach(p, field, model, "page", id);
		return "admin/image-editform";
	}
}
