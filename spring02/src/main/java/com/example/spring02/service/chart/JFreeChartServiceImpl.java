package com.example.spring02.service.chart;

import java.util.List;

import javax.inject.Inject;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.StandardChartTheme;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.springframework.stereotype.Service;

import com.example.spring02.model.shop.dao.CartDAO;
import com.example.spring02.model.shop.dto.CartDTO;
import com.itextpdf.text.Font;
import com.sun.prism.paint.Color;

@Service
public class JFreeChartServiceImpl implements JFreeChartService {

	@Inject
	CartDAO cartDao;
	//DAO를 호출하기 위해 의존성을 주입시킨다.
	
	
	@Override
	public JFreeChart createChart() {
		List<CartDTO> list = cartDao.cartMoney(); //Dao에 저장된 장바구니에 담은 금액을 리스트에 저장
		
		
		//파이 차트가 아닌경우
		//파이 차트일때와는 클래스가 틀리다.
		 DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		 for (CartDTO dto : list) {
			 dataset.setValue(dto.getMoney(), "과일", dto.getProduct_name());
			 //dataset.setValue(value, rowKey, columnKey); 형식으로 들어간다.
			 //금액, 과일, 상품이름이 들어간다.  (총 3개의 값이 들어감)
		 }
		 
		 
//파이 차트인 경우
//DefaultPieDataset dataset = new DefaultPieDataset();
//for (CartDTO dto : list) {
//dataset.setValue(dto.getProduct_name(), dto.getMoney());
		 //파이차트에는 x,y축이 없기 때문에 값이 2개만 들어간다.
		 //그러니까 rowKey값이 안들어간다.
//}
		 
		//dataset.setValue(value, rowKey, columnKey); 형식은 이렇게 되지만, 값이 2개만 들어감
		 
		 JFreeChart chart = null; //차트 객체 선언
		 String title = "장바구니 통계"; //장바구니 타이틀의 제목
		 try {
			 
//	선그래프
//	 chart = ChartFactory.createLineChart(
//	 title, "상품명" , "금액" , dataset,
//	 PlotOrientation.VERTICAL, true, true,
//	 false);
			 
//	라인 (선) 그래프에서는 이런 값들이 들어간다.
//	title, categoryAxisLabel, valueAxisLabel, dataset
		 		
			 
//막대 그래프
	chart = ChartFactory.createBarChart( //세로형식의 막대그래프를 만듦
			title, 
			"상품명", 
			"금액", 
			dataset,
			PlotOrientation.VERTICAL, //세로로 차트를 만든다는 의미
			true, true, false);
			 
	
//파이 차트
	//chart = ChartFactory.createPieChart(
			//title,  //chart title
			//dataset,	//data 
			//true, 		//include legend
			//true,
			//false);
	
	//제목, 타이틀의 폰트와 글씨크기를 설정
			chart.getTitle().setFont(
			new Font("돋움",Font.BOLD, 15));
	
	//범례, 범례의 폰트와 글씨크기를 설정
			chart.getLegend().setItemFont(
			new Font("돋움",Font.PLAIN, 10));
			
			Font font = new Font("돋움", Font.PLAIN,12);
			Color color = new Color(0,0,0);
			StandardChartTheme chartTheme =
	(StandardChartTheme) StandardChartTheme.createJFreeTheme(); //테마 설정
			
			
			chartTheme.setExtraLargeFont(font); //폰트 크기에 따라 테마를 다르게 설정 
			chartTheme.setLargeFont(font);
			chartTheme.setRegularFont(font);
			chartTheme.setSmallFont(font);
			
			
			chartTheme.setAxisLabelPaint(color); //축, 범례등의 색상을 변경
			chartTheme.setLegendItemPaint(color);
			chartTheme.setItemLabelPaint(color);
			chartTheme.apply(chart);
		
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		 
		 return chart;
	}

}
