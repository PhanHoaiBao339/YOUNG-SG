package com.poly.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.BrandDAO;
import com.poly.dao.CategoryDAO;
import com.poly.dao.ProductDAO;
import com.poly.entity.Brand;
import com.poly.entity.Category;
import com.poly.entity.Product;
import com.poly.service.ParamService;
import com.poly.service.SessionService;

@Controller
public class HomeController {
	@Autowired
	HttpServletRequest request;
	@Autowired
	ProductDAO dao;
	@Autowired
	CategoryDAO daoca;
	@Autowired
	BrandDAO daobr;
	@Autowired
	SessionService session;

	@RequestMapping(value = { "/home/index", "/" })
	public String index(@RequestParam("p") Optional<Integer> p) {
		if (session.get("ktdn") == null) {
			session.set("ktdn", false);
		}
		List<Category> categories = daoca.findAll();
		request.setAttribute("categories", categories);
		List<Brand> brands = daobr.findAll();
		request.setAttribute("brands", brands);
		Pageable pageable = PageRequest.of(p.orElse(0), 8);
		List<Product> list = dao.findAll();
		for (Product product : list) {
			if (product.getColors().size() == 0) {
				product.setAvailable(false);
				dao.save(product);
			}
		}
		Page<Product> page = dao.findAllByAvailableTrue(pageable);
		request.setAttribute("page", page);

		return "home/index";
	}

//	@RequestMapping("/home/about")
//	public String about() {
//		return "home/about";
//	}
}