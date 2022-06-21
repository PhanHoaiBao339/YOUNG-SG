package com.poly.utils;

import java.util.HashMap;
import java.util.List;


import com.poly.entity.Product;

public class DataSharing{
	
	public static HashMap<String, Product> product = new HashMap<>();
	public void addList(List<Product> list) {
		for (int i = 0; i < list.size(); i++) {
			product.put(list.get(i).getId(), list.get(i));
		}
	}

}
