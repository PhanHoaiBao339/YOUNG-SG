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

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Size")
@AllArgsConstructor
@NoArgsConstructor
public class Size implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer id;
	String name;
	
	@ManyToOne
	@JoinColumn(name = "Productid")
	Product sizeprod;
	
	@OneToMany(mappedBy = "size")
	List<OrderDetail> orderDetails;

	public Size(String name, Product sizeprod) {
		super();
		this.name = name;
		this.sizeprod = sizeprod;
	}
	
	
}
