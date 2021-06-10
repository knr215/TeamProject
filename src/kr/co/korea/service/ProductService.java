package kr.co.korea.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.korea.beans.ProductBean;
import kr.co.korea.beans.SearchCriteria;
import kr.co.korea.dao.ProductDao;

@Service
public class ProductService {

	@Autowired
	private ProductDao productdao;

	public void insertproduct(MultipartHttpServletRequest multirequest, ProductBean productbean) {

		List<MultipartFile> multifilelist = new ArrayList<MultipartFile>();
		List<String> imagenames = new ArrayList<String>();
		
		int imagecheck = 0;
		
		if ((!productbean.getUpload_file().isEmpty()) && (productbean.getUpload_file2().isEmpty())) {//1만 사진 입력
			MultipartFile upload1 = productbean.getUpload_file();
			multifilelist.add(upload1);
			imagecheck =1;
		} else if ((productbean.getUpload_file().isEmpty()) && (!productbean.getUpload_file2().isEmpty())) {//2만 사진 입력
			MultipartFile upload2 = productbean.getUpload_file2();
			multifilelist.add(upload2);
			imagecheck=2;
		} else 	if ((!productbean.getUpload_file().isEmpty()) && (!productbean.getUpload_file2().isEmpty())) {//1,2 사진 입력
			MultipartFile upload1 = productbean.getUpload_file();
			MultipartFile upload2 = productbean.getUpload_file2();
			multifilelist.add(upload1);
			multifilelist.add(upload2);
			imagecheck=3;
		} 
		
		if (multifilelist.size() > 0) {
			imagenames = fileupload(multirequest,multifilelist);
			if (imagecheck == 1) {
				String filename1 = imagenames.get(0);
				productbean.setpIMAGE1(filename1);

			} else if (imagecheck == 2) {
				String filename1 = imagenames.get(0);
				productbean.setpIMAGE2(filename1);

			}else if(imagecheck == 3) {
				String filename1 = imagenames.get(0);
				String filename2 = imagenames.get(1);
				productbean.setpIMAGE1(filename1);
				productbean.setpIMAGE2(filename2);
			}
		}
		
		productbean.setImagecount(imagecheck);
		
		
		productdao.insertproduct(productbean);

	}
	
	public void productupdate(ProductBean productbean) {
		productdao.productupdate(productbean);
	}
	
	private List<String> fileupload(MultipartHttpServletRequest multirequest, List<MultipartFile> multifilelist) {
		String root_path = multirequest.getSession().getServletContext().getRealPath("/");
		String upload_path = "resources/upload/"; // upload파일 찾기,상대경로로 저장을 해야 문제가 없음.
		String filename="";
		String Originalfilename="";
		
		List<String> multilist = new ArrayList<String>();
		
		for(MultipartFile mfile : multifilelist) {
			Originalfilename = mfile.getOriginalFilename();
			filename = System.currentTimeMillis() + Originalfilename;
			
			File file = new File(root_path+upload_path+filename);
			
			if(mfile.getSize()!=0) {//파일 존재 체크
				if(!file.exists()) { // 경로에 파일이 존재안할경우
					if(file.getParentFile().mkdirs()) { //경로에 해당하는 디렉토리 생성
						
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

	public List<ProductBean> getproductInfolist(SearchCriteria scri,ProductBean productbean) {
		
		productbean.setPro_rowStart(scri.getRowStart());
		productbean.setPro_rowEnd(scri.getRowEnd());
		productbean.setPro_keyword(scri.getKeyword());
		
		return productdao.getproductInfolist(productbean);
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	public ProductBean productread(int pID) {
		productdao.producthitadd(pID);
		return productdao.getproductInfo(pID);
	}
	
	public ProductBean getproductInfo(int pID) {
		return productdao.getproductInfo(pID);
	}
	
	public void productdelete(int pID) {
		productdao.productdelete(pID);;
	}
	
	public int productcount(ProductBean productbean) {
		return productdao.productcount(productbean);
	}
	
	public List<ProductBean> productbestlist() {
	      return productdao.productbestlist();
	   }
	
}
