package com.poly.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.dao.AccountDAO;
import com.poly.dao.OrderDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.dao.ProductDAO;
import com.poly.dto.CartDetailDto;
import com.poly.dto.CartDto;
import com.poly.entity.Account;
import com.poly.entity.Color;
import com.poly.entity.Order;
import com.poly.entity.OrderDetail;
import com.poly.entity.Product;
import com.poly.entity.Size;

@Service
public class CartService {

	@Autowired
	private OrderDAO odao;

	@Autowired
	private OrderDetailDAO oddao;

	@Autowired
	private ProductDAO prdao;

	@Autowired
	private AccountDAO accdao;

	@Transactional
	public void insertCart(CartDto cart) {
		Order hoadon = mappingDtoToOrderEntity(cart);
		try {
			// insert HoaDon
			Order hdReturn = odao.saveAndFlush(hoadon);
			List<OrderDetail> listHDCT = mappingDtoToOrderDetailEntity(cart.getDetail(), hdReturn);

			// insert HDCT
			listHDCT.forEach(hdct -> {
				oddao.saveAndFlush(hdct);

				// update SL cua SP sau khi insert HDCT
				Product sp = prdao.getById(hdct.getOderproduct().getId());
				int newQuantity = sp.getQuantity() - hdct.getQuantity();
				sp.setQuantity(newQuantity);
				prdao.saveAndFlush(sp);
			});
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public CartDto updateCart(CartDto cart,String key, String masp, int soLuong, boolean isUpdate, String size, String color) {
		Product product = prdao.getById(masp);

		HashMap<String, CartDetailDto> cartDetail = cart.getDetail();
		if (cartDetail.containsKey(key)) {
			if (soLuong < 1) {
				cartDetail.remove(key);
			} else {
				if (isUpdate) {
					cartDetail.get(key).setQuantityOder(soLuong);
				} else {
					if (cartDetail.get(key).getSize().equals(size) && cartDetail.get(key).getColor().equals(color)) {
						int slCu = cartDetail.get(key).getQuantityOder();
						cartDetail.get(key).setQuantityOder(slCu + soLuong);
					} else {
						addToCart(masp, product, size, color, soLuong, cartDetail);
					}
				}
			}

		} else {
			addToCart(masp, product, size, color, soLuong, cartDetail);
		}

		cart.setTongsl(this.getTongSL(cart));
		cart.setTongtien(this.getTongTien(cart));

		return cart;
	}

	private void addToCart(String masp, Product product, String size, String color, int soLuong,
			HashMap<String, CartDetailDto> cartDetail) {
		CartDetailDto cartDetailDto = new CartDetailDto();
		cartDetailDto.setName(product.getName());
		cartDetailDto.setPrice(product.getPrice());
		cartDetailDto.setId(product.getId());
		cartDetailDto.setSize(size);
		cartDetailDto.setColor(color);
		String image = "";
		for (Color c : product.getColors()) {
			if (c.getName().equals(color)) {
				image = c.getImage().getName();
				break;
			}
		}
		cartDetailDto.setImage(image);
		cartDetailDto.setQuantityOder(soLuong);
		cartDetail.put(masp + (cartDetail.size() + 1), cartDetailDto);

	}

	public double getTongTien(CartDto cart) {
		HashMap<String, CartDetailDto> cartDetail = cart.getDetail();
		Double tongTien = 0D;
		for (CartDetailDto cartDetailDto : cartDetail.values()) {
			Product product = prdao.getById(cartDetailDto.getId());
			tongTien += product.getPrice() * cartDetailDto.getQuantityOder();
		}
		return tongTien;
	}

	public int getTongSL(CartDto cart) {
		HashMap<String, CartDetailDto> cartDetail = cart.getDetail();
		int tongSL = 0;
		for (CartDetailDto productDto : cartDetail.values()) {
			tongSL += productDto.getQuantityOder();
		}
		return tongSL;
	}

	private Order mappingDtoToOrderEntity(CartDto cartDto) {
		Order hoadon = new Order();
		hoadon.setAddress(cartDto.getDiachi());
		hoadon.setPhone(cartDto.getDienthoai());
		hoadon.setTotalmoney(cartDto.getTongtien());
		Optional<Account> user = accdao.findById(cartDto.getUserId());
		hoadon.setAccount(user.get());
		return hoadon;
	}

	private List<OrderDetail> mappingDtoToOrderDetailEntity(HashMap<String, CartDetailDto> details, Order hoadon) {
		List<OrderDetail> result = new ArrayList<>();
		details.forEach((key, hdct) -> {
			OrderDetail hoadonchitiet = new OrderDetail();
			Product sanpham = prdao.getById(hdct.getId());

			hoadonchitiet.setOderproduct(sanpham);
			hoadonchitiet.setPrice(hdct.getPrice());
			hoadonchitiet.setQuantity(hdct.getQuantityOder());
			hoadonchitiet.setOrder(hoadon);
			for (Color c : sanpham.getColors()) {
				if (c.getName().equals(hdct.getColor())) {
					hoadonchitiet.setColor(c);
				}
			}
			for (Size s : sanpham.getSizes()) {
				if (s.getName().equals(hdct.getSize())) {
					hoadonchitiet.setSize(s);
				}
			}
			result.add(hoadonchitiet);
		});
		return result;
	}
}
