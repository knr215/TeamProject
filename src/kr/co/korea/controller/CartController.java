package kr.co.korea.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.korea.beans.CartBean;
import kr.co.korea.beans.UserBean;
import kr.co.korea.beans.WishBean;
import kr.co.korea.service.CartService;
import kr.co.korea.service.UserService;
import kr.co.korea.service.WishService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	@Lazy
	private CartService cartservice;
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Autowired
	@Lazy
	private WishService wishService;
	
	
	@Autowired
	@Lazy
	UserService userservice;
	

	@GetMapping("/cart")
	public String cartwrite(CartBean cartBean) {
		return "/cart/cart";
	}
	@PostMapping("/cartwrite")
	public String cartwrite(CartBean cartBean,
		@RequestParam(value="cha[]") List<String> Checklist,
		Model model) {
		
		for(int i=0;i<Checklist.size();i++) {
			System.out.println("위시리스트 : "+Checklist.get(i));
		}
		int wid=0;
		int midx = loginUserBean.getMidx();
		for(String i : Checklist) {
			wid = Integer.parseInt(i);
			WishBean wish = wishService.wishinfobyid(wid);
			CartBean cart = new CartBean();
			cart.setC_m_IDx(midx);
			cart.setC_p_ID(wish.getW_pID());
			cart.setcAmount(1);
			cartservice.cartinsert(cart);
			wishService.wishdelete(wid);
		}
		
		return "/cart/cart";
	}
	
	
}

	
	


