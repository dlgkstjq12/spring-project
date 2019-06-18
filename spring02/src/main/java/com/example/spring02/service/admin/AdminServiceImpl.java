package com.example.spring02.service.admin;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.spring02.model.admin.AdminDAO;
import com.example.spring02.model.member.dto.MemberDTO;

@Service
//service이므로 service어노테이션을 사용함
public class AdminServiceImpl implements AdminService {

	@Inject
	AdminDAO adminDao;
	//dao를 호출해야하므로 inject로 의존성을 주입하고 사용
	
	@Override
	public String loginCheck(MemberDTO dto) {
		return adminDao.loginCheck(dto);
		//dto에서 정보를 받고 dao에 리턴한다.
	}
}