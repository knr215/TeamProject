package kr.co.korea.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.korea.beans.UserBean;
import kr.co.korea.beans.WishBean;
import kr.co.korea.service.WishService;

@RestController
@RequestMapping("/wishlist")
public class WishRestController {
	
	@Autowired
	WishService wishService;
	
	@Resource(name= "loginUserBean")
	@Lazy
	private UserBean loginUserBean;

	
	@PostMapping("/wish/{w_mIDx}/{w_pID}/{wAmount}")
	public Map<String, Object> wish(@PathVariable int w_pID,@PathVariable int w_mIDx, @PathVariable int wAmount){
		Map<String, Object> map = new HashMap<String, Object>();
		
	try {
		WishBean wishBean = new WishBean();
		wishBean.setW_mIDx(w_mIDx);
		wishBean.setW_pID(w_pID);
		wishBean.setwAmount(wAmount);
		
		int check= wishService.wishcheck(wishBean);
		
		if(check ==0) {
			wishService.wishadd(wishBean);
			map.put("result", "insertsuccess");
			
		}else if(check == 1) {
			
			map.put("result", "updatesuccess");
		
		}
			
	}
	 catch (Exception e) {
		e.printStackTrace();
		map.put("result", "fail");
	 		
		}
		return map;
	}
	@PostMapping("/wishlist/{midx}")//로드 됬을 시 list를 불러냄.
	public List<WishBean> wishlist (@PathVariable int midx, Model model) {
		List<WishBean> wishlist = wishService.wishgetinfo(midx);
		
		return wishlist;
		
	}
	@PostMapping("/wishchange/{wID}/{w_mIDx}/{wAmount}")//cart�뿉�꽌 �닔�웾 蹂��솕�뻽�쓣�떆.
	public Map<String, Object> amountchange(@PathVariable int wID, 
											@PathVariable int w_mIDx,
											@PathVariable int wAmount) {
		Map<String, Object> map = new HashMap<String, Object>();

		try {
			WishBean wishBean = new WishBean();
			wishBean.setwID(wID);
			wishBean.setW_mIDx(w_mIDx);
			wishBean.setwAmount(wAmount);
			
			wishService.wishamountchange(wishBean);
			
			map.put("result", "change");


		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			map.put("result", "fail");
		}

		return map;
	}
	
	@PostMapping("/widelete/{wID}")//굳이 hashmap으로 해야할까? 
	public Map<String, Object> widelete(@PathVariable int wID) {
		Map<String, Object> map = new HashMap<String, Object>();
	
		wishService.wishdelete(wID);
		
		
		map.put("result", "delete");
		
		return map;
	}
	
}
