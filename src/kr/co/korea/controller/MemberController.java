package kr.co.korea.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.korea.beans.QtableBean;
import kr.co.korea.beans.ReviewPageMaker;
import kr.co.korea.beans.SearchCriteria;
import kr.co.korea.beans.UserBean;
import kr.co.korea.beans.memberPageMaker;
import kr.co.korea.service.MemberService;

@Controller
@RequestMapping("/members")
public class MemberController {

	@Autowired
	@Lazy
	private MemberService memberService;
	
	@GetMapping("member")
	public String member() {
		return "/members/member";
	}
	@GetMapping("memberlist")
	public String memberlist(Model model,@ModelAttribute("scri")SearchCriteria scri) throws Exception {
		
		UserBean userbean = new UserBean();
		List<UserBean> memberlist = memberService.memberList(userbean,scri);
		model.addAttribute("memberlist",memberlist);
		System.out.println(memberlist.size());
		
		memberPageMaker pagemaker = new memberPageMaker();
		pagemaker.setCri(scri);
		pagemaker.setTotalCount(memberService.membercount(userbean));
		
		model.addAttribute("pagemaker",pagemaker);
		model.addAttribute("scri",scri);
		return "/members/memberlist";
	}
	//관리자 회원탈퇴
		@GetMapping("admindelete")
		public String admindelete(HttpServletRequest request, Model model,@ModelAttribute("scri")SearchCriteria scri) throws Exception {
			System.out.println("??");
			UserBean userbean = new UserBean();
			String mid =request.getParameter("mid");
			System.out.println(mid);
			memberService.admindelete(mid);
			model.addAttribute("list", memberService.memberList(userbean,scri));
			return "/members/memberlist";
		}
		
		
}
