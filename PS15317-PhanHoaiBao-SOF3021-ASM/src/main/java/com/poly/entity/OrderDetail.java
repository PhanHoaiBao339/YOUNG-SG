package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Orderdetails")
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetail implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;

	Double price;

	Integer quantity;

	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "Orderid", referencedColumnName = "id")
	@JsonIgnoreProperties(value = { "applications", "hibernateLazyInitializer" })
	Order order;

	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "Productid", referencedColumnName = "id")
	@JsonIgnoreProperties(value = { "applications", "hibernateLazyInitializer" })
	Product oderproduct;

	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "Sizeid", referencedColumnName = "id")
	@JsonIgnoreProperties(value = { "applications", "hibernateLazyInitializer" })
	Size size;

	@ManyToOne(cascade = CascadeType.MERGE)
	@JoinColumn(name = "Colorid", referencedColumnName = "id")
	@JsonIgnoreProperties(value = { "applications", "hibernateLazyInitializer" })
	Color color;

}
