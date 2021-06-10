package kr.co.korea.beans;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class UserBean {
	private int midx;
	
	@Size(min=2, max=20)
	@Pattern(regexp = "[가-힣]*")
	private String mname; 
	@Size(min=2, max=10)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String mid;
	@Size(min=2, max=10)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String mpw;
	@Size(min=2, max=10)
	@Pattern(regexp = "[a-zA-Z0-9]*")
	private String mpw2;
	@Pattern(regexp = "[a-zA-Z0-9]*")
	
	private String mpw3;
	public String getMpw3() {
		return mpw3;
	}
	public void setMpw3(String mpw3) {
		this.mpw3 = mpw3;
	}//비밀번호 확인용

	@Email
	private String memail;

	@NotNull
	private String maddress;
	@NotNull
	private String maddress2;

	private String mbirth;//생일	
	private Date mdate;//가입일자
	@NotNull	
	private String mphone;	
	private String mpost;
	private int mlevel;
	private int mamount;
	private boolean userLogin;
	private boolean userIdExist;
	private int mdrop;
	
	private int mem_rowStart;
	private int mem_rowEnd;
	

	public int getMem_rowEnd() {
		return mem_rowEnd;
	}
	public void setMem_rowEnd(int mem_rowEnd) {
		this.mem_rowEnd = mem_rowEnd;
	}
	public int getMdrop() {
		return mdrop;
	}
	public int getMem_rowStart() {
		return mem_rowStart;
	}
	public void setMem_rowStart(int mem_rowStart) {
		this.mem_rowStart = mem_rowStart;
	}
	public void setMdrop(int mdrop) {
		this.mdrop = mdrop;
	}
	public UserBean() {
		this.userLogin=false;
		this.userIdExist=false;
	}
	public String getMaddress2() {
		return maddress2;
	}

	public void setMaddress2(String maddress2) {
		this.maddress2 = maddress2;
	}
	
	public int getMamount() {
		return mamount;
	}

	public void setMamount(int mamount) {
		this.mamount = mamount;
	}

	
	
	
	
	public String getMpw2() {
		return mpw2;
	}

	public void setMpw2(String mpw2) {
		this.mpw2 = mpw2;
	}
	
	
	public int getMlevel() {
		return mlevel;
	}

	public void setMlevel(int mlevel) {
		this.mlevel = mlevel;
	}
	

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getMaddress() {
		return maddress;
	}

	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}

	public String getMbirth() {
		return mbirth;
	}

	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}

	public Date getMdate() {
		return mdate;
	}

	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}

	public String getMphone() {
		return mphone;
	}

	public void setMphone(String mphone) {
		this.mphone = mphone;
	}

	public String getMpost() {
		return mpost;
	}

	public void setMpost(String mpost) {
		this.mpost = mpost;
	}

	public boolean isUserLogin() {
		return userLogin;
	}

	public void setUserLogin(boolean userLogin) {
		this.userLogin = userLogin;
	}

	public boolean isUserIdExist() {
		return userIdExist;
	}

	public void setUserIdExist(boolean userIdExist) {
		this.userIdExist = userIdExist;
	}


	
}
