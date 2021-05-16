package aop;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import exception.LoginException;
import logic.User;

@Component
@Aspect
@Order(1)
public class UserLoginAspect {
	@Around    //advice : 핵심로직 전 , 후
("execution(* controller.User*.check*(..)) && args(..,session)")
	//pointcut : 핵심로직 설정
	public Object userLoginCheck (ProceedingJoinPoint joinPoint,
			HttpSession session) throws Throwable {
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser == null) {
			throw new LoginException
			       ("1.로그인 해주세요","login.do");
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
	@Around    //advice : 핵심로직 전 , 후
("execution(* controller.User*.check*(..)) && args(id,session)")
	public Object userIdCheck (ProceedingJoinPoint joinPoint,
			String id, HttpSession session) throws Throwable {
		User loginUser = (User)session.getAttribute("loginUser");
		if(loginUser == null) {
			throw new LoginException
			       ("2.로그인 해주세요","login.do");
		}
		if(!loginUser.getUserid().equals("admin") &&
			!loginUser.getUserid().equals(id)) {
			throw new LoginException
		       ("본인 정보만 조회 가능합니다.","../board/main.do");
		}
		Object ret = joinPoint.proceed();
		return ret;
	}
}