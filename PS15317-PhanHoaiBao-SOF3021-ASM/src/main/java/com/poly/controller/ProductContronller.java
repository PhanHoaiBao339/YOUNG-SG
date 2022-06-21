package com.poly.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.BrandDAO;
import com.poly.dao.CategoryDAO;
import com.poly.dao.ProductDAO;
import com.poly.entity.Brand;
import com.poly.entity.Category;
import com.poly.entity.Product;
import com.poly.utils.PageShow;

@Controller
public class ProductContronller {
	@Autowired
	ProductDAO prodao;
	@Autowired
	BrandDAO bradao;
	@Autowired
	CategoryDAO catdao;
	@Autowired
	HttpServletRequest request;
	@Autowired
	PageShow pageShow;

	@RequestMapping("/admin/product/detail")
	public String detail(Model model, @RequestParam("id") String id) {
		Product product = prodao.getById(id);
		model.addAttribute("item", product);
		return "product/detail";
	}
	
	@RequestMapping("/admin/product-list")
	public String viewProductList(@RequestParam("p") Optional<Integer> p, Model model,
			@RequestParam("field") Optional<String> field) {
		pageShow.pageProductAll(p, field, model, "pageproduct");
		request.setAttribute("pageName", "Product Management");
		return "admin/product-list";
	}

	@ModelAttribute("brands")
	public List<Brand> getBrand() {
		return bradao.findAll();
	}

	@ModelAttribute("categorys")
	public List<Category> getCategory() {
		return catdao.findAll();
	}

	@RequestMapping("/admin/product-editform")
	public String viewProductEditForm(Model model) {
		model.addAttribute("prod", new Product());
		request.setAttribute("pageName", "Product Management");
		return "admin/product-editform";
	}

	@RequestMapping("/admin/product-edit")
	public String edit(Model model, @RequestParam("id") String id) {
		request.setAttribute("pageName", "Product Management");
		Product prod = prodao.getById(id);
		model.addAttribute("prod", prod);
		return "admin/product-editform";
	}

	@RequestMapping("/admin/product-save")
	public String saveProduct(Product product) {
		prodao.save(product);
		return "redirect:/admin/product-list";
	}

	@RequestMapping("/admin/product-update")
	public String updateProduct(Product product) {
		prodao.save(product);
		return "redirect:/admin/product-list";
	}

	@RequestMapping("/admin/product-delete")
	public String deleteProduct(@RequestParam("id") String id) {
		prodao.deleteById(id);
		return "redirect:/admin/product-list";
	}
}
