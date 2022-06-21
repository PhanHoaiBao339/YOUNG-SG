package com.poly.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.poly.entity.Color;

public interface ColorDAO extends JpaRepository<Color, Integer>{

}
