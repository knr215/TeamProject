package kr.co.korea.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.servlet.HandlerInterceptor;

import kr.co.korea.beans.ContentBean;
import kr.co.korea.beans.UserBean;
import kr.co.korea.service.BoardService;

public class CheckWriterInterceptor implements HandlerInterceptor {

	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Autowired
	private BoardService boardService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
		String str=request.getParameter("content_idx"); //글인덱스만 받아옴
		int content_idx=Integer.valueOf(str);
		ContentBean contentBean=boardService.getContentInfo(content_idx);  //DB에서 상세보기정보 가져오기 
		if(contentBean.getContent_writer_idx()!=loginUserBean.getMidx()) {
			String contextPath=request.getContextPath(); //현재경로 
			response.sendRedirect(contextPath+"/board/not_writer");
			return false;
		}
		return true;
	}

	
	
}
