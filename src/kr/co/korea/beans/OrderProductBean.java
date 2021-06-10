package kr.co.korea.beans;

public class OrderProductBean {
	//주문한 상품 정보를 보관하는 곳.
	private int op_IDx;//기본키
	private int op_pID;//상품키
	private int op_amount;//상품양
	private int op_oid;//order테이블의 기본키를 외래키로
	
	private int o_c_id;//카트 기본키 받아올 키
	
	private String op_pNAME;//result에서 읽을 값들 설정
	private String op_pIMAGE1;
	private int op_o_money;
	private int op_o_INVOICE;
	private int op_pPRICE;
	private String op_date;
	
	public String getOp_date() {
		return op_date;
	}
	public void setOp_date(String op_date) {
		this.op_date = op_date;
	}
	public int getOp_pPRICE() {
		return op_pPRICE;
	}
	public void setOp_pPRICE(int op_pPRICE) {
		this.op_pPRICE = op_pPRICE;
	}
	public String getOp_pNAME() {
		return op_pNAME;
	}
	public void setOp_pNAME(String op_pNAME) {
		this.op_pNAME = op_pNAME;
	}
	public String getOp_pIMAGE1() {
		return op_pIMAGE1;
	}
	public void setOp_pIMAGE1(String op_pIMAGE1) {
		this.op_pIMAGE1 = op_pIMAGE1;
	}
	public int getOp_o_money() {
		return op_o_money;
	}
	public void setOp_o_money(int op_o_money) {
		this.op_o_money = op_o_money;
	}
	public int getOp_o_INVOICE() {
		return op_o_INVOICE;
	}
	public void setOp_o_INVOICE(int op_o_INVOICE) {
		this.op_o_INVOICE = op_o_INVOICE;
	}
	public int getO_c_id() {
		return o_c_id;
	}
	public void setO_c_id(int o_c_id) {
		this.o_c_id = o_c_id;
	}
	public int getOp_IDx() {
		return op_IDx;
	}
	public void setOp_IDx(int op_IDx) {
		this.op_IDx = op_IDx;
	}
	public int getOp_pID() {
		return op_pID;
	}
	public void setOp_pID(int op_pID) {
		this.op_pID = op_pID;
	}
	public int getOp_amount() {
		return op_amount;
	}
	public void setOp_amount(int op_amount) {
		this.op_amount = op_amount;
	}
	public int getOp_oid() {
		return op_oid;
	}
	public void setOp_oid(int op_oid) {
		this.op_oid = op_oid;
	}
	
}
