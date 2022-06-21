package com.poly.controller;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poly.dto.CartDetailDto;
import com.poly.dto.CartDto;
import com.poly.entity.Account;
import com.poly.entity.Product;
import com.poly.service.CartService;
import com.poly.service.MailerService;
import com.poly.service.ParamService;
import com.poly.service.SessionService;
import com.poly.service.impl.ShoppingCartService;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired
	ParamService param;
	@Autowired
	SessionService sessions;
	@Autowired
	HttpServletRequest req;
	@Autowired
	ShoppingCartService cart;
	@Autowired
	HttpSession session;
	@Autowired
	CartService cartService;
	@Autowired
	MailerService mailer;

	@RequestMapping("/view")
	public String viewCart() {
		return "cartshop/shoppingcart";
	}

	@GetMapping("/add/{id}/{isUpdate}")
	public String addToCart(@PathVariable("id") String id, @PathVariable("isUpdate") boolean isUpdate) {
		CartDto cart = (CartDto) session.getAttribute("cart");
//		// update Cart
		String size, color;
		if (param.getString("size", "").equals("")) {
			size = "S (Mặc định)";
		} else {
			size = param.getString("size", "");
		}
		if (param.getString("color", "").equals("")) {
			color = "White";
		} else {
			color = param.getString("color", "");
		}
		session.setAttribute("cart",
				cartService.updateCart(cart, "newsanpham", id, param.getInt("soLuongMua", 0), isUpdate, size, color));
		return "redirect:/home/index";
	}

	@RequestMapping("/update/{id}/{isUpdate}")
	public String updateToCart(@PathVariable("id") String id, @PathVariable("isUpdate") boolean isUpdate,
			@RequestParam("soLuongMua") int soluong) {
		CartDto cart = (CartDto) session.getAttribute("cart");
		HashMap<String, CartDetailDto> cartDetail = cart.getDetail();
		cartDetail.forEach((key, detail) -> {
			if (detail.getId().equals(id)) {
				session.setAttribute("cart",
						cartService.updateCart(cart, key, id, soluong, isUpdate, detail.getSize(), detail.getColor()));
			}
		});
		return "redirect:/cart/view";
	}

	@GetMapping("/remove/{id}")
	public String removeFromCart(@PathVariable String id) {
		CartDto cart = (CartDto) session.getAttribute("cart");
		HashMap<String, CartDetailDto> cartDetail = cart.getDetail();
		List<String> list = new ArrayList<>();
		cartDetail.forEach((key, detail) -> {
			if (detail.getId().equals(id)) {
				list.add(key);
			}
		});
		for (String key : list) {
			cartDetail.remove(key);
		}
		cart.setTongsl(cartService.getTongSL(cart));
		cart.setTongtien(cartService.getTongTien(cart));
		return "redirect:/cart/view";
	}

	@GetMapping("/clear")
	public String clearCart() {
		CartDto cart = (CartDto) session.getAttribute("cart");
		HashMap<String, CartDetailDto> cartDetail = cart.getDetail();
		List<String> list = new ArrayList<>();
		cartDetail.forEach((key, detail) -> {
			list.add(key);
		});
		for (String key : list) {
			cartDetail.remove(key);
		}
		cart.setTongsl(cartService.getTongSL(cart));
		cart.setTongtien(cartService.getTongTien(cart));
		return "redirect:/cart/view";
	}

	@RequestMapping("/checkout")
	public String viewCheckout(Model model) {
		Account user = (Account) session.getAttribute("user");
		if (user != null) {

			return "cartshop/checkout";
		} else {
			model.addAttribute("message", "Vui lòng đăng nhập!");
			return "redirect:/account/login";
		}

	}

	@GetMapping("/paynow")
	public String doGetPayNow(@RequestParam("phone") String phone, @RequestParam("address") String address,
			RedirectAttributes redirectAttributes, HttpSession session) {
		CartDto cart = (CartDto) session.getAttribute("cart");
		if (cart.getTongsl() == 0) {
			redirectAttributes.addFlashAttribute("error", "Giỏ hàng rỗng, vui lòng mua hàng");
			return "redirect:/cart/view";
		} else {
			Account user = (Account) session.getAttribute("user");
			cart.setUserId(user.getUsername());
			cart.setDiachi(address);
			cart.setDienthoai(phone);
			cartService.insertCart(cart);
			session.setAttribute("cart", new CartDto());
			Locale localeVN = new Locale("vi", "VN");
			NumberFormat currencyVN = NumberFormat.getInstance(localeVN);
			String TT = currencyVN.format(cart.getTongtien());
			try {
				mailer.send(user.getEmail(), "Đặt Hàng Thành Công", "<b>Chào " + user.getFullname() + ",</b><br>"
						+ " Đơn hàng của bạn đặt thành công." + "<br>" + "Địa chỉ nhận hàng: " + address + "<br>"
						+ "Số điện thoại: " + phone + "<br>" + "Tổng tiền Đơn hàng: " + TT + " VND"
						+ "<%@ taglib uri=\"http://java.sun.com/jsp/jstl/core\" prefix=\"c\"%>\r\n"
						+ "<%@ taglib uri=\"http://java.sun.com/jsp/jstl/fmt\" prefix=\"fmt\"%>"
						+ "<table class=\"table text-center\">\r\n" + "					<thead>\r\n"
						+ "						<tr>\r\n"
						+ "							<th scope=\"col\" class=\"text-start h5\">GIỎ HÀNG CỦA BẠN</th>\r\n"
						+ "							<th scope=\"col\">Kích thước</th>\r\n"
						+ "							<th scope=\"col\">Màu</th>\r\n"
						+ "							<th scope=\"col\">Số lượng</th>\r\n"
						+ "							<th scope=\"col\">Giá</th>\r\n" + "						</tr>\r\n"
						+ "					</thead>\r\n" + "					<tbody>\r\n"
						+ "						<!-- Start item -->\r\n"
						+ "						<c:forEach var=\"item\" items=\"${sessionScope.cart.detail}\"\r\n"
						+ "							varStatus=\"loop\">\r\n"
						+ "							<tr id=\"tr-${item.value.id}\">\r\n"
						+ "								<th scope=\"row\">\r\n"
						+ "									<div class=\"d-flex align-items-center\">\r\n"
						+ "										<div>\r\n"
						+ "											<img src=\"../images/${item.value.image}\"\r\n"
						+ "												class=\"img-fluid rounded-3\" style=\"width: 120px\" />\r\n"
						+ "										</div>\r\n"
						+ "										<div class=\"flex-fill\">\r\n"
						+ "											<div class=\"flex-column ms-4\">\r\n"
						+ "												<p class=\"mb-2\">${item.value.name}</p>\r\n"
						+ "												<p class=\"mb-0\">\r\n"
						+ "													<fmt:formatNumber type=\"number\" value=\"${item.value.price}\" />\r\n"
						+ "													VND\r\n"
						+ "												</p>\r\n"
						+ "											</div>\r\n"
						+ "										</div>\r\n"
						+ "									</div>\r\n" + "								</th>\r\n"
						+ "								<td class=\"align-middle\">\r\n"
						+ "									<p class=\"mb-0\" style=\"font-weight: 500\">${item.value.size}</p>\r\n"
						+ "								</td>\r\n"
						+ "								<td class=\"align-middle\">\r\n"
						+ "									<p class=\"mb-0\" style=\"font-weight: 500\">${item.value.color}</p>\r\n"
						+ "								</td>\r\n"
						+ "								<td class=\"align-middle\">\r\n"
						+ "									<p class=\"mb-0\" style=\"font-weight: 500\">${item.value.quantityOder}</p>\r\n"
						+ "								</td>\r\n"
						+ "								<td class=\"align-middle\" style=\"width: 180px\">\r\n"
						+ "									<p class=\"mb-0\" style=\"font-weight: 500\"\r\n"
						+ "										id=\"totalSP-${cartDetail.value.masp}\">\r\n"
						+ "										<fmt:formatNumber type=\"number\"\r\n"
						+ "											value=\"${item.value.price * item.value.quantityOder}\" />\r\n"
						+ "										VND\r\n"
						+ "									</p>\r\n" + "								</td>\r\n"
						+ "							</tr>\r\n" + "						</c:forEach>\r\n"
						+ "						<!-- End item -->\r\n" + "					</tbody>\r\n"
						+ "				</table>");
			} catch (MessagingException e) {
			}
			return "redirect:/home/index";

		}
	}
}
