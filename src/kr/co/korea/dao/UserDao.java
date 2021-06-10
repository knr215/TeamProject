package kr.co.korea.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.UserBean;



@Repository
public class UserDao {
	
	@Autowired
	private SqlSessionTemplate sqltemp;
	
	public void addUserInfo(UserBean userBean) {
		sqltemp.insert("user.addUserInfo", userBean);
	}
	
	public UserBean getUserInfo(int midx){
		return sqltemp.selectOne("user.getUserInfo",midx);
	}
	
	
	public UserBean getLoginUserInfo(UserBean userBean) {
		return sqltemp.selectOne("user.getLoginInfo", userBean);
	}
	
	//정보수정
	public void modifyUserInfo(UserBean userBean) {
		sqltemp.update("user.modifyUserInfo", userBean);
	}
	//회원탈퇴
		public void memberDelete(UserBean userBean) {
			sqltemp.update("user.memberDelete", userBean);
		}
	//중복아이디 체크
	public String checkUserIdExist(String mID) {
		return sqltemp.selectOne("user.checkUserIdExist",mID);
	}
	//아이디찾기
	public List<UserBean> find_id(UserBean userBean) {
		return sqltemp.selectList("user.find_id", userBean);
	}
	//비밀번호찾기
	public UserBean find_pwinfo(UserBean userBean) {
		return sqltemp.selectOne("user.find_pw", userBean);
	}
	//임시 비밀번호로 변경
	public void find_pw_update(UserBean userBean) {
		sqltemp.update("user.find_pw_update", userBean);
	}
	public UserBean tempid(String mid) {
		return sqltemp.selectOne("user.tempid",mid);
	}

}
