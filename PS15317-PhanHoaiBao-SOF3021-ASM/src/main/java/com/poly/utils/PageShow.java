package com.poly.utils;

import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.poly.dao.ImageDAO;
import com.poly.dao.OrderDAO;
import com.poly.dao.ProductDAO;
import com.poly.entity.Image;
import com.poly.entity.Product;
import com.poly.entity.Order;
import com.poly.entity.OrderDetail;

@Service
public class PageShow {
	@Autowired
	ProductDAO productDAO;
	@Autowired
	ImageDAO imageDAO;
	@Autowired
	OrderDAO orderDAO;
	@Autowired
	HttpServletRequest request;

	public void pageProductAll(Optional<Integer> p, Optional<String> field, Model model, String pagename) {
		Sort sort = Sort.by(Direction.ASC, field.orElse("id"));
		model.addAttribute("field", field.orElse("id").toUpperCase());
		Pageable pageable;
		Pageable pageable1;
		Page<Product> page;
		if (p.orElse(0) < 0) {
			pageable1 = PageRequest.of(0, 10, sort);
			page = productDAO.findAll(pageable1);
			request.setAttribute(pagename, page);
		} else {
			pageable = PageRequest.of(p.orElse(0), 10, sort);
			Page<Product> page1 = productDAO.findAll(pageable);

			if (p.orElse(0) >= page1.getTotalPages()) {
				pageable1 = PageRequest.of(page1.getTotalPages() - 1, 10, sort);
			} else {
				pageable1 = PageRequest.of(p.orElse(0), 10, sort);
			}
			page = productDAO.findAll(pageable1);
			request.setAttribute(pagename, page);
		}
	}

	public void pageProductSeach(Optional<Integer> p, Optional<String> field, Model model, String pagename,
			String idpro) {
		Sort sort = Sort.by(Direction.ASC, field.orElse("id"));
		model.addAttribute("field", field.orElse("id").toUpperCase());
		Pageable pageable;
		Pageable pageable1;
		Page<Product> page;
		if (p.orElse(0) < 0) {
			pageable1 = PageRequest.of(0, 10, sort);
			page = productDAO.findByKeywords("%" + idpro + "%", pageable1);
			request.setAttribute(pagename, page);
		} else {
			pageable = PageRequest.of(p.orElse(0), 10, sort);
			Page<Product> page1 = productDAO.findByKeywords("%" + idpro + "%", pageable);

			if (p.orElse(0) >= page1.getTotalPages()) {
				pageable1 = PageRequest.of(page1.getTotalPages() - 1, 10, sort);
			} else {
				pageable1 = PageRequest.of(p.orElse(0), 10, sort);
			}
			page = productDAO.findByKeywords("%" + idpro + "%", pageable1);
			request.setAttribute(pagename, page);
		}
	}

	// Image
	public void pageImageAll(Optional<Integer> p, Optional<String> field, Model model, String pagename) {
		Sort sort = Sort.by(Direction.ASC, field.orElse("id"));
		model.addAttribute("field", field.orElse("id").toUpperCase());
		Pageable pageable;
		Pageable pageable1;
		Page<Image> page;
		if (p.orElse(0) < 0) {
			pageable1 = PageRequest.of(0, 10, sort);
			page = imageDAO.findAll(pageable1);
			request.setAttribute(pagename, page);
		} else {
			pageable = PageRequest.of(p.orElse(0), 10, sort);
			Page<Image> page1 = imageDAO.findAll(pageable);

			if (p.orElse(0) >= page1.getTotalPages()) {
				pageable1 = PageRequest.of(page1.getTotalPages() - 1, 10, sort);
			} else {
				pageable1 = PageRequest.of(p.orElse(0), 10, sort);
			}
			page = imageDAO.findAll(pageable1);
			request.setAttribute(pagename, page);
		}
	}

	public void pageImageSeach(Optional<Integer> p, Optional<String> field, Model model, String pagename,
			String idpro) {
		Sort sort = Sort.by(Direction.ASC, field.orElse("id"));
		model.addAttribute("field", field.orElse("id").toUpperCase());
		Pageable pageable;
		Pageable pageable1;
		Page<Image> page;
		if (p.orElse(0) < 0) {
			pageable1 = PageRequest.of(0, 10, sort);
			page = imageDAO.findByKeywords("%" + idpro + "%", pageable1);
			request.setAttribute(pagename, page);
		} else {
			pageable = PageRequest.of(p.orElse(0), 10, sort);
			Page<Image> page1 = imageDAO.findByKeywords("%" + idpro + "%", pageable);

			if (p.orElse(0) >= page1.getTotalPages()) {
				pageable1 = PageRequest.of(page1.getTotalPages() - 1, 10, sort);
			} else {
				pageable1 = PageRequest.of(p.orElse(0), 10, sort);
			}
			page = imageDAO.findByKeywords("%" + idpro + "%", pageable1);
			request.setAttribute(pagename, page);
		}
	}

	// Order
	public void pageOrderAll(Optional<Integer> p, Optional<String> field, Model model, String pagename) {
		Sort sort = Sort.by(Direction.ASC, field.orElse("id"));
		model.addAttribute("field", field.orElse("id").toUpperCase());
		Pageable pageable;
		Pageable pageable1;
		Page<Order> page;
		if (p.orElse(0) < 0) {
			pageable1 = PageRequest.of(0, 10, sort);
			page = orderDAO.findAll(pageable1);
			request.setAttribute(pagename, page);
		} else {
			pageable = PageRequest.of(p.orElse(0), 10, sort);
			Page<Order> page1 = orderDAO.findAll(pageable);

			if (p.orElse(0) >= page1.getTotalPages()) {
				pageable1 = PageRequest.of(page1.getTotalPages() - 1, 10, sort);
			} else {
				pageable1 = PageRequest.of(p.orElse(0), 10, sort);
			}
			page = orderDAO.findAll(pageable1);
			request.setAttribute(pagename, page);
		}
	}

	// OrderDetail
	public void pageOrderDetail(Optional<Integer> p, Optional<String> field, Model model, String pagename,
			List<OrderDetail> list) {
		Sort sort = Sort.by(Direction.ASC, field.orElse("id"));
		model.addAttribute("field", field.orElse("id").toUpperCase());
		Pageable pageable;
		Pageable pageable1;
		Page<OrderDetail> page;
		if (p.orElse(0) < 0) {
			pageable1 = PageRequest.of(0, 10, sort);
			page = new PageImpl<>(list, pageable1, list.size());
			request.setAttribute(pagename, page);
		} else {
			pageable = PageRequest.of(p.orElse(0), 10, sort);
			Page<OrderDetail> page1 = new PageImpl<>(list, pageable, list.size());
			if (p.orElse(0) >= page1.getTotalPages()) {
				pageable1 = PageRequest.of(page1.getTotalPages() - 1, 10, sort);
			} else {
				pageable1 = PageRequest.of(p.orElse(0), 10, sort);
			}
			page = new PageImpl<>(list, pageable1, list.size());
			request.setAttribute(pagename, page);
		}
	}
}
