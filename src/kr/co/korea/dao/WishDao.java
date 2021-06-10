package kr.co.korea.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.WishBean;

@Repository
public class WishDao {
 
	@Autowired
	SqlSessionTemplate sqltemp;
	
	public void wishadd(WishBean wishBean) {
		sqltemp.insert("wish.wishadd", wishBean);
	}
	public int wishcheck(WishBean wishBean) {
		return sqltemp.selectOne("wish.wishcheck", wishBean);
	}
	
	
	public void wishamountadd(WishBean wishBean) {
		sqltemp.update("wish.wishamountadd",wishBean);
	}
	
	public List<WishBean> wishgetinfo(int midx){
		return sqltemp.selectList("wish.wishgetinfo",midx);
	}
	
	
	public WishBean idxwishgetinfo(int midx){
		return sqltemp.selectOne("wish.idxwishgetinfo",midx);
	}
	
	
	public void wishamountchange(WishBean wishBean) {
		sqltemp.update("wish.wishamountchange",wishBean);
	}
	

	public void wishdelete(int wID) {
		sqltemp.delete("wish.wishdelete", wID);
	}
	
	public WishBean wishinfobyid(int wid) {
		return sqltemp.selectOne("wish.wishinfobyid",wid);
	}
}

