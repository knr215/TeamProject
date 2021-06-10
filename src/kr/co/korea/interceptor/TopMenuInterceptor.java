package kr.co.korea.interceptor;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.korea.beans.SubmenuBean;
import kr.co.korea.beans.UserBean;
import kr.co.korea.service.MenuService;

public class TopMenuInterceptor implements HandlerInterceptor {

	@Autowired
	private MenuService menuserivce;
	
	
		@Resource(name="loginUserBean")
		@Lazy
		private UserBean loginUserBean;
		
		
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			// TODO Auto-generated method stub
			
			List<SubmenuBean> topmenulist = menuserivce.getTopmenu();
			List<SubmenuBean> submenulist = menuserivce.getSubmenu();
			
			request.setAttribute("topmenulist", topmenulist);
			request.setAttribute("submenulist", submenulist);
			request.setAttribute("loginUserBean", loginUserBean);
			
			return HandlerInterceptor.super.preHandle(request, response, handler);
		}
	
}
