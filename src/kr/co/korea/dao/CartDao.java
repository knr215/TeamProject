package kr.co.korea.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.CartBean;

@Repository
public class CartDao {
	
	@Autowired
	private SqlSessionTemplate sqltemp;
	
	public void cartinsert(CartBean cartbean) {
		sqltemp.insert("cart.cartinsert",cartbean);	
	}
	
	public int cartCheck(CartBean cartbean) {
		return sqltemp.selectOne("cart.cartCheck",cartbean);
	}
	
	public void cartamountadd(CartBean cartbean) {
		sqltemp.update("cart.cartamountadd",cartbean);
	}
	
	public List<CartBean> cartgetinfo(int midx){
		return sqltemp.selectList("cart.cartgetinfo",midx);
	}
	
	public CartBean idxcartgetinfo(int midx){
		return sqltemp.selectOne("cart.idxcartgetinfo",midx);
	}//주문에서 쓰일 bean
	
	
	public void cartamountchange(CartBean cartbean) {
		sqltemp.update("cart.cartamountchange",cartbean);
	}
	
	public void cartdelete(int cID) {
		sqltemp.delete("cart.cartdelete",cID);
	}
	
}
