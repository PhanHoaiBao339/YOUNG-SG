package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Builder.Default;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Products")
@AllArgsConstructor
@NoArgsConstructor
public class Product implements Serializable{
	@Id
	String id;
	String name;
	Double price;
	String info;
	Boolean available;
	Integer quantity;
	@ManyToOne
	@JoinColumn(name = "Categoryid")
	Category category;
	@ManyToOne
	@JoinColumn(name = "Brandid")
	Brand brand;
	@OneToMany(mappedBy = "colorprod",fetch=FetchType.EAGER)
	List<Color> colors;
	@OneToMany(mappedBy = "sizeprod")
	List<Size> sizes;
	@OneToMany(mappedBy = "oderproduct")
	List<OrderDetail> orderDetails;
	
}
