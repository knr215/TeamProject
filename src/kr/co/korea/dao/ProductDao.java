package kr.co.korea.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.ProductBean;

@Repository
public class ProductDao {
	
	
	@Autowired
	private SqlSessionTemplate sqltemp;
	
	public int insertproduct(ProductBean productbean) {
		sqltemp.insert("product.productinsert",productbean);
		return productbean.getpID();
	}
	
	public List<ProductBean> getproductInfolist(ProductBean productbean) {
		return sqltemp.selectList("product.getproductInfolist",productbean);
	}
	
	public ProductBean getproductInfo (int pID) {
		return sqltemp.selectOne("product.getproductInfo",pID);
	}
	
	public void productupdate(ProductBean productbean) {
		sqltemp.update("product.productupdate",productbean);
	}
	
	public void productdelete(int pID) {
		sqltemp.delete("product.productdelete",pID);
	}
	
	public int productcount(ProductBean productbean) {
		return sqltemp.selectOne("product.productcount",productbean);
	}
	
	public void producthitadd(int pID) {
		sqltemp.update("product.producthitadd",pID);
	}
	public List<ProductBean> productbestlist() {
	      return sqltemp.selectList("product.getBestproductlist");
	   }
}
