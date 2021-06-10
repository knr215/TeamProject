package kr.co.korea.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.korea.beans.SubmenuBean;
import kr.co.korea.dao.MenuDao;

@Service
public class MenuService {

	
	@Autowired
	private MenuDao menudao;
	
	public List<SubmenuBean> getTopmenu() {
		return 	menudao.getTopmenu();
	}
	
	public List<SubmenuBean> getSubmenu() {
		return 	menudao.getSubmenu();
	}
	
}
