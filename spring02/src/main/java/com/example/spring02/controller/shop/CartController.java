package com.example.spring02.controller.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring02.model.shop.dto.CartDTO;
import com.example.spring02.service.shop.CartService;

@Controller
@RequestMapping("/shop/cart/*") //공통적인 url mapping
public class CartController {
	
	//컨트롤러에서는 서비스를 호출하기 때문에 @Inject 어노테이션을 사용해서 의존성을 주입한다.
	@Inject
	CartService cartService;
	
	
	//컨트롤러에서 메소드의 파라미터들은 갯수제한이 없고, 순서가 상관이 없다.
	
	
	@RequestMapping("insert.do") //세부적인 url mapping
	public String insert(@ModelAttribute CartDTO dto, 
			HttpSession session) {
		//@ModelAttribute는 sumit된 form의 내용을 저장해서 전달받거나, 다시 뷰로 넘겨서 출력하기 위해 사용되는 오브젝트 이다.
		//도메인 오브젝트나 DTO의 프로퍼티에 요청 파라미터를 바인딩해서 한번에 받으면 @ModelAttribute 라고 볼 수 있다.
		//@ModelAttribute는 컨트롤러가 리턴하는 모델에 파라미터로 전달한 오브젝트를 자동으로 추가해준다.
		
		
		//로그인 여부를 체크하기 위해 세션에 저장된 아이디 확인
		String userid=(String)session.getAttribute("userid");
		if(userid==null) { //로그인하지 않은 상태이면 로그인 화면으로 이동
			return "redirect:/member/login.do";
		}
		dto.setUserid(userid);
		cartService.insert(dto); //장바구니 테이블에 저장됨
		return "redirect:/shop/cart/list.do"; //장바구니 목록으로 이동
	}
	
	//cart_list페이지와 맵핑되는 메소드
	@RequestMapping("list.do")
	public ModelAndView list(HttpSession session, ModelAndView mav) {
		Map<String, Object> map=new HashMap<>();
		String userid=(String)session.getAttribute("userid");
		if(userid!=null) { //로그인한 상태
			List<CartDTO> list=cartService.listCart(userid);//장바구니 목록
			int sumMoney=cartService.sumMoney(userid);//금액 합계
			int fee=sumMoney >= 30000 ? 0 : 2500; //배송료 계산
			map.put("sumMoney", sumMoney);
			map.put("fee", fee); //배송료
			map.put("sum", sumMoney+fee); //전체 금액
			map.put("list", list); //장바구니 목록
			map.put("count", list.size()); //레코드 갯수
			mav.setViewName("shop/cart_list"); //이동할 페이지의 이름
			mav.addObject("map", map); //데이터 저장
			return mav; //화면 이동
		}else { //로그인하지 않은 상태
			return new ModelAndView("member/login", "", null);
		}
	}
	
	//cart_list에서 보내는 변수랑 이 메소드로 받는 @RequestParam 변수가 같아야 한다.
	//한꺼번에 받을때는 modelAttribute로 받으면 된다.
	@RequestMapping("delete.do")
	public String delete(@RequestParam int cart_id) {
		cartService.delete(cart_id);
		//Service로 넘긴다
		return "redirect:/shop/cart/list.do";
	}
	
	@RequestMapping("deleteAll.do")
	public String deleteAll(HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		if(userid!=null) {
			cartService.deleteAll(userid);
		}
		return "redirect:/shop/cart/list.do";
	}
	
	@RequestMapping("update.do")
	public String update(
			int[] amount, int[] cart_id, HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		for(int i=0; i<cart_id.length; i++) {
			if(amount[i]==0) {
				cartService.delete(cart_id[i]);
			}else {
				CartDTO dto=new CartDTO();
				dto.setUserid(userid);
				dto.setCart_id(cart_id[i]);
				dto.setAmount(amount[i]);
				cartService.modifyCart(dto);
			}
		}
		return "redirect:/shop/cart/list.do";
	}
}





