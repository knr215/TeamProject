package kr.co.korea.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.korea.service.UserService;

@RestController
@RequestMapping("/user")
public class UserRestController {

	@Autowired
	private UserService userservice;
	
	@PostMapping("/checkUserIdExist/{mid}")
	public Map<String,Object> IdCheck(@PathVariable String mid) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		String checkid="";
		
		try {
			
			
			checkid=userservice.checkUserIdExist(mid);
			
			if((checkid==null)||(checkid=="")) {
				map.put("result", "success");
			}else {
				map.put("result", "fail");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		
		
		return map;
	}
}
