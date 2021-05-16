package controller;

import java.io.File;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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

import exception.BoardException;
import exception.LoginException;

import logic.Board;
import logic.Item;
import logic.Reply;
import logic.ShopService;
import logic.User;

@Controller
@RequestMapping("board")
public class BoardController {

	@Autowired
	private ShopService service;

	@RequestMapping("list")
	public ModelAndView list(HttpServletRequest request,Integer board_no, Integer pageNum, String searchtype,String searchcontent ) { 
		ModelAndView mav = new ModelAndView();
		
		if(pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		if(searchtype != null && searchtype.trim().equals(""))
			searchtype = null;
		if(searchcontent != null && searchcontent.trim().equals(""))
			searchcontent= null;
		if(searchtype == null || searchcontent == null) {
			searchcontent = null;
			searchtype = null;
		}
		int limit = 10;
		int listcount = service.boardcount(searchtype,searchcontent,board_no); 
		List<Board> boardlist = service.boardlist(board_no,pageNum,limit,searchtype, searchcontent);
		
		//
		int maxpage = (int)((double)listcount/limit + 0.95);
		// �������� ù��° ������
		int startpage = (int)((pageNum/10.0 + 0.9) - 1) * 10 + 1;
		// �������� ������ ������
		int endpage = startpage + 9;
		if(endpage > maxpage) endpage = maxpage;
		//ȭ�鿡 ��µǴ� �Խù� ��ȣ.
		int boardno = listcount - (pageNum - 1) * limit;
		mav.addObject("board_no", board_no);
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("listcount", listcount);
		mav.addObject("boardno", boardno);
		mav.addObject("boardlist", boardlist);
		return mav;
	}
	@GetMapping("*")
	public ModelAndView getBoard(Integer num, Integer rnum, HttpServletRequest request,Integer board_no) {
		ModelAndView mav = new ModelAndView();
		Board board = null;
		Reply reply = null;
		int rlistcount = service.replycount(num);
		List<Reply> replylist = service.replylist(num,board_no);
		if(num == null) {
			board = new Board();
		}else {
			board = service.getBoard(num, request);
		}
		if(rnum == null) {
			reply = new Reply();
		}else {
			reply = service.getReply(rnum, request);
		}
		mav.addObject("board", board);
		mav.addObject("reply", reply);
		mav.addObject("replylist", replylist);
		mav.addObject("rlistcount", rlistcount);
		return mav;
	}
	

	@PostMapping("write*")
	public ModelAndView write(@Valid Board board, BindingResult bresult, HttpServletRequest request, Integer board_no) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
	try {
		service.boardWrite(board,request);
		mav.setViewName("redirect:list.do?board_no="+ board_no);
	}catch (Exception e) {
		e.printStackTrace();
		throw new BoardException
			("게시글 등록 실패하였습니다..","write.do");
	}
		return mav;
	}
	@PostMapping("rwrite")
	public ModelAndView rwrite (Reply reply, HttpServletRequest request,HttpSession session,Integer board_no, Integer num) {
		ModelAndView mav = new ModelAndView("board/detail");
		User loginUser = (User)session.getAttribute("loginUser");
	
		if(loginUser == null) {
			throw new LoginException
			("로그인이 필요합니다.","../user/login.do");
		}
		try {
			service.replyWrite(reply,request);
			mav.setViewName("redirect:detail.do?board_no="+board_no +"&num=" + num);
		}catch (Exception e) {
			e.printStackTrace();
			throw new BoardException
				("댓글 등록에 실패하였습니다.","/board/detail.do?board_no="+ board_no +"&num=" + num);
		}
		return mav;
	}
	
	@RequestMapping("imgupload")
	public String imgupload(MultipartFile upload, String CKEditorFuncNum, HttpServletRequest request, Model model) {
		String path = request.getServletContext().getRealPath("/")
				+	"board/imgfile/";
		File f = new File(path);
		if(!f.exists()) f.mkdirs();
		if(!upload.isEmpty()) {
			File file = new File(path, upload.getOriginalFilename());
		try {
			upload.transferTo(file);
		 	}catch(Exception e) {
		 		e.printStackTrace();
		 	}
		}
		String fileName = "/sjhp/board/imgfile/"+ upload.getOriginalFilename();
		model.addAttribute("fileName", fileName);
		model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);
		return "ckedit";
	
	}
	@RequestMapping("rupdate")
	public ModelAndView rupdate(Reply reply,HttpServletRequest request ) {
		ModelAndView mav = new ModelAndView("board/detail");
		Reply dbReply = service.getReply(reply.getRnum());
		if(!reply.getComment_password().equals(dbReply.getComment_password())) {
			throw new BoardException("비밀번호가 틀립니다.",
					"update.do?num="+reply.getRnum());
		}
		
		return mav;
	}
	@PostMapping("update")
	public ModelAndView update(@Valid Board board, BindingResult bresult, HttpServletRequest request, Integer board_no) {
			ModelAndView mav = new ModelAndView();
			Board dbBoard = service.getBoard(board.getNum());
			if(bresult.hasErrors()) {
				mav.getModel().putAll(bresult.getModel());
				return mav;
			}
			if(!board.getPass().equals(dbBoard.getPass())) {
				throw new BoardException("비밀번호가 틀립니다.",
						"update.do?board_no="+board_no+"&num="+board.getNum());
			}
			try {
				service.boardUpdate(board,request);
				mav.setViewName("redirect:list.do?board_no="+board_no);
			}catch(Exception e) {
				e.printStackTrace();
			throw new BoardException("게시글 수정시 오류가 발생했습니다.","update.do?board_no="+board_no+"&num="+board.getNum());	
			}
			return mav;
	}
	@PostMapping("delete")
	public ModelAndView delete(@Valid Board board, BindingResult bresult,HttpServletRequest request ){
		ModelAndView mav = new ModelAndView();
		int board_no = Integer.parseInt(request.getParameter("board_no"));
		try {
			Board dbboard = service.getBoard(board.getNum());
			if(!board.getPass().equals(dbboard.getPass())) {
				bresult.reject("error.login.password");
				return mav;
			}
			service.boardDelete(board);
			mav.addObject("msg", "게시물이 삭제 되었습니다.");
			mav.addObject("url","list.do?board_no="+board_no);
			mav.setViewName("alert");
		}catch (Exception e) {
			e.printStackTrace();
			throw new BoardException
			("게시물 삭제 실패", "delete.do?num="+board.getNum());
		}		
	    return mav;
    }
	@PostMapping("rdelete")
	public ModelAndView rdelete (Reply reply, Board board, HttpServletRequest request, Integer board_no, Integer num, Integer rnum) {
		ModelAndView mav = new ModelAndView();
	
		try {
			Reply dbreply = service.getReply(reply.getRnum());
			if(!reply.getComment_password().equals(dbreply.getComment_password())) {
				mav.addObject("msg", "비밀번호가 틀립니다." );
				mav.setViewName("alert");
				return mav;
			}else {
			service.replyDelete(reply);
			mav.addObject("msg", "댓글이 삭제 되었습니다.");
			mav.addObject("url","detail.do?board_no="+board_no+"&num="+num);
			mav.setViewName("alert");
			}
		}catch (Exception e) {
			e.printStackTrace();
			throw new BoardException
			("댓글 삭제 실패", "rdelete.do?rnum="+rnum);
		}		
	    return mav;		
	}
	@RequestMapping("main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();// 뷰 : item/list
		List<Item> itemList2 = service.getItemList2();
		mav.addObject("itemList2",itemList2);
		return mav;
	}
}
