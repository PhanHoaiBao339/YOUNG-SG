package com.poly.dto;

import java.io.Serializable;
import java.util.HashMap;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CartDto implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String userId;
	private double tongtien = 0;
	private int tongsl = 0;
	private String dienthoai;
	private String diachi;
	private HashMap<String, CartDetailDto> detail = new HashMap<>();
}
