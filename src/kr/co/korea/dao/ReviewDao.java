package kr.co.korea.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.ReviewBean;

@Repository
public class ReviewDao {
	
	@Autowired
	private SqlSessionTemplate sqltemp;
	
	public ReviewBean reviewmeminfo(int o_mIDx) {
		return sqltemp.selectOne("review.reviewwirtememinfo",o_mIDx);
	}
	
	public void reviewinsert(ReviewBean reviewbean) {
		sqltemp.insert("review.reviewinsert",reviewbean);
	}
	
	public List<ReviewBean> allreviewlist(ReviewBean reviewbean){
		return sqltemp.selectList("review.allreviewlist",reviewbean);
	}
	public List<ReviewBean> reviewList(ReviewBean reviewbean){
		return sqltemp.selectList("review.reviewlist",reviewbean);
	}
	
	public ReviewBean reviewgetinfo(int r_ID) {
		return sqltemp.selectOne("review.reviewgetinfo",r_ID);
	}
	
	public void reviewupdate(ReviewBean reviewbean) {
		sqltemp.update("review.reviewupdate",reviewbean);
	}
	
	public void reviewdelete(ReviewBean reviewbean) {
		sqltemp.delete("review.reviewdelete",reviewbean);
	}
	
	public int reviewcount(ReviewBean reviewbean) {
		return sqltemp.selectOne("review.reviewcount",reviewbean);
	}
	
}
