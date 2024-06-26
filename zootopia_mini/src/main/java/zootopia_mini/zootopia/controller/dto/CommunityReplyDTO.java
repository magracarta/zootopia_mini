package zootopia_mini.zootopia.controller.dto;

import java.sql.Timestamp;

public class CommunityReplyDTO {
	private String userid;
	private int gseq;
	private int grseq;
	private String content;
	private Timestamp createdate;
	private String nickname;
	private String saveImage;
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getGseq() {
		return gseq;
	}
	public void setGseq(int gseq) {
		this.gseq = gseq;
	}
	public int getGrseq() {
		return grseq;
	}
	public void setGrseq(int grseq) {
		this.grseq = grseq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Timestamp createdate) {
		this.createdate = createdate;
	}
	public String getSaveImage() {
		return saveImage;
	}
	public void setSaveImage(String saveImage) {
		this.saveImage = saveImage;
	}
	
}
