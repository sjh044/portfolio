package logic;

import java.util.Date;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Board {
	private int num;
	private String userid;
	private String name;
	@NotEmpty(message="비밀번호를 입력하세요.")
	private String pass;
	@NotEmpty(message="제목을 입력하세요.")
	private String subject;
	@NotEmpty(message="내용을 입력하세요.")
	private String content;
	private MultipartFile file1;
	private String fileurl;
	private Date regdate;
	private int readcnt;
	private int board_no;
	public int getNum() {
		return num;
	}
	
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public String getFileurl() {
		return fileurl;
	}
	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public int getboard_no() {
		return board_no;
	}
	public void setboard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "Board [num=" + num + ", userid=" + userid + ", name=" + name + ", pass=" + pass + ", subject=" + subject
				+ ", content=" + content + ", file1=" + file1 + ", fileurl=" + fileurl + ", regdate=" + regdate
				+ ", readcnt=" + readcnt + ", board_no=" + board_no + "]";
	}
}

