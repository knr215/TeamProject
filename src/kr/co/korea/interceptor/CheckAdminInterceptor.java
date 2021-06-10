package kr.co.korea.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Lazy;
import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.korea.beans.UserBean;

public class CheckAdminInterceptor implements HandlerInterceptor{
		
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
				throws Exception {
			// TODO Auto-generated method stub
			
			if(loginUserBean.getMlevel() == 0) {
				String contextPath=request.getContextPath();
				response.sendRedirect(contextPath+"/user/notadmin");
				
				return false;
			}
			
			
			return true;
			
		}
}
