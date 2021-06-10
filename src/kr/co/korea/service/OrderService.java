package kr.co.korea.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.korea.beans.OrderBean;
import kr.co.korea.beans.OrderProductBean;
import kr.co.korea.dao.OrderDao;

@Service
public class OrderService {

	@Autowired
	OrderDao orderdao;
	
	public void orderinsert(OrderBean orderbean) {
		orderdao.orderinsert(orderbean);
	}
	
	public void orderproductinsert(OrderProductBean orderproductbean) {
		orderdao.orderproductinsert(orderproductbean);
	}
	
	public OrderBean getmaninfo(int o_ID) {
		return orderdao.getmaninfo(o_ID);
	}
	
	public List<OrderProductBean> getorderproudct(int o_ID){
		return orderdao.getorderproudct(o_ID);
	}
	
	public List<OrderProductBean> getorderlist(OrderBean orderbean){
		return orderdao.getorderlist(orderbean);
	}
	
	public int getinvoiceinfo(int o_id) {
		return orderdao.getinvoiceinfo(o_id);
	}
	
	public void invoiceadd(OrderBean orderbean) {
		orderdao.invoiceadd(orderbean);
	}
	
}
