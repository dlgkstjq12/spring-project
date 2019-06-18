package com.example.spring02.service.admin;

import com.example.spring02.model.member.dto.MemberDTO;

public interface AdminService {
	public String loginCheck(MemberDTO dto); //dto에 저장되어있는 정보를 받아 로그인을 체크하는 메소드
}