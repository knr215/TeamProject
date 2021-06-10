package kr.co.korea.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.BoardInfoBean;

@Repository
public class QnaTopMenuDao {

	@Autowired
	private SqlSessionTemplate sqltemp;
	
	public List<BoardInfoBean> getQnaTopList(){
		List<BoardInfoBean> qnaTopList=sqltemp.selectList("qantopmenu.getQnaTopList");
		return qnaTopList;
	}
}
