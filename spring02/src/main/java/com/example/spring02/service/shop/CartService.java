package com.example.spring02.service.shop;

import java.util.List;

import com.example.spring02.model.shop.dto.CartDTO;

public interface CartService {
	List<CartDTO> cartMoney();
	void insert(CartDTO dto);
	List<CartDTO> listCart(String userid);
	void delete(int cart_id);
	void deleteAll(String userid);
	void update(int cart_id);
	int sumMoney(String userid);
	int countCart(String userid, int product_id);
	void updateCart(CartDTO dto);
	void modifyCart(CartDTO dto);
}