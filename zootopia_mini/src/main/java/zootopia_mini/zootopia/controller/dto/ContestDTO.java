package zootopia_mini.zootopia.controller.dto;

import java.sql.Timestamp;

public class ContestDTO {
	private int cseq;
	private String userid;
	private String nickname;
	private String subject;
	private String content;
	private Timestamp lastdate;
	private Timestamp createdate;
	private int cnt;
	private String useyn;
	
	
	public ContestDTO(String userid, String nickname, String subject, String content, Timestamp lastdate) {
		this.userid = userid;
		this.nickname = nickname;
		this.subject = subject;
		this.content = content;
		this.lastdate = lastdate;
	}
	
	public ContestDTO(int cseq, String userid, String nickname, String subject, String content, Timestamp lastdate,
			Timestamp createdate, int cnt, String useyn) {
		this.cseq = cseq;
		this.userid = userid;
		this.nickname = nickname;
		this.subject = subject;
		this.content = content;
		this.lastdate = lastdate;
		this.createdate = createdate;
		this.cnt = cnt;
		this.useyn = useyn;
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
	public Timestamp getLastdate() {
		return lastdate;
	}
	public void setLastdate(Timestamp lastdate) {
		this.lastdate = lastdate;
	}
	public Timestamp getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Timestamp createdate) {
		this.createdate = createdate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getUseyn() {
		return useyn;
	}
	public void setUseyn(String useyn) {
		this.useyn = useyn;
	}
	
	
	
	
}
