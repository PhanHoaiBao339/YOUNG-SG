package com.poly.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.poly.dao.ProductDAO;
import com.poly.entity.Product;
import com.poly.utils.DataSharing;

@SessionScope
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
	private static HashMap<String, Product> orders = new HashMap<>();
	@Autowired
	ProductDAO dao;
	private static DataSharing data = new DataSharing();
	
	@Override
	public void addProduct(String id) {
		data.addList(dao.findAll());
		Product prod = orders.get(id);
		if (prod == null) {
			prod = DataSharing.product.get(id);
			prod.setQuantity(1);
			orders.put(id, prod);
		} else {
			prod.setQuantity(prod.getQuantity() + 1);
		}
		
	}

	@Override
	public void removeProduct(String id) {
		orders.remove(id);
	}

	@Override
	public void updateProduct(String id, int qty) {
		Product prod = orders.get(id);
		// Update or remove product
		if (qty > 0) {
			prod.setQuantity(qty);
		} else {
			orders.remove(id);
		}
	}

	@Override
	public void clear() {
		orders.clear();
	}

	@Override
	public Map<String, Product> getProducts() {
		return orders;
	}

	@Override
	public int getCount() {
		return orders.values().stream().mapToInt(item -> item.getQuantity()).sum();
	}

	@Override
	public double getAmount() {
		return orders.values().stream().mapToDouble(item -> item.getPrice() * item.getQuantity()).sum();
	}
}
