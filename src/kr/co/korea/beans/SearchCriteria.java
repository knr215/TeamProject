package kr.co.korea.beans;

public class SearchCriteria extends Criteria{

//	private String searchType=""; 종류 별로 검색할때 사용.
	private String keyword="";
	
//	public String getSearchType() {
//		return searchType;
//	}
//	public void setSearchType(String searchType) {
//		this.searchType = searchType;
//	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

}
