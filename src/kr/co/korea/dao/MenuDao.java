package kr.co.korea.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.SubmenuBean;


@Repository
public class MenuDao {
	
	@Autowired
	private SqlSessionTemplate sqltemp;
	
	public List<SubmenuBean> getTopmenu() {
		return 	sqltemp.selectList("menu.topmenuinfo");
	}
	
	public List<SubmenuBean> getSubmenu() {
		return 	sqltemp.selectList("menu.submenuinfo");
	}
	
}
