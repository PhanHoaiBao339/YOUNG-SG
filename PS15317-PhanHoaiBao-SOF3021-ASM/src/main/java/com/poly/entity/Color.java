package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "Color")
@AllArgsConstructor
@NoArgsConstructor
public class Color implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	String name;
	@ManyToOne
	@JoinColumn(name = "Productid")
	Product colorprod;
	@ManyToOne
	@JoinColumn(name = "Imageid")
	Image image;
	@OneToMany(mappedBy = "color")
	List<OrderDetail> orderDetails;
	
	public Color(String name, Product colorprod) {
		super();
		this.name = name;
		this.colorprod = colorprod;
	}
	
	
}
