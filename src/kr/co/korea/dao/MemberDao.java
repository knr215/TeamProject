package kr.co.korea.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.ReviewBean;
import kr.co.korea.beans.UserBean;



@Repository
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqltemp;
	
	
	//멤버리스트 조회
	public List<UserBean> memberList(UserBean userbean) throws Exception{
		return sqltemp.selectList("user.selectMemberList", userbean);
	}
	
	//관리자 회원탈퇴
	public void admindelete(String mid) {
		sqltemp.update("user.admindelete", mid);
	}
	public int membercount(UserBean userbean) {
		return sqltemp.selectOne("user.membercount",userbean);
	}
}
