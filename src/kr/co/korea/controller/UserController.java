package kr.co.korea.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.korea.beans.QtableBean;
import kr.co.korea.beans.UserBean;
import kr.co.korea.service.UserService;

@Controller
@RequestMapping("/user")

public class UserController {

	@Autowired
	@Lazy
	private UserService userService;

	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;

	@Autowired
	@Lazy
	private BCryptPasswordEncoder pwdEncoder;

	@GetMapping("/join")
	public String join(@ModelAttribute("joinUserBean") UserBean userBean) {
		return "/user/join";
	}

	@PostMapping("/join_pro")
	public String join_pro(@ModelAttribute("joinUserBean") UserBean userBean, BindingResult result) {
		String pwd = userBean.getMpw();
		String enpwd = pwdEncoder.encode(pwd);

		userBean.setMpw(enpwd);

		userService.addUserInfo(userBean);// DB
		return "/user/join_success";
	}

	@GetMapping("/login")
	public String login(@ModelAttribute("afterUserBean") UserBean userBean,
			@RequestParam(value = "logcheck", defaultValue = "false") boolean logcheck, Model model) {
		model.addAttribute("logcheck", logcheck);
		return "/user/login";
	}

	@GetMapping("/mypage")
	public String mypage(UserBean userBean) {
		return "/user/mypage";
	}

	private static boolean pwdMatch = false;

	@PostMapping("/login_pro")
	public String login_pro(UserBean userBean) {

		userService.getLoginUserInfo(userBean);// service?????? ?????????.

		String id = userBean.getMid();
		UserBean login = userService.tempid(id);

		if (userBean != null) {
			pwdMatch = pwdEncoder.matches(userBean.getMpw(), login.getMpw());
		}
		System.out.println(pwdMatch);
		System.out.println(loginUserBean.isUserLogin());
		if (loginUserBean.isUserLogin() == true && pwdMatch == true) {
			if (loginUserBean.getMdrop() == 0) {
				return "/user/login_fail";
			}
			return "/user/login_success";
		} else {
			return "/user/login_fail";
		}
	}

	// ????????????
	@GetMapping("/modify")
	public String modify(@ModelAttribute("modifyUserBean") UserBean userBean) {
		// db?????? idx??? ???????????? id,name??? ????????????
		userService.getUserInfo(userBean);

		return "/user/modify";
	}

	@PostMapping("/modify_pro")
	public String modify_pro(@ModelAttribute("modifyUserBean") UserBean userBean, BindingResult result) {
		userBean.setMidx(loginUserBean.getMidx());
		userService.getPwInfo(userBean);
		if (result.hasErrors()) {
			List<ObjectError> list = result.getAllErrors();
			for (ObjectError e : list) {
				System.out.println(e.getDefaultMessage());
				System.out.println("--");
			}
			return "/user/modify_fail";
		}

		// (update DB)
		userService.modifyUserInfo(userBean);
		return "/user/modify_success";
	}

	@GetMapping("/logout")
	public String logout() {
		loginUserBean.setUserLogin(false);
		return "/user/logout"; // ???????????? ??????
	}

	// ????????? ??????
	@GetMapping("/find_id")
	public String find_id(@ModelAttribute("findidUserBean") UserBean userBean) {
		return "/user/find_id";
	}

	private static String key;

	@PostMapping("/find_id_pro")
	public String find_id_pro(@ModelAttribute("findidUserBean") UserBean userBean, Model model) {
		List<UserBean> list = userService.find_id(userBean);
		model.addAttribute("list", list);
		System.out.println(userBean.getMpw2());
		System.out.println(key);
		if (!userBean.getMpw2().equals(key)) {
			return "/user/find_id_fail";
		}

		return "/user/find_id_success";
	}

	// ?????????????????????
	@PostMapping("/mailSend")
	@ResponseBody
	public boolean mailSend(UserBean userBean, Model model) {
		List<UserBean> list = userService.find_id(userBean);
		model.addAttribute("list", list);
		if (list.size() == 0) {

			return false;
		} else {
			key = userService.mailSendWithUserKey(userBean);
			System.out.println("???????????? : " + key);
		}
		return true;
	}

	// ???????????? ??????
	@GetMapping("/find_pw")
	public String find_pw(@ModelAttribute("findidUserBean") UserBean userBean) {
		return "/user/find_pw";
	}

	@PostMapping("/find_pw_pro")
	public String find_pw_pro(@ModelAttribute("findidUserBean") UserBean userBean, Model model) {
		userService.find_pwinfo(userBean);
		if (userBean.getMpw() == null) {
			return "/user/find_pw_fail";
		} else {
			key = userService.mailSendWithUserKey(userBean);
			String newpw = pwdEncoder.encode(key);
			userBean.setMpw(newpw);
			userService.find_pw_update(userBean);
			System.out.println("?????????????????? : " + key);
		}
		return "/user/find_pw_success";
	}

	// ???????????? ??????
	@GetMapping("/pwupdate")
	public String pwupdate(@ModelAttribute("pwupdateUserBean") UserBean userBean) {

		return "/user/pwupdate";
	}

	@PostMapping("/pwupdate_ok")
	public String pwupdate_ok(@ModelAttribute("pwupdateUserBean") UserBean userBean) {
		String inputpw = userBean.getMpw(); // ?????? ????????????
		String inputpw2 = userBean.getMpw2(); // ??? ????????????
		String inputpw3 = userBean.getMpw3(); // ??? ???????????? ??????

//			System.out.println("????????? ?????? ???????????? : "+inputpw);
//			System.out.println("????????? ??? ???????????? : "+inputpw2);
		userService.getUserInfo(userBean);
		userBean.setMidx(loginUserBean.getMidx());
		System.out.println(userBean.getMidx());
		String loginpw = userBean.getMpw(); // ????????????????????? ????????????
//			System.out.println("????????????????????? ???????????? : "+loginpw);

		pwdMatch = pwdEncoder.matches(inputpw, loginpw);

		if (!(inputpw3.equals(inputpw2))) {
			System.out.println("???????????? ??????");
			return "/user/pwupdate_fail";
		}
		if (!(pwdMatch == true)) {
			System.out.println("??????????????????");
			return "/user/pwupdate_fail";
		}
		userBean.setMpw(pwdEncoder.encode(inputpw2));
		userService.modifyUserInfo(userBean);
		userService.getUserInfo(userBean);

		return "/user/pwupdate_ok";
	}

	// ????????????
	@GetMapping("/memberdelete")
	public String memberdelete(@ModelAttribute("deleteUserBean") UserBean userBean) {
		return "/user/memberdelete";
	}

	@PostMapping("/memberdelete_ok")
	public String memberdelete_ok(UserBean userBean) {
		String inputpw = userBean.getMpw();
		userService.getUserInfo(userBean);
		userBean.setMidx(loginUserBean.getMidx());
		String loginpw = userBean.getMpw();

		pwdMatch = pwdEncoder.matches(inputpw, loginpw);

		if (!(pwdMatch == true)) {
			return "/user/memberdelete_fail";
		} else {

			userService.memberDelete(userBean);
			loginUserBean.setUserLogin(false);
		}

		return "/user/memberdelete_ok";
	}

	@GetMapping("/not_login")
	public String notlogin() {
		return "/user/not_login";
	}

	@GetMapping("/notadmin")
	public String notadmin() {
		return "/user/notadmin";
	}

}
