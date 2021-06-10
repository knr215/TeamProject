package kr.co.korea.beans;

import org.springframework.web.multipart.MultipartFile;

public class ReviewBean{
	
	private int r_ID;
	private int r_oID;
	private int r_mIDx;
	private int r_pID;
	private String r_TITLE;
	private String r_CONTENT;
	private MultipartFile upload1;
	private MultipartFile upload2;
	private String r_FILE1;
	private String r_FILE2;
	private String r_DATE;
	private int r_secret;
	
	
	private String r_mname;
	private String r_memail;
	
	private int FileCheck;//파일 체크용
	
	private int re_rowStart;
	private int re_rowEnd;
	
	private String pro_image1;
	private String pro_name;
	private int r_mlevel;
	

	public int getR_mlevel() {
		return r_mlevel;
	}
	public void setR_mlevel(int r_mlevel) {
		this.r_mlevel = r_mlevel;
	}
	public String getPro_image1() {
		return pro_image1;
	}
	public void setPro_image1(String pro_image1) {
		this.pro_image1 = pro_image1;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getRe_rowStart() {
		return re_rowStart;
	}
	public void setRe_rowStart(int re_rowStart) {
		this.re_rowStart = re_rowStart;
	}
	public int getRe_rowEnd() {
		return re_rowEnd;
	}
	public void setRe_rowEnd(int re_rowEnd) {
		this.re_rowEnd = re_rowEnd;
	}
	public MultipartFile getUpload1() {
		return upload1;
	}
	public void setUpload1(MultipartFile upload1) {
		this.upload1 = upload1;
	}
	public MultipartFile getUpload2() {
		return upload2;
	}
	public void setUpload2(MultipartFile upload2) {
		this.upload2 = upload2;
	}
	public int getR_pID() {
		return r_pID;
	}
	public void setR_pID(int r_pID) {
		this.r_pID = r_pID;
	}
	public int getR_secret() {
		return r_secret;
	}
	public void setR_secret(int r_secret) {
		this.r_secret = r_secret;
	}
	public String getR_mname() {
		return r_mname;
	}
	public void setR_mname(String r_mname) {
		this.r_mname = r_mname;
	}
	public String getR_memail() {
		return r_memail;
	}
	public void setR_memail(String r_memail) {
		this.r_memail = r_memail;
	}
	public int getFileCheck() {
		return FileCheck;
	}
	public void setFileCheck(int FileCheck) {
		this.FileCheck = FileCheck;
	}
	public int getR_ID() {
		return r_ID;
	}
	public void setR_ID(int r_ID) {
		this.r_ID = r_ID;
	}
	public int getR_oID() {
		return r_oID;
	}
	public void setR_oID(int r_oID) {
		this.r_oID = r_oID;
	}
	public int getR_mIDx() {
		return r_mIDx;
	}
	public void setR_mIDx(int r_mIDx) {
		this.r_mIDx = r_mIDx;
	}
	public String getR_TITLE() {
		return r_TITLE;
	}
	public void setR_TITLE(String r_TITLE) {
		this.r_TITLE = r_TITLE;
	}
	public String getR_CONTENT() {
		return r_CONTENT;
	}
	public void setR_CONTENT(String r_CONTENT) {
		this.r_CONTENT = r_CONTENT;
	}
	
	public String getR_FILE1() {
		return r_FILE1;
	}
	public void setR_FILE1(String r_FILE1) {
		this.r_FILE1 = r_FILE1;
	}
	public String getR_FILE2() {
		return r_FILE2;
	}
	public void setR_FILE2(String r_FILE2) {
		this.r_FILE2 = r_FILE2;
	}
	public String getR_DATE() {
		return r_DATE;
	}
	public void setR_DATE(String r_DATE) {
		this.r_DATE = r_DATE;
	}
	
	
}
