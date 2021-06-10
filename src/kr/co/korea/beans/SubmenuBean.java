package kr.co.korea.beans;

public class SubmenuBean extends TopmenuBean{

	private int sub_idx;
	private int sub_top_idx;
	private String sub_name;
	public int getSub_idx() {
		return sub_idx;
	}
	public void setSub_idx(int sub_idx) {
		this.sub_idx = sub_idx;
	}
	public int getSub_top_idx() {
		return sub_top_idx;
	}
	public void setSub_top_idx(int sub_top_idx) {
		this.sub_top_idx = sub_top_idx;
	}
	public String getSub_name() {
		return sub_name;
	}
	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}
	
}
