package kr.co.korea.service;

import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import kr.co.korea.beans.UserBean;
import kr.co.korea.dao.UserDao;

@Service
public class UserService {

	@Autowired UserDao userDao;
	@Autowired private JavaMailSenderImpl mailSender;	//이메일인증
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Autowired
	private SqlSessionTemplate sqltemp;
	
	
	public void addUserInfo(UserBean userBean) {
		userDao.addUserInfo(userBean);
	}
	
	public void getUserInfo(UserBean userBean){
		UserBean serviceBean = userDao.getUserInfo(loginUserBean.getMidx());
		userBean.setMname(serviceBean.getMname());
		userBean.setMid(serviceBean.getMid());
		userBean.setMpw(serviceBean.getMpw()); //추가
		userBean.setMemail(serviceBean.getMemail());
		userBean.setMaddress(serviceBean.getMaddress());
		userBean.setMaddress2(serviceBean.getMaddress2());
		userBean.setMbirth(serviceBean.getMbirth());
		userBean.setMphone(serviceBean.getMphone());
		userBean.setMpost(serviceBean.getMpost());
		
	}
	
	public UserBean idxgetUserIno(int midx){
		return userDao.getUserInfo(midx);
	}//주문에서 쓰일 유저 정보
	
	
	public void getLoginUserInfo(UserBean userBean) {
		UserBean serviceBean=userDao.getLoginUserInfo(userBean); //
		if(serviceBean != null) {
			loginUserBean.setMidx(serviceBean.getMidx());
			loginUserBean.setMid(serviceBean.getMid());
			loginUserBean.setMname(serviceBean.getMname());
			loginUserBean.setMamount(serviceBean.getMamount());
			loginUserBean.setUserLogin(true);
			loginUserBean.setMlevel(serviceBean.getMlevel());
			loginUserBean.setMdrop(serviceBean.getMdrop());
		}
	}
	//정보수정
		public void modifyUserInfo(UserBean userBean) {
			userDao.modifyUserInfo(userBean);
		}
		
	//회원탈퇴
		public void memberDelete(UserBean userBean) {
			userDao.memberDelete(userBean);
		}
	//비밀번호정보
		public void getPwInfo(UserBean userBean){
			UserBean serviceBean = userDao.getUserInfo(loginUserBean.getMidx());
			userBean.setMpw(serviceBean.getMpw());
			
		}
	//아이디찾기
		public List<UserBean> find_id(UserBean userBean){
			return userDao.find_id(userBean);
			
		}
	//비밀번호찾기에 필요한 정보
			public void find_pwinfo(UserBean userBean){
				UserBean serviceBean = userDao.find_pwinfo(userBean);
				if(serviceBean != null) {
				userBean.setMname(serviceBean.getMname());
				userBean.setMid(serviceBean.getMid());
				userBean.setMidx(serviceBean.getMidx()); //추가
				userBean.setMemail(serviceBean.getMemail());
				userBean.setMpw(serviceBean.getMpw());
				}
			}
	//임시 비밀번호로 변경
			public void find_pw_update(UserBean userBean) {
				userDao.find_pw_update(userBean);
			}
		
	//이메일 인증
		// 이메일 난수 만드는 메서드
		private String init() {
			Random ran = new Random();
			StringBuffer sb = new StringBuffer();
			int num = 0;

			do {
				num = ran.nextInt(75) + 48;
				if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
					sb.append((char) num);
				} else {
					continue;
				}

			} while (sb.length() < size);
			if (lowerCheck) {
				return sb.toString().toLowerCase();
			}
			return sb.toString();
		}
		
		// 난수를 이용한 키 생성
		private boolean lowerCheck;
		private int size;

		public String getKey(boolean lowerCheck, int size) {
			this.lowerCheck = lowerCheck;
			this.size = size;
			return init();
		}
		
		// 회원가입 발송 이메일(인증키 발송)
		public String mailSendWithUserKey(UserBean userBean) {
			
			String key = getKey(false, 6);
			userBean.setMpw3(key);
			
			// 메일 제목, 내용
			String subject = "[SSA DA GU]";
			String content = "인증번호: "+key;
			
			// 보내는 사람
			String from = "ssadagu.web@gmail.com";
			
			// 받는 사람
			String to = userBean.getMemail();
			
			try {
				// 메일 내용 넣을 객체와, 이를 도와주는 Helper 객체 생성
				MimeMessage mail = mailSender.createMimeMessage();
				MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");

				// 메일 내용을 채워줌
				mailHelper.setFrom(from);	// 보내는 사람 셋팅
				mailHelper.setTo(to);		// 받는 사람 셋팅
				mailHelper.setSubject(subject);	// 제목 셋팅
				mailHelper.setText(content);	// 내용 셋팅

				// 메일 전송
				mailSender.send(mail);
				
			} catch(Exception e) {
				e.printStackTrace();
			}

			
			return key;	
		}
		
		public UserBean tempid(String mid) {
			return userDao.tempid(mid);
		}
		
		//중복아이디 체크
		public String checkUserIdExist(String mID) {
			return sqltemp.selectOne("user.checkUserIdExist",mID);
		}
}
