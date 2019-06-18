package com.example.spring01.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.spring01.model.dto.MemberDTO;
import com.example.spring01.service.MemberService;

@Controller //현재 클래스를 Controller Bean으로 등록함
public class MemberController {
	private static final Logger logger=
			LoggerFactory.getLogger(MemberController.class);
	
	@Inject // MemberService 객체가 주입됨
	MemberService memberService;
	
	@RequestMapping("member/list.do") //사용자가 요청하는 주소
	public String memberList(Model model) {
		List<MemberDTO> list=memberService.memberList();
		logger.info("회원 목록:"+list);
		model.addAttribute("list",list); //모델에 저장 
		return "member/member_list"; //출력 페이지로 포워딩 
	} 
	
	@RequestMapping("member/write.do")
	public String write() {
		
		return "member/write";
	}
//폼에 입력한 데이터가 MemberDTO dto 변수에 저장됨 
//	request.getParameter 생략	
	//jsp에서는 form방식을 post방식으로 하면 getParamiter로 자료를 일일이 다 넘겨줬지만
	//스프링에서는 자료형 (DTO)를 적으면 dto에 자료가 자동적으로 쌓인다.
	//MemberDTO 폼에 적어넣은 변수명과 form에서 적은 변수명, 테이블의 변수명이 일치해야 사용할 수 있다.
	//dto는 폼에서 넘어온 데이터를 저장하는 변수이다.
	//@ModelAttribute이 붙으면 가독성이 향상되지만 안붙여도 된다.
	@RequestMapping("member/insert.do")
	public String insert(@ModelAttribute MemberDTO dto) {
		memberService.insertMember(dto);
		return "redirect:/member/list.do"; //목록을 갱싱해야하기 때문에 다시 리스트로 이동
											//redirect를 안붙이면 forward가 되기때문에 주소가 바뀌지 않는다.
	}
// view.do?userid=kim 이라면 
//	@RequestParam String userid 변수에 kim이 저장됨  	
	@RequestMapping("member/view.do")
	public String view(@RequestParam String userid, Model model) {
		model.addAttribute("dto", memberService.viewMember(userid));
		return "member/view"; // view.jsp로 포워딩 
	}
	
	@RequestMapping("member/update.do")
	public String update(@ModelAttribute MemberDTO dto,Model model){
		boolean result=memberService.checkPw(
				dto.getUserid(), dto.getPasswd());
		logger.info("비밀번호 확인:"+result);
		
		if(result) { //비밀번호가 맞으면
			memberService.updateMember(dto); //레코드 수정
			return "redirect:/member/list.do"; //목록으로 이동
		}else { //비밀번호가 틀리면
			MemberDTO dto2=memberService.viewMember(dto.getUserid());
			dto.setJoin_date(dto2.getJoin_date()); //날짜가 지워지지 않도록
			model.addAttribute("dto",dto);
			model.addAttribute("message", "비밀번호가 일치하지 않습니다.");
			return "member/view"; //수정 페이지로 되돌아감 
		}
	}
	
	@RequestMapping("member/delete.do")
	//아이디와 비밀번호를 DTO로 한번에 받을수도 있지만 한번에 받으면 에러가 날 수 있기 때문에
	//아이디와 비밀번호를 따로 받는다.
	public String delete(@RequestParam String userid, 
			@RequestParam String passwd, Model model) {
		//아이디와 패스워드를 checkPw로 맞는건지, 틀린건지 판별하고, 그 값을 result에 넣어준다.
		// 맞으면 삭제한후 리스트로 돌아가고 틀리면 비밀번호가 일치하지 않습니다. 창을 출력시키고, view로 돌아간다.
		boolean result=memberService.checkPw(userid, passwd);
		if(result) {
			memberService.deleteMember(userid);
			return "redirect:/member/list.do";
		}else {
			model.addAttribute("message","비밀번호가 일치하지 않습니다.");
			model.addAttribute("dto", memberService.viewMember(userid));
			return "member/view";
		}
	}
}