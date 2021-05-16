package logic;

import java.util.Date;

public class Reply {
	private int num;
	private int rnum;
	private String name;
	private String comment;
	private Date regdate;
	private String userid;
	private String comment_password;
	private int board_no;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getComment_password() {
		return comment_password;
	}
	public void setComment_password(String comment_password) {
		this.comment_password = comment_password;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	@Override
	public String toString() {
		return "Reply [num=" + num + ", rnum=" + rnum + ", name=" + name + ", comment=" + comment + ", regdate="
				+ regdate + ", userid=" + userid + ", comment_password=" + comment_password + ", board_no=" + board_no
				+ "]";
	}
}
 