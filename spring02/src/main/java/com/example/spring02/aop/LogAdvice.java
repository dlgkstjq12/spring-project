package com.example.spring02.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import com.itextpdf.text.log.LoggerFactory;

import ch.qos.logback.classic.Logger;

//@Controller @Service @Repository

@Component	//스프링에서 관리하는 bean, aop는 위의 3개에 속하지 않기때문에 컴포넌트 어노테이션을 사용
@Aspect //스프링에서 관리하는 aop bean, aop를 사용하기 위해서는 2개의 어노테이션이 다 있어야 한다.
public class LogAdvice {
	
	private static final Logger logger
		= LoggerFactory.getLogger(LogAdvice.class);
	
	
	
//=============================중요==================================
	
	//포인트컷 - 실행시점, Around - 실행 전후
		//Before, After, Around (어떤 요청이 오기 전에 실행될지, 후에 실행될지, 전후에 실행될지...)
		//컨트롤러, 서비스, dao의 모든 method 실행 전후에 logPring method가 호출됨
		//execution (리턴자료형 class.method(매개변수))
	
	
	//@Around( Around를 포인트 컷이라 한다. (언제 어느곳에서 실행될지 정함),
	//지금은 요청전에 실행하는걸로 정함
	
	
	//"execution(* com.example.spring02.controller..*Controller.*(..))" 
	// .이 2개 있는것은 하위패키지가 다 들어갈 수 있다는 의미, . 1개는 직속 디렉토리
	//즉, Controller로 끝나는 모든 메소드들을 말한다.
	// 밑에있는 코드는 Controller의 모든 메소드를 호출하면 실행되는 공통적인 코드이다.
	
	
	//+ " or execution(* com.example.spring02.service..*Impl.*(..))"
	// 마찬가지로 밑에있는 코드를 service.Impl에 있는 모든 메소드를 호출하면 실행되는 
	//공통적인 코드로 실행 시키고 싶을때 사용. 
	
	
	//+ " or execution(* com.example.spring02.model..dao.*Impl.*(..))")
	// 마찬가지로 밑에있는 코드를 dao.Impl에 있는 모든 메소드를 호출하면 실행되는 
		//공통적인 코드로 실행 시키고 싶을때 사용. 
	
//===================================================================	
	
	
	//모든 코드에서 로그를 출력하는 메소드
		public Object logPrint(ProceedingJoinPoint joinPoint)
			throws Throwable {
		long start = System.currentTimeMillis(); //시작할때의 현재시간을 start 변수에 저장
		
		//==========호출전===========================================
		
		Object result = joinPoint.proceed(); 
		// joinPoint.proceed(); 메소드를 호출해서 프록시 패턴을 result변수에 저장.
		// 즉 공통적인부분 (로그를 출력하는 부분)을 묶에서 result에 저장한다는 뜻.
		
		//만약 컨트롤러에서 login.check메소드가 호출한다고 가정했을때
		//호출되기 전에 먼저 위쪽에 있는 logPrint메소드가 먼저 실행되고,
		//login.check메소드가 다 실행되고 난 후 (호출후에는) 밑에 있는 부분이 실행이된다.
		//그러니까 Object result = joinPoint.proceed(); 를 기준으로 
		//'호출전' 과 '호출후' 로 나뉘어진다.
		
		//==========호출후===========================================
		//class name (호출한 클래스의 이름) 컨트롤러, 서비스, DAO인지 if문으로 판별해서 실행
		String type =
	joinPoint.getSignature().getDeclaringTypeName(); 
		
		// JoinPoint를 선언하고 있는 타입의 이름을 반환해서 그 값을 Signature객체를 반환할때 매개값으로 쓴다.
		// 
		
		
		String name = "";  //null값이면 오류가 발생하기 때문에 초기값을 공백으로 지정
		
		if (type.indexOf("Controller") > -1 ) {
			name = "Controller \t: ";
		} else if (type.indexOf("Service") > -1) {
			name = "ServiceImpl \t: ";
		} else if (type.indexOf("DAO") > -1) {
			name = "DAOImpl \t: ";
		}
		
		//method name (메소드를 호출할때 로그가 찍히게 된다)
		logger.info(
				name + type + "." + joinPoint.getSignature().getName()+"()");
		
		//매개변수 (마찬가지로 매개변수를 사용할때 로그가 찍히게 된다.)
		logger.info(Arrays.toString(joinPoint.getArgs()));
		
		//핵심로직으로 이동
		long end = System.currentTimeMillis(); //끝날때의 현재시간을 end에 저장
		long time = end-start; //끝난시간에서 시작한시간을 빼면 실행시간을 계산할 수 있다.
		logger.info("실행시간:"+time);
		return result; //결과를 반환한다.
		}
}
