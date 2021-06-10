package kr.co.korea.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.ContentBean;

@Repository
public class BoardDao {

	@Autowired
	private SqlSessionTemplate sqltemp;
	
	public void addContentInfo(ContentBean contentBean) {
		sqltemp.insert("board.addContentInfo", contentBean);
	}
	
	public String getBoardInfoName(int board_info_idx) {
		return sqltemp.selectOne("board.getBoardInfoName", board_info_idx);
	}
	public List<ContentBean> getContentList(int board_info_idx, RowBounds rowBounds){
		return sqltemp.selectList("board.getContentList", board_info_idx, rowBounds);
	}
	
	public List<ContentBean> getBoardsList(int midx, RowBounds rowBounds){
		return sqltemp.selectList("board.getBoardsList", midx, rowBounds);
	}
	
	public ContentBean getContentInfo(int content_idx) {
		return sqltemp.selectOne("board.getContentInfo", content_idx);
	}
	
	public void modifyContentInfo(ContentBean contentBean) {
		sqltemp.update("board.modifyContentInfo", contentBean);
	}
	public void deleteContentInfo(int content_idx) {
		sqltemp.delete("board.deleteContentInfo", content_idx);
	}
	
	public int getContentCnt(int content_board_idx) {
		return sqltemp.selectOne("board.getContentCnt", content_board_idx);
	}
	public void qna_reply_insert(ContentBean contentBean) {
	  sqltemp.update("board.qna_reply_insert", contentBean);
	}
	public void qna_reply_up(ContentBean contentBean) {
		  sqltemp.update("board.qna_reply_up", contentBean);
		}
	
	public void qna_reply_delete(int content_bno) {
		sqltemp.delete("board.qna_reply_delete", content_bno);
	}
	
	public int qna_reply_up(int content_idx) {

		return sqltemp.update("board.qna_reply_up",content_idx);

		}

		// insert/update/delete 등 DB 변경하는 작업 시 결과값은 정수로 나오므로 int 필요

		// 했던 작업수로 작업을 했으면 >0 안했으면 = 0

	public int insertreply(Map<String, Object> map) {

	return sqltemp.insert("board.insertreply", map);

	}
	public int selectBoardIdxMax() {
	 return sqltemp.selectOne("board.selectBoardIdxMax");
		
		}
	
	public void insertreply(ContentBean contentBean) {
	 sqltemp.insert("board.insertreply", contentBean);
	}

		public void updatereply(int content_idx) {

	sqltemp.update("board.updatereply", content_idx);

}
		public List<Map<String,Object>> selectreply() {

		return sqltemp.selectList("board.selectreply");

		}

		public List<Map<String,Object>> selectById() {

		return sqltemp.selectList("board.selectById");

		}	
}
