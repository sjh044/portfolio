package logic;


import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardDao;
import dao.ItemDao;
import dao.ReplyDao;
import dao.UserDao;
import dao.SaleDao;
import dao.SaleItemDao;


@Service //Component + service
public class ShopService {
	@Autowired
	private UserDao userDao;
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private ItemDao itemDao;
	@Autowired
	private ReplyDao replyDao;
	@Autowired
	private SaleDao saleDao;
	@Autowired
	private SaleItemDao saleItemDao;
	
	public void userInsert(User user) {
		userDao.insert(user);
	}

	public void boardWrite(Board board, HttpServletRequest request) {
		if(board.getFile1() != null && !board.getFile1().isEmpty()) {
			uploadFileCreate(board.getFile1(), request,"board/file/");
			board.setFileurl(board.getFile1().getOriginalFilename());
		}
		int max = boardDao.maxnum();
		board.setNum(++max);
		board.setNum(max);
		boardDao.insert(board);
	}
	private void uploadFileCreate
	(MultipartFile picture, HttpServletRequest request, String path) {
		String orgFile = picture.getOriginalFilename();
		String uploadPath=request.getServletContext().getRealPath("/")+path;
		File fpath = new File(uploadPath);
		if(!fpath.exists()) fpath.mkdirs();
		try {
			picture.transferTo(new File(uploadPath + orgFile));
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

	public Board getBoard(Integer num, HttpServletRequest request) {
		if(request.getRequestURI().contains("detail.do")) {
			boardDao.readcntadd(num);
		}
		return boardDao.selectOne(num);
	}

	public List<Board> boardlist(Integer board_no,Integer pageNum, int limit, String type, String content) {
		return boardDao.list(board_no,pageNum,limit, type, content);
	}

	public int boardcount(String type, String content, Integer board_no) {
		return boardDao.count(type,content,board_no);
	}

	public void boardUpdate(Board board, HttpServletRequest request) {
		if(board.getFile1() != null && !board.getFile1().isEmpty()) {
			uploadFileCreate(board.getFile1(), request, "board/file/");
			board.setFileurl(board.getFile1().getOriginalFilename());
		}
		boardDao.update(board);
	}

	public Board getBoard(int num) {
		return boardDao.selectOne(num);
	}

	public void boardDelete(Board board) {
		boardDao.delete(board);
		
	}
//	public void userUpdate(User user, HttpServletRequest request) {
//		//수정된 이미지 존재
//		if(user.getPicture() != null && !user.getPicture().isEmpty()) {
//			//파일 업로드 : 업로드된 파일이 내용을 파일에 저장
//			uploadFileCreate(user.getPicture(),request,"user/img/");
//			user.setPic(user.getPicture().getOriginalFilename());
//		}
//		userDao.update(user);
//	}

	public User getUser(String userid) {
		return userDao.selectOne(userid);
	}


	public void userUpdate(User user) {
		userDao.update(user);
	}


	public void userDelete(String userid) {
		userDao.delete(userid);
	}


	public Item getItem(String id) {
		return itemDao.selectOne(id);
	}


	public void itemCreate(Item item, HttpServletRequest request) {
		  //업로드된 이미지파일이 존재
		  if(item.getPicture()!=null && !item.getPicture().isEmpty()) {
			//파일 업로드 : 업로드된 파일의 내용을 파일에 저장
			uploadFileCreate(item.getPicture(),request,"item/img/");
			item.setPictureUrl(item.getPicture().getOriginalFilename());
		  }
		  if(item.getBanner()!=null && !item.getBanner().isEmpty()) {
				//파일 업로드 : 업로드된 파일의 내용을 파일에 저장
				uploadFileCreate(item.getBanner(),request,"item/banner/");
				item.setBannerUrl(item.getBanner().getOriginalFilename());
			  }
		  itemDao.insert(item);
	}

	public List<Item> getItemList
		(Integer pageNum, int limit,String type,String content) {
		return itemDao.list(pageNum, limit, type, content);
	}

	public int itemcount(String type,String content) {
		return itemDao.count(type, content);
	}

	public List<Item> getItemList2() {
		return itemDao.list2();
	}

	public void itemUpdate(Item item, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
	}

	public void itemDelete(String id) {
		// TODO Auto-generated method stub
		
	}
	public List<User> userList() {
		return userDao.list();
	}

	public List<User> userList(String[] idchks) {
		return userDao.list(idchks);
	}

	public List<Board> getboardList(String id, String num) {
		return userDao.writelist(id,num);
	}

	public int userboardcount(String id) {
		return userDao.count(id);
	}

	public Sale checkend(User loginUser, Cart cart, String rname,String rphone,String omessage, String addr1,String addr2,String addr3 ) {
		 Sale sale = new Sale();
		 sale.setSaleid(saleDao.getMaxSaleId());
		 sale.setUser(loginUser);
		 sale.setUserid(loginUser.getUserid());
		 sale.setUpdatetime(new Date());
		 sale.setRname(rname);
		 sale.setRphone(rphone);
		 sale.setOmessage(omessage);
		 sale.setAddr1(addr1);
		 sale.setAddr2(addr2);
		 sale.setAddr3(addr3);
		 saleDao.insert(sale);
		 
		 List<ItemSet> itemList = cart.getItemSetList();
		 int i = 0;
		 for(ItemSet is : itemList) {
			 int saleItemId = ++i;
			 SaleItem saleItem = new SaleItem
					 (sale.getSaleid(),saleItemId,is);
			 sale.getItemList().add(saleItem);
			 saleItemDao.insert(saleItem);
		 }
		return sale;
	}

	public void replyWrite(Reply reply, HttpServletRequest request) {
		
		int max = replyDao.maxnum();
		reply.setRnum(++max);
		replyDao.insert(reply);
	}

	public int replycount(Integer num) {
		return replyDao.replycount(num);
	}

	public List<Reply> replylist(Integer num, Integer board_no) {
		
		return replyDao.rlist(num,board_no);
	}

	public Reply getReply(int rnum) {
		return replyDao.selectOne(rnum);
	}

	public void replyDelete(Reply reply) {
		replyDao.delete(reply);
	}
	
	public List<Sale> salelist(String id) {
		return saleDao.list(id);
	}

	public List<SaleItem> saleItemList(int saleid) {
		return saleItemDao.list(saleid);
	}

	public Reply getReply(Integer rnum, HttpServletRequest request) {
		return replyDao.selectOne(rnum);
	}
}
