package com.valne.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * class ProductController 2021/07/29
 * @author admin
 * @version 1.0
 */
@Controller
public class ProductController {
	@RequestMapping("/products/list")
	public String list() {
		return "product/detail";
	}
}
