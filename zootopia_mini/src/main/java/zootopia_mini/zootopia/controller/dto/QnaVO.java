package zootopia_mini.zootopia.controller.dto;

import java.sql.Timestamp;

public class QnaVO {

	private Integer qseq; 
	private String subject;
	private String content;
	private String reply;
	private String userid;
	private Timestamp createdate;
	
	public Integer getQseq() {
		return qseq;
	}
	public void setQseq(Integer qseq) {
		this.qseq = qseq;
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
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
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
	
	
}
