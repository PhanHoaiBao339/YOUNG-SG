package com.poly.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.OrderDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.entity.Order;
import com.poly.utils.PageShow;

@Controller
public class ReportController {
	@Autowired
	HttpServletRequest request;
	@Autowired
	OrderDAO orderDAO;
	@Autowired
	OrderDetailDAO detailDAO;
	@Autowired
	PageShow pageShow;

	@RequestMapping("/report/order")
	public String reportOrder(@RequestParam("p") Optional<Integer> p, Model model,
			@RequestParam("field") Optional<String> field) {
		request.setAttribute("pageName", "Report");
		pageShow.pageOrderAll(p, field, model, "pageorder");

		return "report/order";
	}

	@RequestMapping("/report/orderdetails")
	public String viewreportOrderDetail() {
		request.setAttribute("pageName", "Report");
		return "report/orderdetail";
	}

	@RequestMapping("/report/orderdetail")
	public String reportOrderDetail(@RequestParam("p") Optional<Integer> p, Model model,
			@RequestParam("field") Optional<String> field, @RequestParam("id") Long id) {
		request.setAttribute("pageName", "Report");
		Order order = orderDAO.getById(id);
		model.addAttribute("item", order);
		pageShow.pageOrderDetail(p, field, model, "pageorderdetail", order.getOrderdetails());
		return "report/orderdetail";
	}
}
