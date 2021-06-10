package kr.co.korea.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.korea.beans.CartBean;
import kr.co.korea.dao.CartDao;

@Service
public class CartService {

	@Autowired
	private CartDao cartdao;
	
	public void cartinsert(CartBean cartbean) {
		cartdao.cartinsert(cartbean);
	}
	
	public void cartamountadd(CartBean cartbean) {
		cartdao.cartamountadd(cartbean);
	}
	
	public int cartCheck(CartBean cartbean) {
		return cartdao.cartCheck(cartbean);
	}
	public void cartdelete(int cID) {
		cartdao.cartdelete(cID);
	}
	
	public List<CartBean> cartgetinfo(int midx){
		return cartdao.cartgetinfo(midx);
	}
	
	public CartBean idxcartgetinfo(int midx){
		return cartdao.idxcartgetinfo(midx);
	}//주문에서 쓰일 bean
	
	public void cartamountchange(CartBean cartbean) {
		cartdao.cartamountchange(cartbean);
	}
	
	
	
	
}
