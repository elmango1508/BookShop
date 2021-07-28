package com.valne.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.valne.entity.OrderDetail;

public interface OrderDetail_Dao extends JpaRepository<OrderDetail, Integer> {

}
