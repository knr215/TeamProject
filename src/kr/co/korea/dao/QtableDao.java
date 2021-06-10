package kr.co.korea.dao;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import kr.co.korea.beans.QtableBean;

@Repository
public class QtableDao {
	@Autowired
	private SqlSessionTemplate sqltemp;
	
	public void addNoticeInfo(QtableBean qtableBean) {
		sqltemp.insert("qtable.addNoticeInfo", qtableBean);
	}

public List<QtableBean> getNoticeList() {	
	return sqltemp.selectList("qtable.getNoticeList");
}
public QtableBean getNoticeInfo(int q_idx) {
	return sqltemp.selectOne("qtable.getNoticeInfo", q_idx);
}
public void updatehitNotice(int q_idx) {

	sqltemp.update("qtable.updatehitNotice", q_idx);
}
public QtableBean getEditNoticeInfo(int q_idx) {
	return sqltemp.selectOne("qtable.getEditNoticeInfo", q_idx);
	
}

public void editNoticeInfo(QtableBean qtableBean) {
	sqltemp.update("qtable.editNoticeInfo", qtableBean);
	
}


public void deleteNoticeInfo(int q_idx) {
	sqltemp.delete("qtable.deleteNoticeInfo", q_idx);
}
}
