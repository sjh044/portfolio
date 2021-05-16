package logic;

import java.util.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class Item {
	private String id;
	@NotEmpty(message="상품명을 입력하세요.")
	private String name;
	@Min(value=10, message="10원 이상 가능합니다.")
	@Max(value=1000000, message="100만원 이하만 가능합니다.")
	private int price;
	@NotEmpty(message="상품 설명을 입력하세요.")
	@Size(min=10, max=15, message="10자 이상 15자 이하 가능")
	private String description;
	@NotEmpty(message="상품 내용을 입력하세요.")
	private String subject;
	private String pictureUrl;
	private MultipartFile picture; //업로드된 파일 저장
	private Date regdate;
	private String bannerUrl;
	private MultipartFile banner;
	private int shipping;
	
	public String getBannerUrl() {
		return bannerUrl;
	}
	public void setBannerUrl(String bannerUrl) {
		this.bannerUrl = bannerUrl;
	}
	public MultipartFile getBanner() {
		return banner;
	}
	public void setBanner(MultipartFile banner) {
		this.banner = banner;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}
	public MultipartFile getPicture() {
		return picture;
	}
	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getShipping() {
		return shipping;
	}
	public void setShipping(int shipping) {
		this.shipping = shipping;
	}
	@Override
	public String toString() {
		return "Item [id=" + id + ", name=" + name + ", price=" + price + ", description=" + description + ", subject="
				+ subject + ", pictureUrl=" + pictureUrl + ", picture=" + picture + ", regdate=" + regdate
				+ ", bannerUrl=" + bannerUrl + ", banner=" + banner + ", shipping=" + shipping + "]";
	}
}
