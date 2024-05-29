package zootopia_mini.zootopia.controller.dto;

import java.sql.Timestamp;

public class MemberVO {

	private String userid;
	private String nickname;
	private String pwd;
	private String name;
	private String phone;
	private String email;
	private Timestamp createdate;
	private String image;
	private String saveimage; 
	private String kind; 
	private String useyn; 
	private String petname;
	private String petgender;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Timestamp getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Timestamp createdate) {
		this.createdate = createdate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getSaveimage() {
		return saveimage;
	}
	public void setSaveimage(String saveimage) {
		this.saveimage = saveimage;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	public String getPetname() {
		return petname;
	}
	public void setPetname(String petname) {
		this.petname = petname;
	}
	public String getPetgender() {
		return petgender;
	}
	public void setPetgender(String petgender) {
		this.petgender = petgender;
	}
	
	
	
}
