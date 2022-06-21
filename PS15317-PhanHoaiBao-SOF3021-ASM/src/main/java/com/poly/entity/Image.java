package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@Table(name = "Image")
@AllArgsConstructor
@NoArgsConstructor
public class Image implements Serializable{
	@Id
	String id;
	String name;
	@OneToMany(mappedBy = "image")
	List<Color> colors;
}
