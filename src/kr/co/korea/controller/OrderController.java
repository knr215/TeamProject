package kr.co.korea.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.korea.beans.CartBean;
import kr.co.korea.beans.OrderBean;
import kr.co.korea.beans.OrderProductBean;
import kr.co.korea.beans.UserBean;
import kr.co.korea.service.CartService;
import kr.co.korea.service.OrderService;
import kr.co.korea.service.UserService;

@Controller
@RequestMapping("/orders")
public class OrderController {
	
	@Autowired
	OrderService orderservice;
	
	@Autowired
	@Lazy
	UserService userservice;
	
	@Autowired
	@Lazy
	CartService cartservice;
	
	@Resource(name = "loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@PostMapping("/orderwrite")
	public String order(OrderBean orderbean,
						@RequestParam(value="cha[]") List<String> Checklist,
						@RequestParam(value="allsumprice") int sumprice,
						@RequestParam(value="postcost") int postcost,
						@RequestParam(value="allsum") int allsum,
						Model model) {
		
		List<CartBean> cartlist = new ArrayList<CartBean>();
		
		int Cartid=0;
		for(String i : Checklist) {
			Cartid = Integer.parseInt(i);
			cartlist.add(cartservice.idxcartgetinfo(Cartid));
		}//카트 정보
		
		
		Map<String,Object> pricemap = new LinkedHashMap<String,Object>();
		pricemap.put("sumprice",sumprice);
		pricemap.put("postcost",postcost);
		pricemap.put("allsum",allsum);
		//결제 금액 전부 가져와서 map에 담기
		
		UserBean userbean = new UserBean();
		userservice.getUserInfo(userbean);
		
		model.addAttribute("Checklist",Checklist);
		model.addAttribute("userbean",userbean);
		model.addAttribute("cartlist",cartlist);
		model.addAttribute("pricemap",pricemap);
		
		return "/orders/order";
	}
	
	@PostMapping("/orderresult")//移댄듃 �궘�젣, order,order_product�뿉 異붽��빐�빞�븿.
	public String orderresult(OrderBean orderbean,OrderProductBean orderproductbean,
			@RequestParam(value="cha[]") List<String> Checklist,Model model) {
		
		Calendar cal = Calendar.getInstance();//�빐�떦 二쇰Ц�쓽 ���씠��
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		UUID UUIDs = UUID.randomUUID();//怨좎쑀 �떇蹂꾩옄
		
		String subname = UUIDs.toString().replaceAll("-", "");//String �쑝濡� 蹂��솚 �썑, - 湲고샇 �궘�젣
		subname = subname.substring(0,10);
		
		String ordertitle = ymd + "_" + subname;//�궇吏� + uuid濡� �엫�쓽濡� �꽕�젙
		
		orderbean.setO_title(ordertitle);
		orderbean.setO_mIDx(loginUserBean.getMidx());
		orderservice.orderinsert(orderbean);
		
		int o_id = orderbean.getO_ID();//orders�뀒�씠釉붿뿉 �뱾�뼱媛��뒗 �떆���뒪 �뵲濡� ���옣
		
		int Cartid=0;
		for(String i : Checklist) {
			Cartid = Integer.parseInt(i);
			orderproductbean.setOp_oid(o_id);//order �뀒�씠釉붿쓽 湲곕낯�궎瑜� �쇅�옒�궎濡� 諛쏆븘�샂
			orderproductbean.setO_c_id(Cartid);//移댄듃 �븘�씠�뵒�뒗 �뿬�윭媛쒖씪寃쎌슦 for臾몄쓣 �넻�븯�뿬 �엯�젰
			orderservice.orderproductinsert(orderproductbean);
			cartservice.cartdelete(Cartid);//二쇰Ц�뿉 �꽦怨듯븯硫� 移댄듃�뿉�꽌 �빐�떦 �젙蹂� �궘�젣
		}
		//�뿬湲곌퉴吏�媛� insert �씠 �썑�뒗 select
		
		OrderBean vieworderbean = orderservice.getmaninfo(o_id);
		List<OrderProductBean> vieworderproductlist = orderservice.getorderproudct(o_id);
		
		model.addAttribute("vieworderproductlist",vieworderproductlist);
		model.addAttribute("vieworderbean",vieworderbean);
		
		return "/orders/orderresult";
	}
	
	@GetMapping("/orderlist")
	public String orderlist(Model model) {
		int o_mIDx =loginUserBean.getMidx();
		OrderBean orderbean = new OrderBean();
		orderbean.setO_mlevel(loginUserBean.getMlevel());
		orderbean.setO_mIDx(o_mIDx);
		
		List<OrderProductBean> list = orderservice.getorderlist(orderbean);
		model.addAttribute("list",list);
		return "orders/orderlist";
	}
	
	@GetMapping("/orderread")
	public String orderread(int o_ID,Model model) {
		OrderBean vieworderbean = orderservice.getmaninfo(o_ID);
		List<OrderProductBean> vieworderproductlist = orderservice.getorderproudct(o_ID);
		
		model.addAttribute("vieworderproductlist",vieworderproductlist);
		model.addAttribute("vieworderbean",vieworderbean);
		
		return "orders/orderread";
	}
}
