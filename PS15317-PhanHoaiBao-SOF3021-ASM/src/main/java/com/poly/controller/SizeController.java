package com.poly.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.ProductDAO;
import com.poly.dao.SizeDAO;
import com.poly.entity.Product;
import com.poly.entity.Size;
import com.poly.utils.PageShow;

@Controller
public class SizeController {
	@Autowired
	ProductDAO prodao;
	@Autowired
	SizeDAO sizedao;
	@Autowired
	PageShow pageShow;
	@Autowired
	HttpServletRequest request;

	@RequestMapping("/admin/size-seachid")
	public String viewSizeSeachId(@RequestParam("p") Optional<Integer> p, Model model,
			@RequestParam("field") Optional<String> field, @RequestParam("idproseach") String id) {
		request.setAttribute("pageName", "Size Management");
		pageShow.pageProductSeach(p, field, model, "pagesize", id);
		return "admin/size-editform";
	}

	@RequestMapping("/admin/size-editform")
	public String viewSizeEditForm(@RequestParam("p") Optional<Integer> p, Model model,
			@RequestParam("field") Optional<String> field) {
		request.setAttribute("pageName", "Size Management");
		pageShow.pageProductAll(p, field, model, "pagesize");
		return "admin/size-editform";
	}

	@RequestMapping("/admin/size-edit")
	public String editSize(@RequestParam("p") Optional<Integer> p, @RequestParam("field") Optional<String> field,
			Model model, @RequestParam("id") String id) {
		request.setAttribute("pageName", "Size Management");
		model.addAttribute("idprod", id);
		pageShow.pageProductAll(p, field, model, "pagesize");
		List<String> list = new ArrayList<>();
		for (Size size : prodao.getById(id).getSizes()) {
			list.add(size.getName());
		}
		return "admin/size-editform";
	}

	@RequestMapping("/admin/size-save")
	public String saveSize(@RequestParam("idprod") String id, @RequestParam("name") List<String> list) {
		Product pro = prodao.getById(id);
		if (!pro.getSizes().isEmpty()) {
			for (Size s : pro.getSizes()) {
				sizedao.delete(s);
			}
		}
		for (String string : list) {
			sizedao.save(new Size(string, pro));
		}
		return "redirect:/admin/size-editform";
	}
}
