package com.valne.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.valne.entity.Order;

public interface Order_Dao extends JpaRepository<Order, Integer> {

}
