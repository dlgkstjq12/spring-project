package com.example.spring02.model.shop.dao;

import java.util.List;

import com.example.spring02.model.shop.dto.ProductDTO;

public interface ProductDAO {
	List<ProductDTO> listProduct(); //상품 목록
	ProductDTO detailProduct(int product_id); //상품의 상세정보
	void updateProduct(ProductDTO dto); //상품 갱신
	void deleteProduct(int product_id); //상품 삭제
	void insertProduct(ProductDTO dto); //상품 추가
	String fileInfo(int product_id); 	//
}
