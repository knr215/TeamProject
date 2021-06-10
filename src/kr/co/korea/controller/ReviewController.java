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

import kr.co.korea.beans.ReviewBean;
import kr.co.korea.beans.ReviewPageMaker;
import kr.co.korea.beans.SearchCriteria;
import kr.co.korea.beans.UserBean;
import kr.co.korea.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewservice;
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@GetMapping("/reviewlist")
	public String reviewlist(Model model,@ModelAttribute("scri")SearchCriteria scri) {
		int midx = loginUserBean.getMidx();
		
		ReviewBean reviewbean = new ReviewBean();
		reviewbean.setR_mIDx(midx);
		List<ReviewBean> reviewlist = reviewservice.reviewList(reviewbean,scri);
		
		ReviewPageMaker pagemaker = new ReviewPageMaker();
		pagemaker.setCri(scri);
		pagemaker.setReview(reviewbean);
		pagemaker.setTotalCount(reviewservice.reviewcount(reviewbean));
		
		model.addAttribute("reviewlist",reviewlist);
		model.addAttribute("pagemaker",pagemaker);
		model.addAttribute("scri",scri);
		
		return "/review/reviewlist";
	}
	@GetMapping("/allreviewlist")
	public String allreviewlist(Model model,@ModelAttribute("scri")SearchCriteria scri) {
		int midx = loginUserBean.getMidx();
		
		ReviewBean reviewbean = new ReviewBean();
		reviewbean.setR_mIDx(midx);
		List<ReviewBean> allreviewlist = reviewservice.allreviewlist(reviewbean,scri);
		
		ReviewPageMaker pagemaker = new ReviewPageMaker();
		pagemaker.setCri(scri);
		pagemaker.setReview(reviewbean);
		pagemaker.setTotalCount(reviewservice.reviewcount(reviewbean));
		
		model.addAttribute("allreviewlist",allreviewlist);
		model.addAttribute("pagemaker",pagemaker);
		model.addAttribute("scri",scri);
		
		return "/review/allreviewlist";
	}
	
	
	@GetMapping("/reviewwrite")//
	public String reviewwrite(int o_ID,int o_mIDx,int pID,Model model) {
		
		ReviewBean meminfo = reviewservice.reviewmeminfo(o_mIDx);
		
		model.addAttribute("meminfo",meminfo);
		model.addAttribute("o_ID",o_ID);
		model.addAttribute("o_mIDx",o_mIDx);
		model.addAttribute("pID",pID);
		
		return "/review/reviewwrite";
	}
	
	@PostMapping("/reviewriteok")
	public String reviewriteok(ReviewBean reviewbean,
								MultipartHttpServletRequest multirequest,
							   RedirectAttributes rttr) {
		
		reviewservice.reviewinsert(multirequest,reviewbean);
		
		rttr.addAttribute("pID",reviewbean.getR_pID());
		
		return "redirect:/product/productContent";
	}
	
	
	@GetMapping("/reviewmodify")
	public String reivewmodify(int r_ID,int pID,Model model) {
		ReviewBean reviewbean = reviewservice.reviewgetinfo(r_ID);
		
		model.addAttribute("reviewbean",reviewbean);
		model.addAttribute("pID",pID);
		
		return "/review/reviewmodify";
	}
	
	@PostMapping("/reviemodifyok")
	public String reviemodifyok(ReviewBean reviewbean,
								MultipartHttpServletRequest multirequest,
								@RequestParam("r_ID")int r_ID,
								@RequestParam("pID")int pID, 
								RedirectAttributes rttr) {
		
		reviewservice.reviewupdate(multirequest,reviewbean);
		
		
		rttr.addAttribute("pID",pID);
		
		return "redirect:/product/productContent";
	}
	
	@GetMapping("/reviewdelete")
	public String reivewdelete(int r_ID,int pID,Model model) {
		ReviewBean reviewbean = reviewservice.reviewgetinfo(r_ID);
		
		model.addAttribute("reviewbean",reviewbean);
		model.addAttribute("pID",pID);
		
		return "/review/reviewdelete";
	}
	
	@PostMapping("/reviewdeleteok")
	public String reviewdeleteok(@RequestParam("r_ID")int r_ID,
								@RequestParam("pID")int pID, 
								RedirectAttributes rttr) {
		ReviewBean reviewbean = reviewservice.reviewgetinfo(r_ID);
		reviewbean.setR_ID(r_ID);
		reviewbean.setR_mIDx(loginUserBean.getMidx());
		
		reviewservice.reviewdelete(reviewbean);
		rttr.addAttribute("pID",pID);
		return "redirect:/product/productContent";
	}
	@GetMapping("/reviewListMember")
	public String reviewListMember(Model model,@ModelAttribute("scri")SearchCriteria scri) {
		int midx = loginUserBean.getMidx();
		
		ReviewBean reviewbean = new ReviewBean();
		reviewbean.setR_mIDx(midx);
		List<ReviewBean> reviewlist = reviewservice.reviewList(reviewbean,scri);
		
		ReviewPageMaker pagemaker = new ReviewPageMaker();
		pagemaker.setCri(scri);
		pagemaker.setReview(reviewbean);
		pagemaker.setTotalCount(reviewservice.reviewcount(reviewbean));
		
		model.addAttribute("reviewlist",reviewlist);
		model.addAttribute("pagemaker",pagemaker);
		model.addAttribute("scri",scri);
		return "/review/reviewListMember";
	}
}
