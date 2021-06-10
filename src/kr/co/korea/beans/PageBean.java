package kr.co.korea.beans;

public class PageBean {
	private int min;
	private int max;
	private int prevPage;
	private int nextPage;
	private int pageCnt; 
	private int currentPage;
	
	//contentCnt(전체수)=502, conentPageCnt(페이지당글수)=10 =pagesize=10 
	public PageBean(int contentCnt, int currentPage, int conentPageCnt, int paginationCnt ) {
		this.currentPage=currentPage;
		pageCnt=contentCnt/conentPageCnt;   //50  페이지수
		if(contentCnt%conentPageCnt > 0)  pageCnt++;  //51페이지
		min=((currentPage-1)/conentPageCnt)*conentPageCnt +1;  //  1
		max=min+paginationCnt-1;                               //  5
		if(max > pageCnt) max=pageCnt;
		prevPage=min-1;
		nextPage=max+1;
		if(nextPage > pageCnt) nextPage=pageCnt;
	}
	
	public int getMin() {
		return min;
	}
	public int getMax() {
		return max;
	}
	public int getPrevPage() {
		return prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public int getCurrentPage() {
		return currentPage;
	} 
	
	
	
}
