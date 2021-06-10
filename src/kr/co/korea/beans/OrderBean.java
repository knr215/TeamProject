package kr.co.korea.beans;

public class OrderBean {
	//받는 사람 정보를 저장, midx는 보내는이 정보
	
	private int o_ID;
	private String o_DATE;
	private int o_mIDx;
	private String o_NAME;
	private String o_PHONE;
	private String o_post;
	private String o_ADDRESS;
	private String o_ADDRESS2;
	private String o_PAYMENT;
	private int o_INVOICE;
	private int o_money;
	private String o_title;
	
	private String o_mname;//order에서 사용될 정보들
	private String o_memail;
	private String o_mphone;
	
	private int o_mlevel;
	
	public int getO_mlevel() {
		return o_mlevel;
	}
	public void setO_mlevel(int o_mlevel) {
		this.o_mlevel = o_mlevel;
	}
	public String getO_mname() {
		return o_mname;
	}
	public void setO_mname(String o_mname) {
		this.o_mname = o_mname;
	}
	public String getO_memail() {
		return o_memail;
	}
	public void setO_memail(String o_memail) {
		this.o_memail = o_memail;
	}
	public String getO_mphone() {
		return o_mphone;
	}
	public void setO_mphone(String o_mphone) {
		this.o_mphone = o_mphone;
	}
	public String getO_title() {
		return o_title;
	}
	public void setO_title(String o_title) {
		this.o_title = o_title;
	}
	public int getO_money() {
		return o_money;
	}
	public void setO_money(int o_money) {
		this.o_money = o_money;
	}
	public int getO_ID() {
		return o_ID;
	}
	public void setO_ID(int o_ID) {
		this.o_ID = o_ID;
	}
	public String getO_DATE() {
		return o_DATE;
	}
	public void setO_DATE(String o_DATE) {
		this.o_DATE = o_DATE;
	}
	public int getO_mIDx() {
		return o_mIDx;
	}
	public void setO_mIDx(int o_mIDx) {
		this.o_mIDx = o_mIDx;
	}
	public String getO_NAME() {
		return o_NAME;
	}
	public void setO_NAME(String o_NAME) {
		this.o_NAME = o_NAME;
	}
	public String getO_PHONE() {
		return o_PHONE;
	}
	public void setO_PHONE(String o_PHONE) {
		this.o_PHONE = o_PHONE;
	}
	public String getO_post() {
		return o_post;
	}
	public void setO_post(String o_post) {
		this.o_post = o_post;
	}
	public String getO_ADDRESS() {
		return o_ADDRESS;
	}
	public void setO_ADDRESS(String o_ADDRESS) {
		this.o_ADDRESS = o_ADDRESS;
	}
	public String getO_ADDRESS2() {
		return o_ADDRESS2;
	}
	public void setO_ADDRESS2(String o_ADDRESS2) {
		this.o_ADDRESS2 = o_ADDRESS2;
	}
	public String getO_PAYMENT() {
		return o_PAYMENT;
	}
	public void setO_PAYMENT(String o_PAYMENT) {
		this.o_PAYMENT = o_PAYMENT;
	}
	public int getO_INVOICE() {
		return o_INVOICE;
	}
	public void setO_INVOICE(int o_INVOICE) {
		this.o_INVOICE = o_INVOICE;
	}
	
}
