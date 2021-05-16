package controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.LoginException;
import logic.Board;
import logic.Item;
import logic.Sale;
import logic.SaleItem;
import logic.ShopService;
import logic.User;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private ShopService service;

	
	@GetMapping("*")
	public String form(Model model) {
		model.addAttribute(new User());
		return null;
	}
	@PostMapping("login")
	public ModelAndView login(@Valid User user, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User dbUser = service.getUser(user.getUserid());
		if(bresult.hasErrors()) {
			bresult.reject("error.input.user");
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		
		try {
			
			 if(!dbUser.getPassword().equals(user.getPassword())) {
				bresult.reject("error.login.password");
			}else {
				session.setAttribute("loginUser",dbUser);
				mav.setViewName("redirect:../board/main.do");
			}
		} catch(LoginException e) {
			e.printStackTrace();
			bresult.reject("error.login.id");
		}
		return mav;
	}
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:../board/main.do";
	}
	
	@RequestMapping("mypage")
	public ModelAndView checkmypage(String id, String num, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<Board> list = service.getboardList(id,num);
		
		User user = service.getUser(id);
		
		List<Sale> salelist = service.salelist(id);
		for(Sale sa : salelist) { 
			List<SaleItem> saleitemlist =
					service.saleItemList(sa.getSaleid());
			for(SaleItem si : saleitemlist) {
				Item item = service.getItem(si.getItemid());
				si.setItem(item);
			}
			try {
				User saleuser = service.getUser(sa.getUserid());
				sa.setUser(saleuser);
			}catch (LoginException e) {}
			catch (Exception e) {
				e.printStackTrace();
			}
			sa.setItemList(saleitemlist);
		}
		
		int listcount = service.userboardcount(id);
		mav.addObject("list",list);
		mav.addObject("user",user);
		mav.addObject("listcount",listcount);
		mav.addObject("salelist", salelist);
		return mav;
	}
	
	@PostMapping("userEntry")
	public ModelAndView userEntry(@Valid User user,
			 BindingResult bresult) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			bresult.reject("error.input.user");
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			service.userInsert(user);
			mav.setViewName("redirect:/board/main.do");
		} catch(DataIntegrityViolationException e) {
			e.printStackTrace();
			bresult.reject("error.duplicate.user");
			mav.getModel().putAll(bresult.getModel());
		}
		return mav;
	}
	
	@RequestMapping("main") //UserLoginAspect 클래스에 해당하는 핵심로직
	public String checkmain(HttpSession session) {
		return "board/main";
	}
	/*
	 * AOP 설정하기
	 * 1. UserController의 check로 시작하는 메서드에 매개변수가
	 *    id, session 인 경우
	 *    -로그인 안된경우 : 로그인하세요. => login.do 페이지 이동
	 *    -admin이 아니면서, 다른 아이디 정보 조회시 . 본인정보만 조회가능 
	 *                   => main.do 페이지 이동
	 */

	@GetMapping(value= {"update","delete"})
	public ModelAndView checkview(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User user = service.getUser(id);
		mav.addObject("user",user);
		return mav;
	}
	@PostMapping("update")
	public ModelAndView checkupdate(@Valid User user, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();	 
		if(bresult.hasErrors()) {
			bresult.reject("error.input.user");
			return mav;
		}
		//비밀번호 검증 : 입력된 비밀번호와 db의 비밀번호를 비교
		// 일치: update
		//불일치 : 메세지를 유효성 검증을 통해서 화면에 출력
		
		User loginUser = (User)session.getAttribute("loginUser");
		if(!user.getPassword().equals(loginUser.getPassword())) {
			bresult.reject("error.login.password");
			return mav;
		}
		try {
			service.userUpdate(user);
			mav.setViewName
			   ("redirect:mypage.do?id="+user.getUserid());
			if(!loginUser.getUserid().equals("admin")) {
				session.setAttribute("loginUser", user);
			}
		} catch (Exception e) {
			e.printStackTrace();
			bresult.reject("error.user.update");
		}
		return mav;
	}
	@PostMapping("delete")
	public ModelAndView delete(String userid, String password, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User loginUser = (User)session.getAttribute("loginUser");
		
		if(!loginUser.getPassword().equals(password)) {
			throw new LoginException
			("비밀번호가 틀립니다.","delete.do?id="+userid);
		}
		try { 
			service.userDelete(userid);
			if(loginUser.getUserid().equals("admin")) {
				mav.setViewName("redirect:/admin/list.do");
			}else {
				session.invalidate();
				mav.addObject("msg",userid + "회원님. 탈퇴 되었습니다.");
				mav.addObject("url","login.do");
				mav.setViewName("alert");
			}
		}catch (Exception e) {
			e.printStackTrace();
			throw new LoginException
			("회원 탈퇴시 오류가 발생했습니다.","delete.do?id="+userid);
		}
		return mav;
	}

}