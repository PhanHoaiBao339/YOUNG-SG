package com.poly.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.AccountDAO;
import com.poly.entity.Account;
import com.poly.service.CookieService;
import com.poly.service.SessionService;

@Controller
public class AccountController {
	@Autowired
	AccountDAO dao;
	@Autowired
	SessionService session;
	@Autowired
	HttpServletRequest request;

	@GetMapping("/account/login")
	public String login() {
		return "account/login";
	}

	@PostMapping("/account/login")
	public String login(Model model, @RequestParam("username") String username,
			@RequestParam("password") String password) {
		try {
			Account user = dao.getById(username);
			if (!user.getPassword().equals(password)) {
				session.set("ktdn", false);
				model.addAttribute("message", "Sai tài khoản hoặc mật khẩu!");
			} else {
				session.set("user", user);
				session.set("ktdn", true);
				String uri = session.get("security-uri");
				if (uri != null) {
					return "redirect:" + uri;
				} else {
					return "redirect:/home/index";
				}
			}
		} catch (Exception e) {
			session.set("ktdn", false);
			model.addAttribute("message", "Sai tài khoản hoặc mật khẩu!");
		}
		return "account/login";
	}

	@GetMapping("/account/signup")
	public String signup() {
		return "account/signup";
	}

	@PostMapping("/account/signup")
	public String signup(Model model, @RequestParam("username") String username, @RequestParam("email") String email,
			@RequestParam("password") String password, @RequestParam("fullname") String fullname) {
		boolean kt = true;
		for (Account acc : dao.findAll()) {
			if (acc.getUsername().equalsIgnoreCase(username)) {
				kt = false;
				break;
			}
		}
		if (kt) {
			Account newAcc = new Account(username, password, fullname, email, "", false, true, null);
			dao.save(newAcc);
			model.addAttribute("message", "Đăng ký Thành công!");
		} else {
			model.addAttribute("message", "Username đã tồn tại!");
		}
		return "account/login";
	}

	@RequestMapping("/account/logout")
	public String logout(Model model) {
		session.set("user", null);
		session.set("ktdn", false);
		return "redirect:/home/index";
	}

	@RequestMapping("/account/profile")
	public String viewProfile(Model model) {
		if (session.get("user") == null) {
			model.addAttribute("message", "Vui lòng đăng nhập!");
			return "account/login";
		} else {
			return "account/profile";
		}

	}

	@RequestMapping("/account/profile-update")
	public String updateProfile(Model model, @RequestParam("newpw") String newpass,
			@RequestParam("newfullname") String newfullname, @RequestParam("newemail") String newemail) {
		try {
			Account newacc = session.get("user");
			newacc.setPassword(newpass);
			newacc.setFullname(newfullname);
			newacc.setEmail(newemail);
			dao.save(newacc);
			model.addAttribute("message", "Cập nhật thành công!");
			return "redirect:/account/profile";
		} catch (Exception e) {
			model.addAttribute("message", "Vui lòng đăng nhập!");
			return "account/login";
		}

		
	}
}
