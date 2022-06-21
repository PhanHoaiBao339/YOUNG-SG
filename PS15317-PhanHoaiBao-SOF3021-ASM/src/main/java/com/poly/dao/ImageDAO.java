package com.poly.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.Image;

public interface ImageDAO extends JpaRepository<Image, String>{
	
	
	@Query("SELECT o FROM Image o WHERE o.id LIKE ?1")
	Page<Image> findByKeywords(String keywords, Pageable pageable);
}
