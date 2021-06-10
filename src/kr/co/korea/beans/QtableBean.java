package kr.co.korea.beans;


import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

public class QtableBean {
	private int q_idx;  //글번호
	@NotBlank
	private String q_title; //글제목
	@NotBlank
	private String q_content; //글내용

	private String q_name; //글쓴이
	private String q_file; //첨부파일
	private String q_pwd; //비번
	private String q_date; //날짜
	private MultipartFile upload_file;
	private int q_hit; //조회수
	public int getQ_idx() {
		return q_idx;
	}
	public void setQ_idx(int q_idx) {
		this.q_idx = q_idx;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_name() {
		return q_name;
	}
	public void setQ_name(String q_name) {
		this.q_name = q_name;
	}

	public String getQ_file() {
		return q_file;
	}
	public void setQ_file(String q_file) {
		this.q_file = q_file;
	}
	public String getQ_pwd() {
		return q_pwd;
	}
	public void setQ_pwd(String q_pwd) {
		this.q_pwd = q_pwd;
	}
	public String getQ_date() {
		return q_date;
	}
	public void setQ_date(String q_date) {
		this.q_date = q_date;
	}
	public MultipartFile getUpload_file() {
		return upload_file;
	}
	public void setUpload_file(MultipartFile upload_file) {
		this.upload_file = upload_file;
	}
	public int getQ_hit() {
		return q_hit;
	}
	public void setQ_hit(int q_hit) {
		this.q_hit = q_hit;
	}

}