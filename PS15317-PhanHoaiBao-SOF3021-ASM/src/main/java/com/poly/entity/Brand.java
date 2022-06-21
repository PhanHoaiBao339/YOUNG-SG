package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Brand")
@AllArgsConstructor
@NoArgsConstructor
public class Brand implements Serializable{
	@Id
	String id;
	String name;
	@JsonIgnore
	@OneToMany(mappedBy = "brand")
	List<Product> products;
}
