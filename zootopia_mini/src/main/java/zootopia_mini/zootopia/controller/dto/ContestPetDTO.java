package zootopia_mini.zootopia.controller.dto;

public class ContestPetDTO {
	private int cpseq;
	private String content;
	private String userid;
	private String nickname;
	private int cseq;
	private int recommends;
	private String image;
	private String saveimage;
	private String petname;
	private String petgender;
	private String kind;
	private String password;
	
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
	
	
	
	public ContestPetDTO(int cpseq, String content, String userid, String nickname, int cseq, int recommends,
			String image, String saveimage, String petname, String petgender, String kind, String password) {
		super();
		this.cpseq = cpseq;
		this.content = content;
		this.userid = userid;
		this.nickname = nickname;
		this.cseq = cseq;
		this.recommends = recommends;
		this.image = image;
		this.saveimage = saveimage;
		this.petname = petname;
		this.petgender = petgender;
		this.kind = kind;
		this.password = password;
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

	public String getPetnickname() {
		return petname;
	}

	public void setPetnickname(String petname) {
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPetgender() {
		return petgender;
	}

	public void setPetgender(String petgender) {
		this.petgender = petgender;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}
}
