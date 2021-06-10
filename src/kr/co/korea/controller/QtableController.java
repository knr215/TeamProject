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

import kr.co.korea.beans.QtableBean;
import kr.co.korea.beans.UserBean;
import kr.co.korea.service.QtableService;

@Controller
@RequestMapping("/qtable")
public class QtableController {
	
	@Autowired
	@Lazy
	private QtableService qtableService;
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Resource(name="qtabBean")
	@Lazy
	private QtableBean qtabBean;
	
	
	@GetMapping("/write")
	public String write(@ModelAttribute("writeQtableBean") QtableBean qtableBean) {
		
		return "/qtable/write";
	}
	@PostMapping("/write_pro")
	public String write_pro(@ModelAttribute("writeQtableBean") QtableBean qtableBean) {
		qtableService.addNoticeInfo(qtableBean);
		return "/qtable/writeok";
	}
	@GetMapping("/notice")
	public String notice(Model model) {
		List<QtableBean> list=qtableService.getNoticeList();
		model.addAttribute("list", list);
		
		return "/qtable/notice";
	}
	@GetMapping("/view")
	public String view(Model model, int q_idx,@RequestParam(value = "q_hit", defaultValue = "1")int q_hit) {
	qtableService.updatehitNotice(q_idx);
	model.addAttribute("q_hit", q_hit);
		QtableBean readQtableBean= qtableService.getNoticeInfo(q_idx);
	model.addAttribute("readQtableBean", readQtableBean)	;
		return "/qtable/view";
	}
	@GetMapping("/edit")
	public String edit(@ModelAttribute("modifyQtableBean")QtableBean qtableBean,int q_idx,Model model) {
		
	QtableBean editQtableBean=qtableService.getEditNoticeInfo(q_idx);
	model.addAttribute("editQtableBean",editQtableBean);
		return "/qtable/edit";
	}
	@PostMapping("/edit_pro")
	public String edit_pro(@ModelAttribute("modifyQtableBean")QtableBean qtableBean) {	
		qtableService.editNoticeInfo(qtableBean);
		
		return "/qtable/editok";
	}
	
	@GetMapping("/delete")
	public String delete(Model model,int q_idx) {
		qtableService.deleteNoticeInfo(q_idx);
		model.addAttribute("q_idx", q_idx);
		return "/qtable/delete";
	}
	
}
