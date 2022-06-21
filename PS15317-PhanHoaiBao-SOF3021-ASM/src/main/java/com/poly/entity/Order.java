package com.poly.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@Data
@Entity 
@Table(name = "Orders")
@AllArgsConstructor
@NoArgsConstructor
public class Order  implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Long id;
	
	@ManyToOne
	@JoinColumn(name = "Username")
	Account account;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "Createdate")
	Date createdate = new Date();
	
	String address;
	String phone;
	Double totalmoney;
	
	@JsonIgnore
	@OneToMany(mappedBy = "order")
	List<OrderDetail> orderdetails;
}