package kr.co.korea.controller;

import javax.annotation.Resource;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.korea.beans.ProductBean;
import kr.co.korea.beans.UserBean;
import kr.co.korea.service.ProductService;
import kr.co.korea.service.UserService;

@Controller
@RequestMapping("/popup")
public class PopupController {
	@Autowired
	private ProductService productservice;
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	
	@GetMapping("/popup1")
	public String popup1(int pID, Model model) {
		System.out.println(pID);
		ProductBean productbean = productservice.productread(pID);
		
		model.addAttribute("productbean",productbean);
		model.addAttribute("pID",pID);
		return "/popup/popup1";
	}
	
}
