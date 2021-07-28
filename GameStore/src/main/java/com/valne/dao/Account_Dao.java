package com.valne.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.valne.entity.Account;

public interface Account_Dao extends JpaRepository<Account,String> {

}
