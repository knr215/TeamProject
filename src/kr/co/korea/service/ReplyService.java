package kr.co.korea.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.korea.beans.ReplyBean;
import kr.co.korea.dao.ReplyDao;

@Service
public class ReplyService {
	
	@Autowired
	private ReplyDao replydao;
	
	public void replywrite(ReplyBean replybean) {
		replydao.replywrite(replybean);;
	}
	
	public List<ReplyBean> replylist(int re_rid){
		return replydao.replylist(re_rid);
	}
	
	public void replyupdate(ReplyBean replybean) {
		replydao.replyupdate(replybean);;
	}
	
	public void replydelete(int re_ID) {
		replydao.replydelete(re_ID);
	}
	
	
}
