package com.example.spring02.service.shop;

import java.util.List;

import com.example.spring02.model.shop.dto.ProductDTO;

public interface ProductService {
	List<ProductDTO> listProduct(); //상품의 리스트
	ProductDTO detailProduct(int product_id); //상품의 상세정보
	String fileInfo(int product_id);  //파일의 정보
	void updateProduct(ProductDTO dto); //상품 정보 갱신
	void deleteProduct(int product_id); //상품 정보 삭제
	void insertProduct(ProductDTO dto); //상품 추가
}
