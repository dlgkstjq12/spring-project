package com.example.spring02.controller.chart;

import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring02.service.chart.GoogleChartService;

@RestController //json을 리턴하는 method가 있는 경우
@RequestMapping("/chart/*") //공통적인 맵핑 url
//일반적인 controller어노테이션을 jsp <=> controller을 연동할때 사용하지만
//RestController은 그 데이터 자체를 받아서 제이슨 형식으로 바꿔서 출력하고 싶을때 사용
//(지금은 json 형식으로 차트를 그릴것이기 때문에 Rest를 붙여서 컨트롤러를 선언한 것이다)
public class GoogleChartController {
	
	@RequestMapping("chart1.do") //view에서 맵핑되는 url
	public ModelAndView chart1() {
		return new ModelAndView("chart/chart01");
		//새로운 ModelAndView객체를 만들어서 chart/chart01페이지로 이동
	}
	
	//컨트롤러를 선언할때 controller 어노테이션을 사용하면 ResponseBody어노테이션을 붙여야 하고
	//컨틀롤러를 선언할때 RestController 어노테이션을 붙이면 ResponseBody어노테이션을 안붙여도 된다.
	
	
	@RequestMapping("chart2.do")
	public ModelAndView chart2() {
		return new ModelAndView("chart/chart02"); //json데이터를 호출한 곳으로 되돌려준다.
	}

	//@ResponseBody //화면으로 넘어가는 것이 아닌 데이터를 리턴하는 경우
	
	@RequestMapping("cart_money_list.do")
	public JSONObject cart_money_list() {
		return GoogleChartService.getChartData();
	}
	
	
}
