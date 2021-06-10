package kr.co.korea.beans;

public class CartBean {
	
	private int cID;
	private int c_m_IDx;
	private int c_p_ID;
	private int cAmount;
	private String cDATE;
	
	private String c_uname;
	private String c_pIMAGE1;
	
	private int c_pPRICE;
	private int c_pdiscount;
	private String c_pNAME;
	private int c_pSTOCK;
	
	public int getC_pSTOCK() {
		return c_pSTOCK;
	}
	public void setC_pSTOCK(int c_pSTOCK) {
		this.c_pSTOCK = c_pSTOCK;
	}
	public String getC_pNAME() {
		return c_pNAME;
	}
	public void setC_pNAME(String c_pNAME) {
		this.c_pNAME = c_pNAME;
	}
	public String getC_uname() {
		return c_uname;
	}
	public void setC_uname(String c_uname) {
		this.c_uname = c_uname;
	}

	public String getC_pIMAGE1() {
		return c_pIMAGE1;
	}
	public void setC_pIMAGE1(String c_pIMAGE1) {
		this.c_pIMAGE1 = c_pIMAGE1;
	}
	public int getC_pPRICE() {
		return c_pPRICE;
	}
	public void setC_pPRICE(int c_pPRICE) {
		this.c_pPRICE = c_pPRICE;
	}
	public int getC_pdiscount() {
		return c_pdiscount;
	}
	public void setC_pdiscount(int c_pdiscount) {
		this.c_pdiscount = c_pdiscount;
	}
	public int getcID() {
		return cID;
	}
	public void setcID(int cID) {
		this.cID = cID;
	}
	public int getC_m_IDx() {
		return c_m_IDx;
	}
	public void setC_m_IDx(int c_m_IDx) {
		this.c_m_IDx = c_m_IDx;
	}
	public int getC_p_ID() {
		return c_p_ID;
	}
	public void setC_p_ID(int c_p_ID) {
		this.c_p_ID = c_p_ID;
	}
	public int getcAmount() {
		return cAmount;
	}
	public void setcAmount(int cAmount) {
		this.cAmount = cAmount;
	}
	public String getcDATE() {
		return cDATE;
	}
	public void setcDATE(String cDATE) {
		this.cDATE = cDATE;
	}
	
}
