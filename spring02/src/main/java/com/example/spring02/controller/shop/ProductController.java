package com.example.spring02.controller.shop;

import java.io.File;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring02.model.shop.dto.ProductDTO;
import com.example.spring02.service.shop.ProductService;

@Controller //현재 클래스를 스프링에서 관리하는 Controller Bean으로 설정
@RequestMapping("/shop/product/*") //공통적인 url mapping
public class ProductController {

	@Inject //의존관계 주입(DI)
	ProductService productService; //스프링에서 만든 서비스 객체를 연결시킴 
	
	@RequestMapping("list.do") //세부적인 url mapping
	public ModelAndView list(ModelAndView mav) {
		mav.setViewName("/shop/product_list"); //이동할 페이지 이름
		mav.addObject("list", productService.listProduct());//데이터저장
		return mav; //페이지 이동 
	}
	
	@RequestMapping("/detail/{product_id}")
	public ModelAndView detail(
			@PathVariable("product_id") int product_id,
			ModelAndView mav) {
		mav.setViewName("/shop/product_detail");
		mav.addObject("dto", productService.detailProduct(product_id));
		return mav;
	}
	
	
	//상품을 추가하는 메소드
	@RequestMapping("write.do")
	public String write() {
		return "shop/product_write";
	}
	
	//관리자 페이지에서 맵핑된 메소드
	//첨부파일을 추가하는 메소드 (그러니까 과일의 사진을 추가)
	@RequestMapping("insert.do")
	public String insert(ProductDTO dto) {
		String filename="-";
		if(!dto.getFile1().isEmpty()) { //첨부파일이 존재하면 (isEmpty()는 빈공간이라는 뜻인데 !가 붙었으므로 첨부파일이 존재하면..이라는 뜻)
			filename=dto.getFile1().getOriginalFilename(); //dto에 저장된 서버상에 업로드된 파일명을 반환해서 filename변수에 저장한다.
			String path="D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\spring02\\WEB-INF\\views\\images\\"; //이미지 파일이 저장된 경로를 지정
			//개발디렉토리가 아니라 곧바로 배포디렉토리로 설정하였다.
			//개발디렉토리에서 앞부분을 자르고, 그 부분에 배포디렉토리를 붙여넣으면 된다.
			//이렇게 하지 않으면 이미지를 추가했을때 개발 디렉토리와 배포 디렉토리가 다르기 때문에 일일히 새로고침을 해주어야 했지만
	
			
			//파일업로드시에는 예외처리를 해주어야 한다.
			try {
				new File(path).mkdir(); //새로운 파일의 경로를 생성하고 해당 경로에 폴더를 만든다.
				dto.getFile1().transferTo(new File(path+filename));  //생성한 디렉터리에 파일을 저장한다. (dto에 저장한다는 뜻)
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		dto.setPicture_url(filename); //첨부파일을 dto에 저장
		productService.insertProduct(dto); //서비스에 dto에 있는 과일 이미지 사진을 저장함
		return "redirect:/shop/product/list.do"; //파일이 첨부되면 list페이지로 되돌아간다.
	}
	
	//상품정보 편집 페이지로 이동하고 데이터를 보내주도록하는 메소드
	//상품의 아이디를 맵핑해서..
	@RequestMapping("/edit/{product_id}")
	public ModelAndView edit(@PathVariable("product_id") int product_id, ModelAndView mav) 
	{	
		//다른페이지에서  pathvariable로 받은 product_id를 product_id에 저장하고,
		//데이터를 보내고, 페이지를 이동하기위해서 ModelAndView 타입을 사용한다.
		
		mav.setViewName("/shop/product_edit"); //이동할 페이지의 이름
		//전달할 데이터를 저장
		mav.addObject("dto", productService.detailProduct(product_id)); //서비스로부터 상품 id(번호)를 받아와서 mav에 저장
		return mav; //페이지 이동
		
	}
	
	//상품의 정보를 수정 (갱신) 할때 View에서 맵핑되는 메소드
	@RequestMapping("update.do")
	public String update(ProductDTO dto) {
		String filename = "-"; //첨부파일에 null값이 초기값이면 오류가 발생하기 때문에 초기값을 "-" (하이픈)을 붙여주었다.
		
		if(!dto.getFile1().isEmpty()) { //첨부파일이 존재하면
			filename = dto.getFile1().getOriginalFilename();//dto에 저장된 서버상에 업로드된 파일명을 반환해서 filename변수에 저장한다.
			String path="D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\spring02\\WEB-INF\\views\\images\\"; 
			//이미지 파일이 저장된 경로를 지정
			
			try {
				new File(path).mkdir(); //새로운 파일의 경로를 생성하고 해당 경로에 폴더를 만든다.
				dto.getFile1().transferTo(new File(path+filename)); //지정된 디렉토리로 카피하는 명령어
			} catch (Exception e) { 	//생성한 디렉터리에 파일을 저장한다. (dto에 저장한다는 뜻)
				e.printStackTrace();
			}
			dto.setPicture_url(filename); //이미지의 경로
		}else {
			//새로운 첨부파일이 올라가지않고 기존에 있는 정보를 그대로 써야하는 경우
			//기존의 정보를 가져와서 dto2변수에 넣고, dto에 있는 이미지 업로드 메소드 (setPicture_url)에 dto2가 가지고 있는 Picture_url주소를 저장한다.
			ProductDTO dto2= productService.detailProduct(dto.getProduct_id());
			dto.setPicture_url(dto2.getPicture_url());
		}
		
		productService.updateProduct(dto); //서비스에 update메소드에 dto에서 받은 자료를 저장
		return "redirect:/shop/product/list.do"; //자료를 저장한 후에 list 페이지로 redirect (이동)한다.
	}
	
	
	//상품 정보를 삭제할때 뷰 (product_edit.jsp)페이지와 매핑되는 메소드
	//상품 정보를 삭제할때는 그 정보 안에 담긴 이미지도 같이 삭제 해야 한다.
	@RequestMapping("delete.do")
	public String delete(@RequestParam int product_id) {     //RequestParam 어노테이션을 사용해서 상품의 id를 받아온다.
		String filename=productService.fileInfo(product_id); //fileaname변수에 파일을 삭제하기위해 서비스에서 상품의 id를 매개변수로 삼아 서비스에 저장한후 filename 변수에 저장
		if(filename != null && !filename.equals("-")) { //filename이 null값이 아니거나, filename안에 들어있는것이 아닌 것이 "-"와 같으면, (그러니까 filename에 값이 담겨있을 경우!!!!!)
			String path="D:\\work\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\spring02\\WEB-INF\\views\\images\\";
			//상품에 담겨있는 이미지도 같이 삭제해야하기 때문에 이미지 경로를 지정
			
			File f = new File(path+filename); //이미지 파일을 삭제하기 위해 (파일의 객체 (경로와 파일이 담겨있음)을 생성하고 변수 f에 저장)
			
			if(f.exists()) { 
				//exists()메소드는 유효성을 검사하는 메소드, 그러니까 값이 존재하는지 안하는지 판단하는 메소드이다.
				//f안에 이미지 파일과 경로가 존재한다면, delete()메소드로 변수 f안에 있는 이미지파일과 경로를 제거 (즉 파일을 제거)
				f.delete();
			}
		}
		productService.deleteProduct(product_id); //최신화를 해주기위해 서비스에 아까 이미지를 삭제한 상품의 아이디를 저장한다.
		return "redirect:/shop/product/list.do"; //최신화 한 후에 list.jsp로 redirect한다.
				
	}
}











