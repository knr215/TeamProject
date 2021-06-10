package kr.co.korea.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.korea.beans.ReplyBean;
import kr.co.korea.beans.ReviewBean;
import kr.co.korea.beans.SearchCriteria;
import kr.co.korea.service.ReplyService;
import kr.co.korea.service.ReviewService;

@RestController
@RequestMapping("/reply")
public class ReplyRestController {

	@Autowired
	private ReplyService replyservice;

	@Autowired
	@Lazy
	private ReviewService reviewservice;

	@PostMapping("/replywrite/{re_rid}/{re_mIDx}/{re_content}")
	public Map<String, Object> replywrite(@PathVariable int re_rid, @PathVariable int re_mIDx,
			@PathVariable String re_content) {
		Map<String, Object> map = new HashMap<String, Object>();

		try {
			ReplyBean replybean = new ReplyBean();
			replybean.setRe_content(re_content);
			replybean.setRe_mIDx(re_mIDx);
			replybean.setRe_rid(re_rid);

			replyservice.replywrite(replybean);

			map.put("result", "작성완료");

		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "작성실패");
		}
		return map;
	}

	@PostMapping("/replylist/{pID}") //
	public List<Map<Integer, Object>> replylist(@PathVariable int pID,SearchCriteria scri) {
		ReviewBean reviewbean = new ReviewBean();
		reviewbean.setR_pID(pID);
		List<ReviewBean> reviewlist = reviewservice.reviewList(reviewbean,scri);

		List<Map<Integer, Object>> list = new ArrayList<Map<Integer, Object>>();

		for (ReviewBean bean : reviewlist) {
			int re_rid = bean.getR_ID();// 값 구한 후, 해당 되는 리스트를 입력
			Map<Integer, Object> map = new HashMap<Integer, Object>();
			List<ReplyBean> reply = replyservice.replylist(re_rid);
			
			if(reply.size() ==0 ) {
				
			}else {
				map.put(re_rid, replyservice.replylist(re_rid));// 리스트를 맵에 put
				list.add(map);
			}
		}
		
//		for(Map<Integer, Object> mmmp : list){
//			for(Map.Entry<Integer, Object> entry:mmmp.entrySet()){
//			        int key = entry.getKey();
//			        Object value = entry.getValue();
//			     System.out.println("key: " + key + " | value: " + value);
//			}
//		}
		
		return list;
	}

	@PostMapping("/replyupdate/{re_ID}/{reply_content}")
	public Map<String, Object> replyupdate(@PathVariable int re_ID, @PathVariable String reply_content) {
		Map<String, Object> map = new HashMap<String, Object>();

		try {
			ReplyBean replybean = new ReplyBean();
			replybean.setRe_ID(re_ID);
			replybean.setRe_content(reply_content);

			replyservice.replyupdate(replybean);

			map.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}

		return map;
	}

	@PostMapping("/replydelete/{re_ID}")
	public Map<String, Object> replydelete(@PathVariable int re_ID) {
		Map<String, Object> map = new HashMap<String, Object>();

		try {
			replyservice.replydelete(re_ID);	
			map.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}

		return map;
	}

}
