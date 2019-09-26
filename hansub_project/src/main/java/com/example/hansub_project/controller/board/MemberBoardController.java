package com.example.hansub_project.controller.board;

import java.io.PrintWriter;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.hansub_project.Member_Pager;
import com.example.hansub_project.controller.member.MemberController;
import com.example.hansub_project.model.board.dto.MemberBoardDTO;
import com.example.hansub_project.model.board.dto.MemberBoardReplyDTO;
import com.example.hansub_project.model.member.dto.MemberDTO;
import com.example.hansub_project.service.board.MemberBoardService;
import com.example.hansub_project.service.member.MemberService;


@Controller	//게시판 관련 컨트롤러를 선언함
public class MemberBoardController {
	
	@Inject		//서비스를 호출하기위해서 의존성을 주입함
	MemberBoardService memberboardservice;
	
	@Inject		
	MemberService memberservice;
	
	//로깅을 위한 변수
		private static final Logger logger=
		LoggerFactory.getLogger(MemberBoardController.class);
	
	@RequestMapping("/board/list.do")	//세부적인 url mapping
	public ModelAndView list(//RequestParam으로 옵션, 키워드, 페이지의 기본값을 각각 설정해준다.
			
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="user_id") String search_option,
			@RequestParam(defaultValue="") String keyword

			)
			 throws Exception{
		
		//레코드 갯수를 계산
		int count = memberboardservice.countArticle(search_option, keyword);
		
		//페이지 관련 설정, 시작번호와 끝번호를 구해서 각각 변수에 저장한다.
		Member_Pager pager = new Member_Pager(count, curPage);
		int start = pager.getPageBegin();
		int end =  pager.getPageEnd();
		
		System.out.println(start);
		System.out.println(end);
		
		List<MemberBoardDTO> list = memberboardservice.listAll(search_option, keyword, start, end);
		
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map = new HashMap<>();	//넘길 데이터가 많기 때문에 해쉬맵에 저장한 후에 modelandview로 값을 넣고 페이지를 지정
		
		map.put("list", list); 						//map에 list(게시글 목록)을 list라는 이름의 변수로 자료를 저장함.
		map.put("pager", pager);
		map.put("count", count);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
	
		mav.addObject("map", map);					//modelandview에 map를 저장
		
		
		System.out.println("map : "+map);
		mav.setViewName("board/memberboard");				//자료를 넘길 뷰의 이름
		
		return mav;	//게시판 페이지로 이동
	
	}
	
	
	@RequestMapping("/board/best_list.do")	//세부적인 url mapping
	public ModelAndView best_list(//RequestParam으로 옵션, 키워드, 페이지의 기본값을 각각 설정해준다.
			)
			 throws Exception{
		
		List<MemberBoardDTO> list = memberboardservice.bestlistAll();
		
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map = new HashMap<>();	//넘길 데이터가 많기 때문에 해쉬맵에 저장한 후에 modelandview로 값을 넣고 페이지를 지정
		
		map.put("list", list); 						//map에 list(게시글 목록)을 list라는 이름의 변수로 자료를 저장함.
	
		mav.addObject("map", map);					//modelandview에 map를 저장
		
		mav.setViewName("board/bestboard");				//자료를 넘길 뷰의 이름
		
		return mav;	//게시판 페이지로 이동
	
		
	}
	
	
	//글쓰기 버튼을 눌렀을때 뷰에서 맵핑되는 메소드
	@RequestMapping("/board/write.do")
		public String write(HttpSession session, HttpServletResponse write) throws Exception{
		//글쓰기 폼 페이지로 이동함
		
		if (session.getAttribute("user_id") != null) {
			
			String user_id = (String)session.getAttribute("user_id");
			
			}

			//소셜 로그인이 되어있을 경우에 실행되는 구문 유저의 아이디를 dto에 저장한다.
			else if (session.getAttribute("navername") != null) {
				
				String user_id = (String)session.getAttribute("navername");
				
			}
			
			else if (session.getAttribute("kakaonickname") != null) {
				
				String user_id = (String)session.getAttribute("kakaonickname");
				
				
			}
			
			
			else if (session.getAttribute("facebookname") != null) {
				
				String user_id = (String)session.getAttribute("facebookname");
		
			}else
		
		if (session.getAttribute("user_id") == null && session.getAttribute("navername") == null && session.getAttribute("kakaonickname") == null && session.getAttribute("facebookname") == null ) {
			
			write.setContentType("text/html; charset=UTF-8");
            PrintWriter out_write = write.getWriter();
            out_write.println("<script>alert('로그인이 되어있지 않습니다. 로그인을 먼저 해주세요.');</script>");
            out_write.flush();
			
            return "home";
            
		} 
		
		return "board/memberboardwrite";	//글쓰기 폼으로 이동함
	}
	
	//write.jsp에서 입력한 내용들이 MemberBoardDTO에 저장됨
	@RequestMapping("/board/insert.do")
	public String insert (@ModelAttribute MemberBoardDTO dto, HttpSession session, HttpServletResponse insert) throws Exception{
		
		//로그인한 사용자의 아이디를 체크
		
		if (session.getAttribute("user_id") != null) {
		
		String user_id = (String)session.getAttribute("user_id");
		
		dto.setUser_id(user_id);
		
		}
		
		//소셜 로그인이 되어있을 경우에 실행되는 구문 유저의 아이디를 dto에 저장한다.
		else if (session.getAttribute("navername") != null) {
			
			String user_id = (String)session.getAttribute("navername");
			
			dto.setUser_id(user_id);
			
		}
		
		else if (session.getAttribute("kakaonickname") != null) {
			
			String user_id = (String)session.getAttribute("kakaonickname");
			
			dto.setUser_id(user_id);
			
		}
		
		
		else if (session.getAttribute("facebookname") != null) {
			
			String user_id = (String)session.getAttribute("facebookname");
			
			dto.setUser_id(user_id);
			
		}
		
		
		insert.setContentType("text/html; charset=UTF-8");
        PrintWriter out_write = insert.getWriter();
        out_write.println("<script>alert('글이 작성되었습니다.');</script>");
        out_write.flush();
        
        
        	//레코드를 저장함
      		memberboardservice.create(dto);
		
		
		//게시물을 저장한 후에 게시물 목록페이지로 다시 이동함
		return "forward:/board/list.do";
		}
	
	//일반 게시판 게시물 세부 내용 확인
	@RequestMapping(value = "/board/view.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView view(@RequestParam int member_bno,
			@RequestParam int curPage,
	        @RequestParam String search_option,
	        @RequestParam String keyword,
	        HttpSession session) throws Exception{
		
		//조회수 증가 쿼리
		memberboardservice.increaseViewcnt(member_bno, session);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/memberboardview");
		
		//view로 자료를 넘기기위해서 mav에 값들을 저장해서 view.jsp로 리턴시킨다.
		mav.addObject("dto", memberboardservice.read(member_bno)); //상세보기를 한번 클릭하면 조회수를 1증가시킨다.
		mav.addObject("curPage", curPage);
		mav.addObject("search_option", search_option);
		mav.addObject("keyword", keyword);
		
		return mav; 	//view로 넘어가서 출력이 된다.
	}
	
	
	
	//베스트 게시판 게시물 세부 내용 확인
	@RequestMapping(value = "/board/best_board_view", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView best_board_view(@RequestParam int member_bno, HttpSession session) throws Exception{
		
		//조회수 증가 쿼리
		memberboardservice.increaseViewcnt(member_bno, session);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/bestboardview");
		
		//view로 자료를 넘기기위해서 mav에 값들을 저장해서 view.jsp로 리턴시킨다.
		mav.addObject("dto", memberboardservice.read(member_bno)); //상세보기를 한번 클릭하면 조회수를 1증가시킨다.
		
		return mav; 	//view로 넘어가서 출력이 된다.
	}
	
	
	
	
	//게시물 삭제 관련 메소드
	@RequestMapping("/board/delete.do")
	public String delete (int member_bno) throws Exception{
		memberboardservice.delete(member_bno);	//삭제 처리
		return "forward:/board/list.do";	//게시물 삭제후 게시물 리스트페이지로 이동함
	
	}
	
	
	//게시물 수정 관련 메소드
	@RequestMapping("/board/update.do")
	public String update (MemberBoardDTO dto) throws Exception{
		
		memberboardservice.update(dto);	//게시글 수정 처리
		return "forward:/board/list.do";	//게시글 수정후 게시물 리스트 페이지로 이동함
	}
	
	
	//게시물 추천 관련 메소드
	@RequestMapping("/board/recommend.do")
	public String recommend (@RequestParam int member_bno) throws Exception {
		
		memberboardservice.recommend(member_bno);
		
		
		
		return "forward:/board/list.do";
	}
	
	
	
	//게시판 로그아웃 메소드
			@RequestMapping("/board/logout.do")
			public String board_logout(HttpSession session, HttpServletRequest request) {
						
				//세션에 담긴값 초기화
				session.invalidate();
						
				return "home";
			}
			
	
			  
			//네이버 관련 로그아웃 메소드
			@RequestMapping("/board/naver_logout.do")
			public String naver_logout(HttpSession session, HttpServletRequest request) {
				
				//세션에 담긴값 초기화
				session.invalidate();
				
				return "home";
			}
			
			
				//카카오톡 관련 로그아웃 메소드
				@RequestMapping("/board/kakao_logout.do")
				public String kakao_logout(HttpSession session, HttpServletRequest request) {
					
					//세션에 담긴값 초기화
					session.invalidate();
					
					return "home";
				}
				
				
				//페이스북 관련 로그아웃 메소드
				@RequestMapping("/board/facebook_logout.do")
				public String facebook_logout(HttpSession session, HttpServletRequest request) {
					
				//세션에 담긴값 초기화
				session.invalidate();
				
							
				return "home";
			}
				
				
	
				//로그인을 체크하는 메소드 (로그인이 성공하면 로그인 결과 페이지로 이동하고, 실패하면 다시 로그인 페이지로 이동한다.)
				  @RequestMapping("/board/normale_login.do") public ModelAndView login (String user_id, String
				  member_pass, HttpSession session) throws Exception{
				  
					  //로그인 체크를 위해 id와 비밀번호를 dto에 저장
				  MemberDTO dto = new MemberDTO(); 
				  dto.setUser_id(user_id);
				  dto.setMember_pass(member_pass); 
				  
				  
				  boolean result = memberservice.loginCheck(dto, session); 
				  ModelAndView mav = new ModelAndView();
				  
				  if(result) { //로그인 성공 (result값이 참일때 실행되는 구문) 
				  mav.setViewName("home");//뷰의이름
				  mav.addObject("user_id", session.getAttribute(user_id));
				  
				  }else if(session.getAttribute(user_id)==null) { //로그인 실패
				  mav.setViewName("member/login"); 
				  //뷰에 전달할 값 
				 
				  mav.addObject("message","회원가입된 회원의 아이디 혹은 비밀번호가 일치하지 않습니다."); 
				  } 
				  	return mav; 
				}
				  
				  
				//회원아이디로 해당 회원의 정보를 검색하는 메소드
					@RequestMapping(value = "/board/member_profile.do")
					public ModelAndView member_profile(HttpSession session, Date join_date, MemberDTO dto) throws Exception{
						
						//세션에 저장되어 있는 회원의 아이디를 변수에 저장함
						String user_id =(String)session.getAttribute("user_id");
						
						//데이터베이스에서 검색한 값들을 DTO타입에 LIST에 저장한다.
						java.util.List<MemberDTO> list = memberservice.member_profile(user_id);
						
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
							
							mv.setViewName("member/member_profile");
							
						}
						
						return mv;
					}
					
					//회원의 아이디로 회원 프로필을 출력하는 메소드 (네이버)
					@RequestMapping(value = "/board/naver_member_profile.do")
					public ModelAndView naver_member_profile(HttpSession session, Date join_date, MemberDTO dto) throws Exception{
						
						
						//세션에 저장되어 있는 회원의 아이디를 변수에 저장함
						String user_id =(String)session.getAttribute("navername");
						
						//데이터베이스에서 검색한 값들을 DTO타입에 LIST에 저장한다.
						java.util.List<MemberDTO> list = memberservice.member_profile(user_id);
						
						Map<String,Object> map = new HashMap<>();
						
						//map에 리스트를 저장해서 출력할 view로 이동시킨다.
						
						//list가 null이면 회원정보가 없는것이므로 경고창을 출력하도록 함
						
						ModelAndView mv = new ModelAndView();
						
						//if문에서 list null처리를 할때에는 isEmpty()를 사용해서 null체크후 처리를 해주어야 한다.
						//list안에 값이 들어있을때 실행되는 구문
							
							//join_date의 형식을 바꾸어야 하기 때문에 join_date만 따로 빼서 형식을 변경한 후에 따로 넘긴다.
							for (int i = 0; i<list.size(); i++) {
								
								join_date = list.get(i).getJoin_date();
								
							}
							
							String re_join_date = new SimpleDateFormat("yyyy-MM-dd").format(join_date);
							
							map.put("re_join_date", re_join_date);
							
							map.put("list", list);
							
							mv.addObject("map",map);
							
							mv.setViewName("member/member_profile");
							

						return mv;
					}
					
					
						//회원의 아이디로 회원 프로필을 출력하는 메소드 (카카오톡)
						@RequestMapping(value = "/board/kakao_member_profile.do")
						public ModelAndView kakao_member_profile(HttpSession session, Date join_date, MemberDTO dto) throws Exception{
								
								
							//세션에 저장되어 있는 회원의 아이디를 변수에 저장함
							String user_id =(String)session.getAttribute("kakaonickname");
								
							//데이터베이스에서 검색한 값들을 DTO타입에 LIST에 저장한다.
							java.util.List<MemberDTO> list = memberservice.member_profile(user_id);
								
							Map<String,Object> map = new HashMap<>();
								
							//map에 리스트를 저장해서 출력할 view로 이동시킨다.
								
							//list가 null이면 회원정보가 없는것이므로 경고창을 출력하도록 함
								
							ModelAndView mv = new ModelAndView();
								
								//if문에서 list null처리를 할때에는 isEmpty()를 사용해서 null체크후 처리를 해주어야 한다.
								//list안에 값이 들어있을때 실행되는 구문
									
									//join_date의 형식을 바꾸어야 하기 때문에 join_date만 따로 빼서 형식을 변경한 후에 따로 넘긴다.
									for (int i = 0; i<list.size(); i++) {
										
										join_date = list.get(i).getJoin_date();
										
									}
									
									String re_join_date = new SimpleDateFormat("yyyy-MM-dd").format(join_date);
									
									map.put("re_join_date", re_join_date);
									
									map.put("list", list);
									
									mv.addObject("map",map);
									
									mv.setViewName("member/member_profile");
									

								return mv;
							}
						
						
						//회원의 아이디로 회원 프로필을 출력하는 메소드 (페이스북)
						@RequestMapping(value = "/board/facebook_member_profile.do")
						public ModelAndView facebook_member_profile(HttpSession session, Date join_date, MemberDTO dto) throws Exception{
								
								
							//세션에 저장되어 있는 회원의 아이디를 변수에 저장함
							String user_id =(String)session.getAttribute("facebookname");
								
							//데이터베이스에서 검색한 값들을 DTO타입에 LIST에 저장한다.
							java.util.List<MemberDTO> list = memberservice.member_profile(user_id);
								
							Map<String,Object> map = new HashMap<>();
								
							//map에 리스트를 저장해서 출력할 view로 이동시킨다.
								
							//list가 null이면 회원정보가 없는것이므로 경고창을 출력하도록 함
								
							ModelAndView mv = new ModelAndView();
								
								//if문에서 list null처리를 할때에는 isEmpty()를 사용해서 null체크후 처리를 해주어야 한다.
								//list안에 값이 들어있을때 실행되는 구문
									
									//join_date의 형식을 바꾸어야 하기 때문에 join_date만 따로 빼서 형식을 변경한 후에 따로 넘긴다.
									for (int i = 0; i<list.size(); i++) {
										
										join_date = list.get(i).getJoin_date();
										
									}
									
									String re_join_date = new SimpleDateFormat("yyyy-MM-dd").format(join_date);
									
									map.put("re_join_date", re_join_date);
									
									map.put("list", list);
									
									mv.addObject("map",map);
									
									mv.setViewName("member/member_profile");
									

								return mv;
							}
	
}
