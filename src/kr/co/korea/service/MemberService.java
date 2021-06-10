package kr.co.korea.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import kr.co.korea.beans.ReviewBean;
import kr.co.korea.beans.SearchCriteria;
import kr.co.korea.beans.UserBean;
import kr.co.korea.dao.MemberDao;

@Service
public class MemberService {

	@Autowired 
	private MemberDao memberDao;
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	public List<UserBean> memberList(UserBean userbean,SearchCriteria scri) throws Exception{
		userbean.setMem_rowStart(scri.getRowStart());
		userbean.setMem_rowEnd(scri.getRowEnd());
		return memberDao.memberList(userbean);
	}
	
	//관리자회원탈퇴
	public void admindelete(String mid) {
		memberDao.admindelete(mid);
	}
	
	public int membercount(UserBean userbean) {
		return memberDao.membercount(userbean);
	}	
}
