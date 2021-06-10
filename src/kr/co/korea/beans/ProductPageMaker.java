package kr.co.korea.beans;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class ProductPageMaker {
	private SearchCriteria cri;
	private ProductBean product;
	private int totalCount; // 珥� 寃뚯떆湲� �닔
	private int startPage; // �솕硫댁뿉 蹂댁씠�뒗 泥ル쾲吏� 踰덊샇
	private int endPage; // �솕硫댁뿉 蹂댁씠�뒗 留덉�留� 踰덊샇
	private boolean prev; // �씠�쟾 踰꾪듉 留뚮뱾�뼱�빞 �븯�뒗媛�?
	private boolean next; // �떎�쓬 踰꾪듉 留뚮뱾�뼱�빞 �븯�뒗媛�?
	private int displayPageNum = 5; // �럹�씠吏� 踰덊샇 珥� 媛쒖닔
	
	
	
	public ProductBean getProduct() {
		return product;
	}

	public void setProduct(ProductBean product) {
		this.product = product;
	}

	public SearchCriteria getCri() {
		return cri;
	}

	public void setCri(SearchCriteria Cri) {
		this.cri = Cri;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	private void calcData() {

		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		// getpage => �쁽�옱 �럹�씠吏�
		// �쁽�옱 �럹�씠吏��뿉�꽌 蹂댁씠�뒗 �럹�씠吏� �닔瑜� �굹�늿 �썑 �삱由� 洹� �썑 蹂댁씠�뒗 �럹�씠吏� �닔瑜� 怨깊븳�떎.

		startPage = (endPage - displayPageNum) + 1;
		if (startPage <= 0)
			startPage = 1;

		// 留덉�留� 踰덊샇�뿉�꽌 珥� 媛쒖닔瑜� 類� 洹� �썑 +1 �븯吏�留� 0�샊�� �쓬�닔�씪 寃쎌슦�뒗 1濡� 吏��젙

		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		// 留덉�留� �럹�씠吏� 踰덊샇
		// 珥� 寃뚯떆湲��닔/ 寃뚯떆臾� 媛쒖닔(10)
		// 留뚯빟 �솕硫댁뿉 蹂댁씠�뒗 �럹�씠吏� �닽�옄媛� 留덉�留� �럹�씠吏� 踰덊샇蹂대떎 �겕�떎? 洹몃윭硫� 洹� �럹�씠吏�媛� 留덉�留� �럹�씠吏�濡� 吏��젙.

		prev = startPage == 1 ? false : true;
		// 1�씪寃쎌슦 �씠�쟾 踰꾪듉�쓣 留뚮뱾吏� �븡�뒗�떎

		next = endPage * cri.getPerPageNum() < totalCount ? true : false;
		// �솕硫댁뿉 蹂댁씠�뒗 留덉�留� �닽�옄 * 寃뚯떆臾� 媛쒖닔(10) < 珥� 寃뚯떆臾�
		// 留덉�留� �럹�씠吏� �씪寃쎌슦 next踰꾪듉�쓣 留뚮뱾吏� �븡�뒗�떎.
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public String makeQuery(int page) {
		UriComponents uriComponents = null;

		if (product.getP_sub_idx() > 0) {

			uriComponents = UriComponentsBuilder
							.newInstance()
							.queryParam("top_idx", product.getP_top_idx())
							.queryParam("sub_idx", product.getP_sub_idx())
							.queryParam("page", page)
							.queryParam("perPageNum", cri.getPerPageNum())
							.build();
		} else if (product.getP_sub_idx() == 0) {

			uriComponents = UriComponentsBuilder
						.newInstance()
						.queryParam("top_idx", product.getP_top_idx())
						.queryParam("page", page)
						.queryParam("perPageNum", cri.getPerPageNum())
						.build();
		}

		return uriComponents.toUriString();
	}

	public String makeSearch(int page) {
		UriComponents uriComponents = null;
		
		if (product.getP_sub_idx() != 0) {

			uriComponents = UriComponentsBuilder.newInstance()
					.queryParam("top_idx", product.getP_top_idx())
					.queryParam("sub_idx", product.getP_sub_idx())
					.queryParam("page", page)
					.queryParam("perPageNum", cri.getPerPageNum())
    		        .queryParam("keyword", encoding(cri.getKeyword()))
					.build();
		} else if (product.getP_sub_idx() == 0) {

			uriComponents = UriComponentsBuilder.newInstance()
					.queryParam("top_idx", product.getP_top_idx())
					.queryParam("page", page)
					.queryParam("perPageNum", cri.getPerPageNum())
		            .queryParam("keyword", encoding(cri.getKeyword()))
					.build();
		}

		return uriComponents.toUriString();
	}

	private String encoding(String keyword) {
		if (keyword == null || keyword.trim().length() == 0) {
			return "";
		}

		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}

}
