package logic;

import java.util.Date;

import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class User {
	@Size(min=3,max=10,message="아이디는 3자이상 10자이하로 입력하세요")
	private String userid;
	@Size(min=3,max=10,message="비밀번호는 3자이상 10자이하로 입력하세요")
	private String password;
	@NotEmpty(message="이름은 필수 입력입니다.")
	private String name;
	@Email(message="email 형식으로 입력하세요")
	private String email;
	private String phone1;
	private String phone2;
	private String phone3;
	private String uaddr1;
	private String uaddr2;
	private String uaddr3;
	private Date regdate;
	@Past(message="생일은 과거 날짜만 가능합니다.")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getUaddr1() {
		return uaddr1;
	}
	public void setUaddr1(String uaddr1) {
		this.uaddr1 = uaddr1;
	}
	public String getUaddr2() {
		return uaddr2;
	}
	public void setUaddr2(String uaddr2) {
		this.uaddr2 = uaddr2;
	}
	public String getUaddr3() {
		return uaddr3;
	}
	public void setUaddr3(String uaddr3) {
		this.uaddr3 = uaddr3;
	}
	@Override
	public String toString() {
		return "User [userid=" + userid + ", password=" + password + ", name=" + name + ", email=" + email + ", phone1="
				+ phone1 + ", phone2=" + phone2 + ", phone3=" + phone3 + ", uaddr1=" + uaddr1 + ", uaddr2=" + uaddr2
				+ ", uaddr3=" + uaddr3 + ", regdate=" + regdate + ", birthday=" + birthday + "]";
	}
}