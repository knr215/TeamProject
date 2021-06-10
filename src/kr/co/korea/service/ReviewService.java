package kr.co.korea.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.korea.beans.ProductBean;
import kr.co.korea.beans.ReviewBean;
import kr.co.korea.beans.SearchCriteria;
import kr.co.korea.beans.UserBean;
import kr.co.korea.dao.ProductDao;
import kr.co.korea.dao.ReviewDao;

@Service
public class ReviewService {

	@Autowired
	private ReviewDao reviewdao;
	
	@Autowired
	private ProductDao productdao;
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;

	public ReviewBean reviewmeminfo(int o_mIDx) {
		return reviewdao.reviewmeminfo(o_mIDx);
	}

	public void reviewinsert(MultipartHttpServletRequest multirequest,ReviewBean reviewbean) {

		List<MultipartFile> multifilelist = new ArrayList<MultipartFile>();
		List<String> filenames = new ArrayList<String>();

		int filecheck = 0;

		if ((!reviewbean.getUpload1().isEmpty()) && (reviewbean.getUpload2().isEmpty())) {//1留� �궗吏� �엯�젰
			MultipartFile upload1 = reviewbean.getUpload1();
			multifilelist.add(upload1);
			filecheck =1;
		} else if ((reviewbean.getUpload1().isEmpty()) && (!reviewbean.getUpload2().isEmpty())) {//2留� �궗吏� �엯�젰
			MultipartFile upload2 = reviewbean.getUpload2();
			multifilelist.add(upload2);
			filecheck=2;
		} else 	if ((!reviewbean.getUpload1().isEmpty()) && (!reviewbean.getUpload2().isEmpty())) {//1,2 �궗吏� �엯�젰
			MultipartFile upload1 = reviewbean.getUpload1();
			MultipartFile upload2 = reviewbean.getUpload2();
			multifilelist.add(upload1);
			multifilelist.add(upload2);
			filecheck=3;
		} 
		
		if (multifilelist.size() > 0) {
			filenames = fileupload(multirequest,multifilelist);
			if (filecheck == 1) {
				String filename1 = filenames.get(0);
				reviewbean.setR_FILE1(filename1);

			} else if (filecheck == 2) {
				String filename1 = filenames.get(0);
				reviewbean.setR_FILE2(filename1);

			}else if(filecheck == 3) {
				String filename1 = filenames.get(0);
				String filename2 = filenames.get(1);
				reviewbean.setR_FILE1(filename1);
				reviewbean.setR_FILE2(filename2);
			}
		}
		
		reviewbean.setFileCheck(filecheck);
		

		reviewdao.reviewinsert(reviewbean);
	}

	private List<String> fileupload(MultipartHttpServletRequest multirequest, List<MultipartFile> multifilelist) {
		String root_path = multirequest.getSession().getServletContext().getRealPath("/");
		String upload_path = "resources/upload/"; // upload�뙆�씪 李얘린,�긽��寃쎈줈濡� ���옣�쓣 �빐�빞 臾몄젣媛� �뾾�쓬.
		String filename = "";
		String Originalfilename = "";

		List<String> multilist = new ArrayList<String>();

		for (MultipartFile mfile : multifilelist) {
			Originalfilename = mfile.getOriginalFilename();
			filename = System.currentTimeMillis() + Originalfilename;

			File file = new File(root_path + upload_path + filename);

			if (mfile.getSize() != 0) {// �뙆�씪 議댁옱 泥댄겕
				if (!file.exists()) { // 寃쎈줈�뿉 �뙆�씪�씠 議댁옱�븞 �븷 寃쎌슦
					if (file.getParentFile().mkdirs()) { // 寃쎈줈�뿉 �빐�떦�븯�뒗 �뵒�젆�넗由� �깮�꽦

						try {
							file.createNewFile();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}

					}

				}
			}

			try {
				mfile.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			multilist.add(filename);

		}

		return multilist;
	}

	public List<ReviewBean> reviewList(ReviewBean reviewbean,SearchCriteria scri) {
		reviewbean.setRe_rowStart(scri.getRowStart());
		reviewbean.setRe_rowEnd(scri.getRowEnd());
		
		if(reviewbean.getR_mIDx() != 0) {
			reviewbean.setR_mlevel(loginUserBean.getMlevel());
			List<ReviewBean> reviewlist = reviewdao.reviewList(reviewbean);
			for(ReviewBean i : reviewlist) {
				int pID = i.getR_pID();
				ProductBean productbean = productdao.getproductInfo(pID);
				i.setPro_image1(productbean.getpIMAGE1());
				i.setPro_name(productbean.getpNAME());
				
			}
			return reviewlist;
		}
		
		return reviewdao.reviewList(reviewbean);
	}
	public List<ReviewBean> allreviewlist(ReviewBean reviewbean,SearchCriteria scri) {
		reviewbean.setRe_rowStart(scri.getRowStart());
		reviewbean.setRe_rowEnd(scri.getRowEnd());
		
		if(reviewbean.getR_mIDx() >= 0) {
			reviewbean.setR_mlevel(loginUserBean.getMlevel());
			List<ReviewBean> allreviewlist = reviewdao.allreviewlist(reviewbean);
			for(ReviewBean i : allreviewlist) {
				int pID = i.getR_pID();
				ProductBean productbean = productdao.getproductInfo(pID);
				i.setPro_image1(productbean.getpIMAGE1());
				i.setPro_name(productbean.getpNAME());
				
			}
			return allreviewlist;
		}
		
		return reviewdao.allreviewlist(reviewbean);
	}


	public ReviewBean reviewgetinfo(int r_ID) {
		return reviewdao.reviewgetinfo(r_ID);
	}

	public void reviewupdate(MultipartHttpServletRequest multirequest, ReviewBean reviewbean) {

		List<MultipartFile> multifilelist = new ArrayList<MultipartFile>();
		List<String> filenames = new ArrayList<String>();
		
		int filecheck = 0;
		
		if ((!reviewbean.getUpload1().isEmpty()) && (reviewbean.getUpload2().isEmpty())) {//1留� �궗吏� �엯�젰
			MultipartFile upload1 = reviewbean.getUpload1();
			multifilelist.add(upload1);
			filecheck =1;
		} else if ((reviewbean.getUpload1().isEmpty()) && (!reviewbean.getUpload2().isEmpty())) {//2留� �궗吏� �엯�젰
			MultipartFile upload2 = reviewbean.getUpload2();
			multifilelist.add(upload2);
			filecheck=2;
		} else 	if ((!reviewbean.getUpload1().isEmpty()) && (!reviewbean.getUpload2().isEmpty())) {//1,2 �궗吏� �엯�젰
			MultipartFile upload1 = reviewbean.getUpload1();
			MultipartFile upload2 = reviewbean.getUpload2();
			multifilelist.add(upload1);
			multifilelist.add(upload2);
			filecheck=3;
		} 
		
		if (multifilelist.size() > 0) {
			filenames = fileupload(multirequest,multifilelist);
			if (filecheck == 1) {
				String filename1 = filenames.get(0);
				reviewbean.setR_FILE1(filename1);

			} else if (filecheck == 2) {
				String filename1 = filenames.get(0);
				reviewbean.setR_FILE2(filename1);

			}else if(filecheck == 3) {
				String filename1 = filenames.get(0);
				String filename2 = filenames.get(1);
				reviewbean.setR_FILE1(filename1);
				reviewbean.setR_FILE2(filename2);
			}
		}
		
		reviewbean.setFileCheck(filecheck);
		
		reviewdao.reviewupdate(reviewbean);
	
	}

	public void reviewdelete(ReviewBean reviewbean) {
		reviewdao.reviewdelete(reviewbean);
	}

	public int reviewcount(ReviewBean reviewbean) {
		return reviewdao.reviewcount(reviewbean);
	}
}
