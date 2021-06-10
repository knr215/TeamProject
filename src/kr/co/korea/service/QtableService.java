package kr.co.korea.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.korea.beans.QtableBean;
import kr.co.korea.beans.UserBean;
import kr.co.korea.dao.QtableDao;

@Service
public class QtableService {
	
	@Autowired
	private QtableDao qtableDao;
	
	@Value("${path.upload}")
	private String path_upload;
	
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Resource(name="qtabBean")
	@Lazy
	private QtableBean qtabBean;
	
	public void addNoticeInfo(QtableBean qtableBean) {
		MultipartFile upload_file =qtableBean.getUpload_file();
		if(upload_file.getSize()>0) {
			String file_name=saveUploadFile(upload_file);
			qtableBean.setQ_file(file_name);
		}
		qtableBean.setQ_idx(loginUserBean.getMidx()); //濡쒓렇�씤�븳 idx瑜� ���옣
		qtableDao.addNoticeInfo(qtableBean);//DB�뿉 insert�룞�옉
	}
	// 硫��떚�뙆�듃�뙆�씪�쓣 �꽌踰꾩뿉 ���옣�븯怨�, �뙆�씪紐낆쓣 臾몄옄�뿴濡� 由ы꽩 //
	private String saveUploadFile(MultipartFile upload_file) {
		String file_name=System.currentTimeMillis()+upload_file.getOriginalFilename();  //�떎�젣�뙆�씪�쓣 媛��졇���꽌 臾몄옄�뿴濡� ���옣
		try {
			upload_file.transferTo(new File(path_upload+"/"+file_name));  //�뙆�씪媛앹껜�깮�꽦�썑 ���옣
			System.out.println(path_upload);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return file_name;
	}
	//由ъ뒪�듃 �넻吏몃줈
	public List<QtableBean> getNoticeList(){
		return qtableDao.getNoticeList();
	}

	public QtableBean getNoticeInfo(int q_idx) {
		return qtableDao.getNoticeInfo(q_idx);
	}
	
	
	public QtableBean getEditNoticeInfo(int q_idx) {
		
		return qtableDao.getEditNoticeInfo(q_idx);//DB�뿉 insert�룞�옉
		
	}
	
	public void editNoticeInfo(QtableBean qtableBean) {
		MultipartFile upload_file =qtableBean.getUpload_file();
		if(upload_file.getSize()>0) {
			String file_name=saveUploadFile(upload_file);
			qtableBean.setQ_file(file_name);
		}
		qtableDao.editNoticeInfo(qtableBean);
		
	}
	
	public void updatehitNotice(int q_idx) {

		qtableDao.updatehitNotice(q_idx);
	}
	
	
	public void deleteNoticeInfo(int q_idx) {
		qtableDao.deleteNoticeInfo(q_idx);
	}
}
