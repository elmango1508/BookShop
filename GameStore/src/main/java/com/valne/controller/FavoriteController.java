package com.valne.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * FavoriteController 21/07/29
 * @author admin
 * @version 1.0
 */
@Controller
public class FavoriteController {
	@RequestMapping("/favorites")
	public String cart() {
		return "order/wishlist";
	}
}
