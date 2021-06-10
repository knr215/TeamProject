package kr.co.korea.controller;

import java.util.List;

import javax.annotation.Resource;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.korea.beans.ContentBean;
import kr.co.korea.beans.PageBean;

import kr.co.korea.beans.ReviewPageMaker;
import kr.co.korea.beans.SearchCriteria;
import kr.co.korea.beans.UserBean;
import kr.co.korea.service.BoardService;


@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@GetMapping("/main")
	public String main(int board_info_idx, @RequestParam(value = "page", defaultValue = "1") int page,
			 Model model,ContentBean contentBean,@ModelAttribute("scri")SearchCriteria scri,ContentBean selectBoardIdxMax) {
		
		model.addAttribute("board_info_idx", board_info_idx);
		model.addAttribute("page", page);
		model.addAttribute("scri", scri);
		
		//DB�뿉�꽌 寃뚯떆�뙋�쓽�씠由꾩쓣 媛��졇�샂
		String boardInfoName=boardService.getBoardInfoName(board_info_idx);//寃뚯떆�뙋�쓽 紐낆묶�쓣 媛��졇�삤湲� DB
		model.addAttribute("boardInfoName",boardInfoName);
		
		ReviewPageMaker pagemaker = new ReviewPageMaker();
		pagemaker.setCri(scri);
		
		//DB�뿉�꽌 �빐�떦寃뚯떆�뙋�쓽 �궡�슜媛��졇�삤湲�
		List<ContentBean> contentList=boardService.getContentList(board_info_idx, page);
		
		
		model.addAttribute("contentList", contentList);
		
	
		PageBean pageBean=boardService.getContentCnt(board_info_idx, page);
		model.addAttribute("pageBean", pageBean);
		return "board/main";
	}

	@GetMapping("/write")
	public String write(@ModelAttribute("writeContentBean") ContentBean contentBean, int board_info_idx,@RequestParam(value = "page", defaultValue = "1") int page) {
		
		contentBean.setContent_board_idx(board_info_idx);  //寃뚯떆�뙋醫낅쪟�쓽 踰덊샇瑜� �꽭�똿
		boardService.getContentCnt(board_info_idx, page);
		return "board/write";
	}
	
	@PostMapping("/write_pro")
	public String write_pro(@Valid @ModelAttribute("writeContentBean") ContentBean contentBean,@RequestParam(value = "page", defaultValue = "1") int page, BindingResult result, Model model) {
		 model.addAttribute("page",page);
		 if(result.hasErrors()) {
				return "board/write";
			}
			//for(int i=0;i<50;i++) {
				boardService.addContentInfo(contentBean); //DB에 insert됨
			//}
			return "board/write_success";
	}
	
	//�긽�꽭蹂닿린�뿉�꽌�뒗 content_idx, content_board_idx
		
 
	
	
	@GetMapping("/modify")
	public String modify(@ModelAttribute("modifyContentBean") ContentBean contentBean, int board_info_idx, int content_idx, int page, Model model) {
		model.addAttribute("board_info_idx", board_info_idx);
		model.addAttribute("content_idx", content_idx);
		model.addAttribute("page", page);
		
		ContentBean tempContentBean=boardService.getContentInfo(content_idx);
		contentBean.setContent_bno(tempContentBean.getContent_bno());
		contentBean.setContent_write_name(tempContentBean.getContent_write_name()); //�옉�꽦�옄(異쒕젰)
		contentBean.setContent_date(tempContentBean.getContent_date()); //�궇吏�(異쒕젰)
		contentBean.setContent_subject(tempContentBean.getContent_subject()); //湲��젣紐�(異쒕젰)
		contentBean.setContent_text(tempContentBean.getContent_text());//湲��궡�슜(異쒕젰)
		contentBean.setContent_file(tempContentBean.getContent_file());//泥⑤��뙆�씪(異쒕젰)
		contentBean.setContent_writer_idx(tempContentBean.getContent_writer_idx()); //�옉�꽦�옄�씤�뜳�꽌
		contentBean.setContent_board_idx(board_info_idx); //寃뚯떆�뙋�씤�뜳�꽌
		return "/board/modify";
	}
	

	@PostMapping("/modify_pro")
	public String modify_pro(@ModelAttribute("modifyContentBean") ContentBean contentBean, int page,Model model) {
		model.addAttribute("page", page);
		
		boardService.modifyContentInfo(contentBean); //DB(update)
		System.out.println("수정성공");
		return "/board/modify_success";
		}
	
	@GetMapping("/read")
	public String read(int content_idx, int page, Model model, int board_info_idx) {
	    boardService.updatereply(content_idx);
	    
		ContentBean readContentBean=boardService.getContentInfo(content_idx);
	    model.addAttribute("readContentBean", readContentBean);
   model.addAttribute("board_info_idx", board_info_idx);
	    model.addAttribute("content_idx", content_idx);
	    model.addAttribute("loginUserBean", loginUserBean);  //濡쒓렇�씤�븳 UserBean(session�쁺�뿭議댁옱�븯�뒗)
	    model.addAttribute("page", page);
		return "board/read";
	
	
	}
	
	
	
	@GetMapping("/reply")
	public String reply(@ModelAttribute("replyContentBean")ContentBean contentBean, int board_info_idx, int content_idx, int page, Model model) {
		model.addAttribute("board_info_idx", board_info_idx);
		model.addAttribute("content_idx", content_idx);
		model.addAttribute("page", page);			
		ContentBean tempContentBean=boardService.getContentInfo(content_idx);
		contentBean.setContent_bno(tempContentBean.getContent_bno());
		contentBean.setContent_hit(tempContentBean.getContent_hit());
		contentBean.setContent_level(tempContentBean.getContent_level());		
		contentBean.setContent_step(tempContentBean.getContent_step());
		contentBean.setContent_write_name(tempContentBean.getContent_write_name()); //
		contentBean.setContent_date(tempContentBean.getContent_date()); //
		contentBean.setContent_subject(tempContentBean.getContent_subject()); //
		contentBean.setContent_text(tempContentBean.getContent_text());//
		contentBean.setContent_writer_idx(tempContentBean.getContent_writer_idx()); //
		contentBean.setContent_board_idx(board_info_idx); //
		if(contentBean.getContent_idx() > 0)
			//답글 작성일 경우
			{	
				//답글의 답글
				if(contentBean.getContent_step() != 0)
				{
					//기존 글들 순서값 1 증가
					boardService.qna_reply_up(contentBean);
					//본인의 값을 부모글순서 + 1 로 설정 
					contentBean.setContent_step(contentBean.getContent_step()+1);
					//부모글의 답글이기 때문에 층수 + 1
					contentBean.setContent_level(contentBean.getContent_level()+1);
					System.out.println("답글의 답글" + contentBean.toString());					
				}
				//원글의 답글
				if(contentBean.getContent_level() == 0)
				{
					//현재 작성된 마지막 글의 순서값을 가져온다.
					//ContentBean selectBoardIdxMax = boardService.selectBoardIdxMax(content_idx);
					//새로 작성되는 글의 순서값을 마지막글의 순서값에 + 1 값으로 설정
					//contentBean.setContent_step(selectBoardIdxMax.getContent_step()+1);
					//원글의 답글이기 때문에 층수 1로 설정
					contentBean.setContent_level(1);
					System.out.println("원글의 답글" + contentBean.toString());
		
				}
		
			}	
		
		return "/board/reply";		
	}
	
	@PostMapping("/reply_pro")
	public String reply_pro(@ModelAttribute("replyContentBean") ContentBean contentBean,int board_info_idx, int content_idx, int page, Model model, ContentBean selectBoardIdxMax) {
		model.addAttribute("board_info_idx", board_info_idx);
		model.addAttribute("content_idx", content_idx);
		model.addAttribute("page", page);
		if(contentBean.getContent_idx() > 0)
			//답글 작성일 경우
			{	
				//답글의 답글
				if(contentBean.getContent_step() != 0)
				{
					//기존 글들 순서값 1 증가
					boardService.qna_reply_up(contentBean);
					//본인의 값을 부모글순서 + 1 로 설정 
					contentBean.setContent_step(contentBean.getContent_step()+1);
					//부모글의 답글이기 때문에 층수 + 1
					contentBean.setContent_level(contentBean.getContent_level()+1);
					System.out.println("답글의 답글" + contentBean.toString());					
				}
				//원글의 답글
				if(contentBean.getContent_level() == 0)
				{
					//현재 작성된 마지막 글의 순서값을 가져온다.
					boardService.selectBoardIdxMax();
					
					//새로 작성되는 글의 순서값을 마지막글의 순서값에 + 1 값으로 설정
					contentBean.setContent_step(selectBoardIdxMax.getContent_step()+1);
					//원글의 답글이기 때문에 층수 1로 설정
					contentBean.setContent_level(1);					
					boardService.qna_reply_up(contentBean); //DB(update)
					System.out.println("원글의 답글" + contentBean.toString());
				}
				boardService.insertreply(contentBean); //DB에 insert됨
			}	
		
		return "/board/reply_success";
	}
	
	@GetMapping("/delete")
	public String delete(int board_info_idx, int content_idx, Model model) {
		boardService.deleteContentInfo(content_idx); //DB(delete)
		model.addAttribute("board_info_idx", board_info_idx);
		return "board/delete";
	}		
	
	@GetMapping("/not_writer")
	public String not_writer() {
		return "/board/not_writer";
	}
	@GetMapping("/boardListMember")
	public String boardListMember( @RequestParam(value = "page", defaultValue = "1") int page,
			Model model,ContentBean contentBean,@ModelAttribute("scri")SearchCriteria scri) {
		int midx = loginUserBean.getMidx();
		//model.addAttribute("board_info_idx", board_info_idx);
		contentBean.setContent_writer_idx(midx);
		contentBean.setContent_board_idx(midx);
		List<ContentBean> boardsList=boardService.getBoardsList(midx, page);
			ContentBean readContentBean=boardService.getContentInfo(midx);
			
		    model.addAttribute("readContentBean", readContentBean);
		    model.addAttribute("content_idx", midx);
		    model.addAttribute("content_board_idx", midx);
		model.addAttribute("midx", midx);
		model.addAttribute("page", page);
		model.addAttribute("scri", scri);
		model.addAttribute("loginUserBean", loginUserBean);
		model.addAttribute("boardsList", boardsList);
		
		//DB�뿉�꽌 寃뚯떆�뙋�쓽�씠由꾩쓣 媛��졇�샂
		//String boardInfoName=boardService.getBoardInfoName(board_info_idx);//寃뚯떆�뙋�쓽 紐낆묶�쓣 媛��졇�삤湲� DB
		//model.addAttribute("boardInfoName",boardInfoName);
		
		ReviewPageMaker pagemaker = new ReviewPageMaker();
		pagemaker.setCri(scri);
		
		//DB�뿉�꽌 �빐�떦寃뚯떆�뙋�쓽 �궡�슜媛��졇�삤湲�
		
		

		return "board/boardListMember";
	}
}
