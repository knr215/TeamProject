package kr.co.korea.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.ReplyBean;

@Repository
public class ReplyDao {

	@Autowired
	private SqlSessionTemplate sqltemp;
	
	public void replywrite(ReplyBean replybean) {
		sqltemp.insert("reply.replywrite",replybean);
	}
	
	public List<ReplyBean> replylist(int re_rid){
		return sqltemp.selectList("reply.replylist",re_rid);
	}
	
	public void replyupdate(ReplyBean replybean) {
		sqltemp.update("reply.replyupdate",replybean);
	}
	
	public void replydelete(int re_ID) {
		sqltemp.delete("reply.replydelete",re_ID);
	}
	
}
