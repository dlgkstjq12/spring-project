package com.example.spring02.model.admin;

import com.example.spring02.model.member.dto.MemberDTO;

public interface AdminDAO {
	public String loginCheck(MemberDTO dto); //dto를 받아서 관리자 로그인을 체크하는 메소드
}
