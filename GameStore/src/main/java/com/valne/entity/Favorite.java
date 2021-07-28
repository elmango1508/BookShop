package com.valne.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import lombok.Data;

@Data
@Entity
@Table(name ="Favorities",uniqueConstraints = {
		@UniqueConstraint(columnNames = {"Productid","Username"})
})	
public class Favorite implements Serializable {
	@Id
	@GeneratedValue(strategy =GenerationType.IDENTITY)
	private Integer id;
	@ManyToOne @JoinColumn(name = "Productid")
	private Product product;
	@ManyToOne @JoinColumn(name="Username")
	private Account account;
}
