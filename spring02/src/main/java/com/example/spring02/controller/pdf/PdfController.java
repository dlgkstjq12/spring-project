package com.example.spring02.controller.pdf;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring02.service.pdf.PdfService;

@Controller //컨트롤러 표시 어노테이션
@RequestMapping("/pdf/*")//공통주소를 맵핑

public class PdfController {
	
	@Inject
	PdfService pdfService;
	//서비스 객체를 사용하기 위해 의존성을 주입
	
	@RequestMapping("list.do") //View에서 맵핑 url 주소
	public ModelAndView list() throws Exception {
		String result = pdfService.createPdf(); //createPdf()메소드에서 pdf파일이 생성되었는지 결과가 result에 담긴다.
		return new ModelAndView("pdf/result","message",result); //그 결과가 message로 pdf/result페이지로 전송된다.
	}
}