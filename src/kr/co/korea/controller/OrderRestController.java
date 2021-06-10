package kr.co.korea.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.korea.beans.OrderBean;
import kr.co.korea.service.OrderService;

@RestController
@RequestMapping("/orders")
public class OrderRestController {

	@Autowired
	OrderService orderservice;
	
	
	
	@PostMapping("/orderinvoice/{o_ID}")
	public Map<String,Object> invoicecheck(@PathVariable int o_ID){
		
		
		Map<String,Object> map = new HashMap<String, Object>();
		//癒쇱� invoice瑜� �씫�뼱�샂. 洹몃━怨� 媛믪씠 0�씠�떎? 
		
		try {
			
			int invoice = orderservice.getinvoiceinfo(o_ID);	
			
			map.put("result", invoice);
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			map.put("result", "fail");
			
		}
		
		return map;
	}
	
	@PostMapping("/invoiceadd/{o_ID}")
	public Map<String,Object> invoiceadd(@PathVariable int o_ID){
		
		
		Map<String,Object> map = new HashMap<String, Object>();
		//癒쇱� invoice瑜� �씫�뼱�샂. 洹몃━怨� 媛믪씠 0�씠�떎? 
		
		try {
			
			Random random = new Random();
			String sample ="";
			
			for(int i=0;i<8;i++) {
				sample += Integer.toString(random.nextInt(10));
			}
			
			int o_INVOICE = Integer.parseInt(sample);
			
			OrderBean orderbean = new OrderBean();
			orderbean.setO_ID(o_ID);
			orderbean.setO_INVOICE(o_INVOICE);
			orderservice.invoiceadd(orderbean);
			
			map.put("result","success");
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			map.put("result", "fail");
			
		}
		
		return map;
	}
}
