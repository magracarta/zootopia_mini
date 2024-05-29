package zootopia_mini.zootopia.controller.dto;

public class ContestPetDTO {
	private int cpseq;
	private String userid;
	private String nickname;
	private int cseq;
	private String content;
	private int recommends;
	private String image;
	private String saveimage;
	
	public ContestPetDTO() {}
	
	public ContestPetDTO(String userid, String nickname, int cseq, String content, String image, String saveimage) {
		super();
		this.userid = userid;
		this.nickname = nickname;
		this.cseq = cseq;
		this.content = content;
		this.image = image;
		this.saveimage = saveimage;
	}
	public ContestPetDTO(int cpseq, String userid, String nickname, int cseq, String content, int recommends,
			String image, String saveimage) {
		super();
		this.cpseq = cpseq;
		this.userid = userid;
		this.nickname = nickname;
		this.cseq = cseq;
		this.content = content;
		this.recommends = recommends;
		this.image = image;
		this.saveimage = saveimage;
	}
	public int getCpseq() {
		return cpseq;
	}
	public void setCpseq(int cpseq) {
		this.cpseq = cpseq;
	}
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
	public int getCseq() {
		return cseq;
	}
	public void setCseq(int cseq) {
		this.cseq = cseq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRecommends() {
		return recommends;
	}
	public void setRecommends(int recommends) {
		this.recommends = recommends;
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
}
