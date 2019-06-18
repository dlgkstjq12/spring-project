package com.example.spring02.model.shop.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.spring02.model.shop.dto.ProductDTO;

@Repository
//DAO를 표시하기위해 Repository 어노테이션을 사용한다.
public class ProductDAOImpl implements ProductDAO {

	@Inject
	SqlSession sqlSession; //sqlsession을 사용하게 하기위해 객체에 의존성을 주입한다.
	
	@Override
	public List<ProductDTO> listProduct() {
		return sqlSession.selectList("product.list_product");
		//mapper을 호출하기 위해 namespace는 product, 
	}

	@Override
	public ProductDTO detailProduct(int product_id) {
		return sqlSession.selectOne(
				"product.detail_product", product_id);
	}

	@Override
	public void updateProduct(ProductDTO dto) {
		sqlSession.update("Product.update_product",dto);
	}

	@Override
	public void deleteProduct(int product_id) {
		sqlSession.delete("product.product_delete",product_id);

	}

	@Override
	public void insertProduct(ProductDTO dto) {
		sqlSession.insert("product.insert", dto);
	}

	@Override
	public String fileInfo(int product_id) {
		return sqlSession.selectOne("product.file_info",product_id);
	}

}
