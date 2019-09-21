package com.example.hansub_project.controller.admin;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.hansub_project.controller.member.MemberController;
import com.example.hansub_project.model.admin.dto.AdminDTO;
import com.example.hansub_project.model.member.dto.MemberDTO;
import com.example.hansub_project.service.admin.AdminService;
import com.example.hansub_project.service.member.MemberService;

import antlr.collections.List;


@Controller //관리자 관련 컨트롤러 빈 선언
public class AdminController {	//관리자 권한 관련 컨트롤러
	
	
	@Inject	//서비스를 호출하기 위해서 의존성을 주입
	AdminService adminservice;
	

	
	private static final Logger logger= 
	LoggerFactory.getLogger(MemberController.class);  //로깅을 위한 변수
		
		
	//메뉴 페이지에서 관리자 로그인 버튼을 클릭하면 맵핑되는 메소드
	//관리자 로그인 페이지로 이동시킨다.
	@RequestMapping("/admin/admin_login_view.do")
	public String admin_login_view() {
		
		return "admin/admin_login";
	}
	
	
	//관리자 로그인 페이지에서 관리자 아이디와 패스워드를 입력후 로그인 버튼을 누를시에 맵핑되는 메소드
	//관리자 로그인을 할 수 있도록 한다.
	@RequestMapping("/admin/admin_login.do")
	public ModelAndView admin_login(String admin_id, String admin_pass,HttpSession session) throws Exception	{
		
		//로그인 체크도 같이 함
		//dto에 값들을 넣기 위해 객체를 생성한다.
		AdminDTO dto = new AdminDTO();
		
		
		dto.setAdmin_id(admin_id);
		dto.setAdmin_pass(admin_pass);
		
		//로그인 체크를 하기위한 메소드, 로그인 체크후 결과를 result 변수에 넣는다.
		boolean result = adminservice.loginCheck(dto, session);
		ModelAndView mav = new ModelAndView();
		
		
		if(result)	{//로그인이 성공했을시 출력되는 구문
			mav.setViewName("home");	//로그인이 성공했을시 이동하게되는 뷰의 이름
			mav.addObject("admin_id", session.getAttribute(admin_id));
			
			}else if(session.getAttribute(admin_id) == null) {	//로그인 실패 했을시 출력
				
				//로그인이 실패했을 시에 다시 관리자 로그인 페이지로 이동함
				
				mav.setViewName("admin/admin_login");
				
				//뷰에 전달할 값
				
				mav.addObject("message", "관리자의 아이디 혹은 비밀번호가 일치하지 않습니다.");
			
			}
		
				return mav;
		}
	
	
	//관리자로 로그인 후에 회원을 강제 탈퇴시키는 페이지로 연결시키는 메소드
	@RequestMapping("/admin/admin_member_forced_eviction_view.do")
	public String admin_member_forced_evction_view() {
		
	
		return "admin/admin_member_forced_eviction_view";
	}
	
	
	//관리자로 로그인 후에 강제 탈퇴시킬 회원의 아이디를 입력후 강제탈퇴 버튼을 누르면 연결되는 메소드
	@RequestMapping("/admin/admin_member_forced_eviction.do")
	public ModelAndView admin_member_forced_eviction(String user_id) throws Exception {
		
		//유저의 아이디를 삭제 (강제탈퇴) 시키기위해서 dto에 담는다.
		MemberDTO dto = new MemberDTO();
		dto.setUser_id(user_id);
		
		//회원탈퇴 체크를 하기위한 메소드, 탈퇴 시키려는 회원의 아이디가 있는지 검사한후에 result 변수에 저장한다.
		adminservice.admin_member_forced_evictionCheck(dto);
		

		ModelAndView mav = new ModelAndView();
		
		if(dto.getUser_id() != null) {	//회원 강제탈퇴가 성공했을시 출력되는 뷰
			
			mav.setViewName("home");
			
			mav.addObject("message", "회원이 정상적으로 강제탈퇴 처리 되었습니다.");
			
		}else {
			
			mav.setViewName("admin/admin_member_forced_eviction_view");
			
			mav.addObject("message", "회원 목록에 없는 회원입니다. 다시 확인해주세요.");
		}
		
		
		return mav;
				
	}
	
	
	//관리자로 로그인한 후에 회원정보 버튼을 누르면 맵핑되는 메소드 회원정보 페이지로 이동시킨다.
	@RequestMapping(value = "/admin/admin_member_info.do")
	public String member_info() throws Exception {
	  
		return "admin/member_info";
	}
	
	
	//회원아이디로 해당 회원의 정보를 검색하는 메소드
	@RequestMapping(value = "/admin/find_member.do")
	public ModelAndView find_member_info(String user_id, MemberDTO dto, Date join_date) throws Exception{
		
		//데이터베이스에서 검색한 값들을 DTO타입에 LIST에 저장한다.
		java.util.List<MemberDTO> list = adminservice.find_member_info(user_id); 	//넘길 데이터가 많기 때문에		
		
		Map<String,Object> map = new HashMap<>();
		
		
		//map에 리스트를 저장해서 출력할 view로 이동시킨다.
		
		//list가 null이면 회원정보가 없는것이므로 경고창을 출력하도록 함
		
		ModelAndView mv = new ModelAndView();
		
		//if문에서 list null처리를 할때에는 isEmpty()를 사용해서 null체크후 처리를 해주어야 한다.
		//list안에 값이 들어있을때 실행되는 구문
		if(!list.isEmpty()) {
			
			//join_date의 형식을 바꾸어야 하기 때문에 join_date만 따로 빼서 형식을 변경한 후에 따로 넘긴다.
			for (int i = 0; i<list.size(); i++) {
				
				join_date = list.get(i).getJoin_date();
				
			}
			
			String re_join_date = new SimpleDateFormat("yyyy-MM-dd").format(join_date);
			
			map.put("re_join_date", re_join_date);
			
			map.put("list", list);
			
			mv.addObject("map",map);
			
			mv.setViewName("admin/member_info");
			
		}else {
			
			mv.addObject("message", "회원정보가 없는 회원입니다.");
			
			mv.setViewName("admin/member_info");
		}
		
		
		
		return mv;
	}
	
}
