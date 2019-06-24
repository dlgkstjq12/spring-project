package com.example.spring02.service.chart;

import org.json.simple.JSONObject;
//json오브젝트는 pom.xml에 추가한 라이브러리 안에 들어있는 것들이다

public interface GoogleChartService {
	public JSONObject getChartData(); //json 타입으로 리턴
	
}
