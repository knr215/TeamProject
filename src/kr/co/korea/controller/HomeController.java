package kr.co.korea.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.co.korea.beans.BoardInfoBean;
import kr.co.korea.beans.ContentBean;
import kr.co.korea.beans.ProductBean;
import kr.co.korea.beans.ProductPageMaker;
import kr.co.korea.beans.SearchCriteria;
import kr.co.korea.service.MainService;
import kr.co.korea.service.ProductService;
import kr.co.korea.service.QnaMenuService;


@Controller
public class HomeController {
	
	@Autowired
	private MainService mainService;
	@Autowired
	public QnaMenuService qnaMenuService;
	@Autowired
	private ProductService productService;
	
	@GetMapping("/")
	public String main(HttpServletRequest request) {
		
	return "redirect:/main";

}
	
	@GetMapping("main")
	public String home(Model model,@ModelAttribute("scri")SearchCriteria scri) {
		
		ProductBean best = new ProductBean();
		best.setPro_all(1);
		best.setPro_best(1);
		
//		List<ProductBean> bestlist = productService.getproductInfolist(scri,best);
		
		 List<ProductBean> bestlist = productService.productbestlist();
		
		model.addAttribute("bestlist",bestlist);//베스트에 들어가는 리스트
		
		ProductBean desc = new ProductBean();
		desc.setPro_all(1);
		
		List<ProductBean> desclist = productService.getproductInfolist(scri,desc);
		
		model.addAttribute("desclist",desclist);//new에 들어가는 리스르
		
		ProductPageMaker pagemaker = new ProductPageMaker();
		pagemaker.setCri(scri);
		pagemaker.setProduct(desc);
		pagemaker.setTotalCount(productService.productcount(desc));
		
		model.addAttribute("scri",scri);
		model.addAttribute("pagemaker",pagemaker);
		
		
		
		ArrayList<List<ContentBean>> list=new ArrayList<List<ContentBean>>();
		for(int i=1;i<=4;i++) {
			List<ContentBean> temp=mainService.getMainList(i);  //1,2,3,4寃뚯떆�뙋
			list.add(temp);
		}
		model.addAttribute("list", list);
		List<BoardInfoBean> board_list=qnaMenuService.getQnaTopList();
		model.addAttribute("board_list", board_list);
		
		return "main";
	}
}
