package kr.co.korea.interceptor;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.korea.beans.BoardInfoBean;
import kr.co.korea.beans.UserBean;
import kr.co.korea.service.QnaMenuService;

public class QanMenuTopInterceptor implements HandlerInterceptor {

	@Autowired
	private QnaMenuService qnaMenuService;
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	List<BoardInfoBean> qnaTopList=qnaMenuService.getQnaTopList();
	request.setAttribute("qnaTopList", qnaTopList);
	request.setAttribute("loginUserBean", loginUserBean);
		
		return true;
	}
	
	
}
