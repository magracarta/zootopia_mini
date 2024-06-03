package zootopia_mini.zootopia.controller.dto;

import java.sql.Timestamp;

public class Contest_replyDTO {
	private int crseq;
	private int cseq;
	private String userid;
	private Timestamp createdate;
	private String content;
	private MemberVO mvo;
	
	
	
	public Contest_replyDTO() {}
	
	public Contest_replyDTO(int cseq, String userid, Timestamp createdate, String content) {
		this.cseq = cseq;
		this.userid = userid;
		this.createdate = createdate;
		this.content = content;
	}

	public Contest_replyDTO(int crseq, int cseq, String userid, Timestamp createdate, String content) {
		this( cseq, userid, createdate, content);
		this.crseq = crseq;
	}
	public int getCrseq() {
		return crseq;
	}
	public void setCrseq(int crseq) {
		this.crseq = crseq;
	}
	public int getCseq() {
		return cseq;
	}
	public void setCseq(int cseq) {
		this.cseq = cseq;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public Timestamp getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Timestamp createdate) {
		this.createdate = createdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public MemberVO getMvo() {
		return mvo;
	}

	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}
	
	
	
}
