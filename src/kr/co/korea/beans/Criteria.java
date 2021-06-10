package kr.co.korea.beans;

public class Criteria {
	
	private int page; //�럹�씠吏� 踰덊샇
	private int perPageNum; //寃뚯떆臾� 媛��닔
	private int rowStart;
	private int rowEnd;
		
	public  Criteria(){
		this.page=1;
		this.perPageNum=12;
	}
	
	public int getPageStart() {
		return (this.page-1) * perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		if(page <=0) {
		
			this.page=1;
		
		}else {

			this.page = page;
		}
		
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}
	
	public void setPerPageNum(int PageCount) {
		int count = this.perPageNum;
		
		if(PageCount != count) {
		
			this.perPageNum = count;
			
		}else {
			
			this.perPageNum =PageCount;
		
		}
		
	}
	
	public int getRowStart() {
		rowStart = ((page-1)*perPageNum)+1;
		return rowStart;
	}

	public int getRowEnd() {
		rowEnd=rowStart+perPageNum-1;
		return rowEnd;
	}
	
		
	
}
