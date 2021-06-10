package kr.co.korea.beans;



import org.springframework.web.multipart.MultipartFile;

public class ContentBean {

	private int content_idx;
	private String content_subject;
	private String content_text;
	private MultipartFile upload_file;   //硫��떚���듃�뙆�씪 �옄泥대�� �쟾�떖
	private String content_file;         //�뙆�씪紐낆옄泥�
	private int content_writer_idx;
	private int content_board_idx;
	private String content_date;
	private String content_write_name;  //濡쒓렇�씤�븳 �궗�엺�쓽 �씠由�

	
	private String content_pwd;
	private int content_hit;
	private int content_bno;
	private int content_step;
	private int content_level;
	private String content_secret;

	public String getContent_secret() {
		return content_secret;
	}
	public void setContent_secret(String content_secret) {
		this.content_secret = content_secret;
	}
	public int getContent_level() {
		return content_level;
	}
	public void setContent_level(int content_level) {
		this.content_level = content_level;
	}
	public String getContent_pwd() {
		return content_pwd;
	}
	public void setContent_pwd(String content_pwd) {
		this.content_pwd = content_pwd;
	}
	public int getContent_hit() {
		return content_hit;
	}
	public void setContent_hit(int content_hit) {
		this.content_hit = content_hit;
	}

	public int getContent_bno() {
		return content_bno;
	}
	public void setContent_bno(int content_bno) {
		this.content_bno = content_bno;
	}
	public int getContent_step() {
		return content_step;
	}
	public void setContent_step(int content_step) {
		this.content_step = content_step;
	}
	
	public int getContent_idx() {
		return content_idx;
	}
	public void setContent_idx(int content_idx) {
		this.content_idx = content_idx;
	}
	public String getContent_subject() {
		return content_subject;
	}
	public void setContent_subject(String content_subject) {
		this.content_subject = content_subject;
	}
	public String getContent_text() {
		return content_text;
	}
	public void setContent_text(String content_text) {
		this.content_text = content_text;
	}
	public MultipartFile getUpload_file() {
		return upload_file;
	}
	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}
	public String getContent_file() {
		return content_file;
	}
	public void setContent_file(String content_file) {
		this.content_file = content_file;
	}
	public int getContent_writer_idx() {
		return content_writer_idx;
	}
	public void setContent_writer_idx(int content_writer_idx) {
		this.content_writer_idx = content_writer_idx;
	}
	public int getContent_board_idx() {
		return content_board_idx;
	}
	public void setContent_board_idx(int content_board_idx) {
		this.content_board_idx = content_board_idx;
	}
	public String getContent_date() {
		return content_date;
	}
	public void setContent_date(String content_date) {
		this.content_date = content_date;
	}
	public String getContent_write_name() {
		return content_write_name;
	}
	public void setContent_write_name(String content_write_name) {
		this.content_write_name = content_write_name;
	}
	public void setImagecount(int imagecheck) {
		// TODO Auto-generated method stub
		
	}
	
}
