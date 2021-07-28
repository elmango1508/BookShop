package com.valne.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.valne.entity.Product;

public interface Product_Dao extends JpaRepository<Product, Integer> {

}
