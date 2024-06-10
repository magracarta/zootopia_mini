package zootopia_mini.zootopia.controller.dto;

import java.sql.Timestamp;

public class CommunityVO {
	   private int gseq;
	   private int vcount;
	   private String userid;
	   private String subject;
	   private String content;
	   private int recommands;
	   private int kind;
	   private Timestamp createdate;
	   private String nickname;
	   private String saveImage;
	   
	
	public int getGseq() {
	      return gseq;
	   }
	   public void setGseq(int gseq) {
	      this.gseq = gseq;
	   }
	   public int getVcount() {
	      return vcount;
	   }
	   public void setVcount(int vcount) {
	      this.vcount = vcount;
	   }
	   public String getUserid() {
	      return userid;
	   }
	   public void setUserid(String userid) {
	      this.userid = userid;
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
	   public int getRecommands() {
	      return recommands;
	   }
	   public void setRecommands(int recommands) {
	      this.recommands = recommands;
	   }
	   public int getKind() {
	      return kind;
	   }
	   public void setKind(int kind) {
	      this.kind = kind;
	   }
	   public Timestamp getCreatedate() {
	      return createdate;
	   }
	   public void setCreatedate(Timestamp createdate) {
	      this.createdate = createdate;
	   }
	   public void setNicknameFromView(String viewNickname) {
	        this.nickname = viewNickname;
	    }
	   public String getNicknameFromView() {
		    return this.nickname;
		}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getSaveImage() {
		return saveImage;
	}
	public void setSaveImage(String saveImage) {
		this.saveImage = saveImage;
	}

	   
}
