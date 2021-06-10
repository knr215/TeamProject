package kr.co.korea.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.korea.beans.ProductPageMaker;
import kr.co.korea.beans.ProductBean;
import kr.co.korea.beans.ReviewBean;
import kr.co.korea.beans.ReviewPageMaker;
import kr.co.korea.beans.SearchCriteria;
import kr.co.korea.beans.UserBean;
import kr.co.korea.service.ProductService;
import kr.co.korea.service.ReviewService;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductService productService;
	
	@Autowired
	@Lazy
	private ReviewService reviewservice;
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@GetMapping("/productContent")
	public String productContent(int pID,Model model,@ModelAttribute("scri")SearchCriteria scri) {
		
		ProductBean productbean = productService.productread(pID);
		
		ReviewBean reviewbean = new ReviewBean();
		reviewbean.setR_pID(pID);
		List<ReviewBean> reviewlist = reviewservice.reviewList(reviewbean,scri);
		
		ReviewPageMaker pagemaker = new ReviewPageMaker();
		pagemaker.setCri(scri);
		pagemaker.setReview(reviewbean);
		pagemaker.setTotalCount(reviewservice.reviewcount(reviewbean));
		
		model.addAttribute("pID",pID);
		model.addAttribute("reviewlist",reviewlist);
		model.addAttribute("productbean",productbean);
		model.addAttribute("pagemaker",pagemaker);
		model.addAttribute("scri",scri);
		
		return "/product/productContent";
	}
	
	@GetMapping("/productList")
	public String productList(@RequestParam(value="top_idx",required = false ,defaultValue="0")int top_idx,
							  @RequestParam(value="sub_idx",required = false, defaultValue= "0")int sub_idx,
							  @ModelAttribute("scri")SearchCriteria scri,
							  ProductBean productbean,
							  Model model) {
		
		ProductBean best = new ProductBean();
		best.setPro_all(1);
		best.setPro_best(1);
		
		//List<ProductBean> bestlist = productService.getproductInfolist(scri,best);
	    List<ProductBean> bestlist = productService.productbestlist();
	    
		model.addAttribute("bestlist",bestlist);
		
		productbean.setP_sub_idx(sub_idx);
		productbean.setP_top_idx(top_idx);
		
		List<ProductBean> productlist = productService.getproductInfolist(scri,productbean);
		
		model.addAttribute("productlist",productlist);
		
		ProductPageMaker pagemaker = new ProductPageMaker();
		pagemaker.setCri(scri);
		pagemaker.setProduct(productbean);
		pagemaker.setTotalCount(productService.productcount(productbean));
		
		model.addAttribute("scri",scri);
		model.addAttribute("top_idx",top_idx);
		model.addAttribute("pagemaker",pagemaker);
		return "/product/productList";
	}

	@GetMapping("/mainproduct")
	public String mainproduct(@RequestParam(value="top_idx", defaultValue="0")int top_idx,
							  @RequestParam(value="sub_idx", defaultValue= "0")int sub_idx,
							  SearchCriteria scri,
							  ProductBean productbean,
							  Model model) {
		
		productbean.setP_sub_idx(sub_idx);
		productbean.setP_top_idx(top_idx);
		
		List<ProductBean> productlist = productService.getproductInfolist(scri,productbean);
		
		model.addAttribute("productlist",productlist);
		
		return "/product/mainproduct";
	}
	
	@GetMapping("/productInsert")
	public String productInsert(@ModelAttribute("productbean")ProductBean productbean,
								@ModelAttribute("scri")SearchCriteria scri,
								Model model) {
		model.addAttribute("scri",scri);
		return "/product/productInsert";
	}
	
	@PostMapping("/productInsertGo")
	public String productInsertGo(@ModelAttribute("productbean")ProductBean productbean,
									MultipartHttpServletRequest multirequest,
									 RedirectAttributes rttr) {
		
		//for(int i=0;i<50;i++) {
		productService.insertproduct(multirequest,productbean);
		//}
		rttr.addAttribute("pID", productbean.getpID());
		
		return "redirect:/product/productContent";
	}
	
	
	@GetMapping("/productModify")
	public String productModify(int pID,Model model,@ModelAttribute("scri")SearchCriteria scri) {
		
		ProductBean productbean = productService.getproductInfo(pID);
		
		model.addAttribute("pID",pID);
		model.addAttribute("productbean",productbean);
		model.addAttribute("scri",scri);
		return "/product/productModify";
	}
	
	@PostMapping("/productModifyok")
	public String productModifyok(@ModelAttribute("productbean")ProductBean productbean,
								  @RequestParam(value="pID") int pId,
									RedirectAttributes rttr) {
		productbean.setpID(pId);
		productService.productupdate(productbean);
		rttr.addAttribute("pID", productbean.getpID());
		return "redirect:/product/productContent";
	}
	
	@GetMapping("/productDelete")
	public String productDelete(int pID,Model model,@ModelAttribute("scri")SearchCriteria scri) {
		ProductBean productbean = productService.getproductInfo(pID);
		
		model.addAttribute("pID",pID);
		model.addAttribute("productbean",productbean);
		model.addAttribute("scri",scri);
		return "/product/productDelete";
	}
	
	@GetMapping("/productDeleteok")
	public String productDeleteok(@RequestParam(value="pID") int pID) {
		
		productService.productdelete(pID);
		
		return "redirect:/main";
	}
	
}
