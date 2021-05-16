package logic;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Sale {
	private int saleid;
	private String userid;
	private String rname;
	private String addr1;
	private String addr2;
	private String addr3;
	private String rphone;
	private Date updatetime;
	private String omessage;
	private User user;
	private List<SaleItem> itemList = new ArrayList<SaleItem>();
	public long getTotal() {
		long sum = 0;
		for(SaleItem si : itemList) {
			sum += si.getItem().getPrice() * si.getQuantity();
		}
		return sum;
	}	
	//setter, getter
	public int getSaleid() {
		return saleid;
	}
	public void setSaleid(int saleid) {
		this.saleid = saleid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Date getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public List<SaleItem> getItemList() {
		return itemList;
	}
	public void setItemList(List<SaleItem> itemList) {
		this.itemList = itemList;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getAddr3() {
		return addr3;
	}
	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}
	public String getRphone() {
		return rphone;
	}
	public void setRphone(String rphone) {
		this.rphone = rphone;
	}
	public String getOmessage() {
		return omessage;
	}
	public void setOmessage(String omessage) {
		this.omessage = omessage;
	}
	
}
