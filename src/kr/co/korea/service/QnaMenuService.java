package kr.co.korea.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.co.korea.beans.BoardInfoBean;
import kr.co.korea.dao.QnaTopMenuDao;

@Service
public class QnaMenuService {
@Autowired
 private QnaTopMenuDao qnaTopMenuDao;
 
 public List<BoardInfoBean> getQnaTopList(){
	 List<BoardInfoBean> qnaTopList= qnaTopMenuDao.getQnaTopList();
	 return qnaTopList;
 }
}
