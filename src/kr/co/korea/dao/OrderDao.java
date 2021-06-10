package kr.co.korea.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.korea.beans.OrderBean;
import kr.co.korea.beans.OrderProductBean;


@Repository
public class OrderDao {

	@Autowired
	SqlSessionTemplate sqltemp;
	
	public int orderinsert(OrderBean orderbean) {
		sqltemp.insert("order.orderinsert",orderbean);
		return orderbean.getO_ID();
	}
	
	public void orderproductinsert(OrderProductBean orderproductbean) {
		sqltemp.insert("order.orderproductinsert",orderproductbean);
	}
	
	public OrderBean getmaninfo(int o_ID) {
		return sqltemp.selectOne("order.getmaninfo",o_ID);
	}
	
	public List<OrderProductBean> getorderproudct(int o_ID){
		return sqltemp.selectList("order.getorderproudct",o_ID);
	}
	
	public List<OrderProductBean> getorderlist(OrderBean orderbean){
		return sqltemp.selectList("order.getorderlist",orderbean);
	}
	
	public int getinvoiceinfo(int o_id) {
		return sqltemp.selectOne("order.getinvoiceinfo",o_id);
	}
	
	public void invoiceadd(OrderBean orderbean) {
		sqltemp.update("order.invoiceadd",orderbean);
	}
	
}
