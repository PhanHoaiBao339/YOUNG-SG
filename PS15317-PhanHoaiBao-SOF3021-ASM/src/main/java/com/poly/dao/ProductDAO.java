package com.poly.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.Product;

public interface ProductDAO extends JpaRepository<Product, String> {

	@Query("SELECT o FROM Product o WHERE o.available=true AND o.id LIKE ?1")
	Page<Product> findByKeywords(String keywords, Pageable pageable);

//	@Query("SELECT o FROM Product o WHERE o.available=?")
//	Page<Product> findAllByAvailable(boolean b, Pageable pageable);

	Page<Product> findAllByAvailableTrue(Pageable pageable);
}
