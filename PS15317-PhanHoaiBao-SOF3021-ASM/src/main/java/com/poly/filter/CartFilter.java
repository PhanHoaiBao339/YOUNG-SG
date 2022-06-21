package com.poly.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

import com.poly.dto.CartDto;


@Component
public class CartFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpServletReq = (HttpServletRequest) request;
		HttpSession session = httpServletReq.getSession();
		CartDto cart = (CartDto) session.getAttribute("cart");
		if (cart == null) {
			session.setAttribute("cart", new CartDto());
		}
		chain.doFilter(request, response);
	}
}
