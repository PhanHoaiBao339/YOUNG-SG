package com.poly.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CartDetailDto implements Serializable {

	private static final long serialVersionUID = 1L;

	private String id;
	private String name;
	private String color;
	private String size;
	private double price;
	private String image;
	private int quantityOder;
}
