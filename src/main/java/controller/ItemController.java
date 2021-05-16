package controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import logic.Item;
import logic.ShopService;

@Controller //@Component + Controller 기능
@RequestMapping("item") // item/xxx.shop
public class ItemController {
	@Autowired
	private ShopService service;
	
	
	@RequestMapping("imgupload")
	public String imgupload(MultipartFile upload, 
		String CKEditorFuncNum, HttpServletRequest request,
		Model model) {
		//upload : 업로드된 이미지 정보 저장. 이미지 파일.
		String path=request.getServletContext().getRealPath("/")
				+ "board/imgfile/";
		File f = new File(path);
		if(!f.exists()) f.mkdirs();
		if(!upload.isEmpty()) {
			File file = //업로드될 파일을 저장할 File 객체 지정
					new File(path, upload.getOriginalFilename());
			try {
				upload.transferTo(file); //업로드 파일 생성
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		String fileName = "/sjhp/board/imgfile/"
		           +upload.getOriginalFilename();
		model.addAttribute("fileName", fileName);
		model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
		return "ckedit";  
	}
	
	@RequestMapping("list") //   item/list.shop 요청
	public ModelAndView list(Integer pageNum, String searchtype, String searchcontent) {
		//itemList : item 테이블의 모든 레코드와 모든 컬럼 정보를 저장	
		ModelAndView mav = new ModelAndView();// 뷰 : item/list
		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		if(searchtype != null && searchtype.trim().equals("")) 
			searchtype = null;
		if(searchcontent != null && searchcontent.trim().equals("")) 
			searchcontent = null;
		if(searchtype == null || searchcontent == null) {
			searchtype = null;
			searchcontent = null;
		}
		int limit = 8;
		int listcount = service.itemcount(searchtype,searchcontent);
		
		List<Item> itemList = service.getItemList(pageNum,limit,searchtype,searchcontent);
		
		// 최대 페이지
		int maxpage = (int)((double)listcount/limit + 0.95);
		// 보여지는 첫번째 페이지
		int startpage = (int)((pageNum/ 10.0 + 0.9) - 1) * 10 + 1;
		// 보여지는 마지막 페이지
		int endpage = startpage + 9;
		if(endpage > maxpage) endpage = maxpage;
		//화면에 출력되는 게시물 번호. 순서
		int itemno = listcount - (pageNum - 1) * limit;
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("listcount", listcount);
		mav.addObject("itemList", itemList);
		mav.addObject("itemno", itemno);
		return mav;  //  /WEB-INF/view/item/list.jsp
	}
	@RequestMapping("create")
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView("item/add");
		mav.addObject(new Item());
		return mav;
	}
	@RequestMapping("register")
	public ModelAndView register
	(@Valid Item item, BindingResult bresult, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("item/add");
		
		service.itemCreate(item,request);
		mav.setViewName("redirect:/item/list.do");
		return mav;
	}
	@PostMapping("update")
	public ModelAndView update	(@Valid Item item, 
			BindingResult bresult,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("item/edit");
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		service.itemUpdate(item,request);
		mav.setViewName("redirect:/item/list.do");
		return mav;
	}
	
	@GetMapping("*")  //그외 GET 방식 요청시 호출되는 메서드
	public ModelAndView itemSelect(String id) {
		Item item = service.getItem(id);
		ModelAndView mav = new ModelAndView();
		mav.addObject("item",item);
		return mav;
	}
	@GetMapping("delete")
	public ModelAndView itemDelete(String id) {
		ModelAndView mav = new ModelAndView();
		service.itemDelete(id);
		mav.setViewName("redirect:/item/list.shop");
		return mav;		
	}	
}
