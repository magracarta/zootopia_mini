package zootopia_mini.zootopia.controller.dto;

import java.sql.Timestamp;
import java.util.ArrayList;

public class ContestDTO {
	private int cseq;
	private String userid;
	private String subject;
	private String content;
	private Timestamp createdate;
	private Timestamp lastdate;
	private int cnt;
	private String useyn;
	private int pcnt;
	private int allpcnt;
	private String nickname;
	private ArrayList<ContestPetDTO> cpdList = null;
	
	


	public ContestDTO() {}
	
	public ContestDTO(String userid, String subject, String content, int pcnt , Timestamp lastdate) {
		super();
		this.userid = userid;
		this.subject = subject;
		this.content = content;
		this.pcnt = pcnt;
		this.lastdate = lastdate;
	}



	public ContestDTO(int cseq, String userid, String subject, String content, Timestamp createdate , Timestamp lastdate, int cnt,
			String useyn, int pcnt, int allpcnt, String nickname) {
		super();
		this.cseq = cseq;
		this.userid = userid;
		this.subject = subject;
		this.content = content;
		this.createdate = createdate;
		this.cnt = cnt;
		this.useyn = useyn;
		this.pcnt = pcnt;
		this.allpcnt = allpcnt;
		this.nickname = nickname;
		this.lastdate = lastdate;
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



	public int getPcnt() {
		return pcnt;
	}



	public void setPcnt(int pcnt) {
		this.pcnt = pcnt;
	}



	public int getAllpcnt() {
		return allpcnt;
	}



	public void setAllpcnt(int allpcnt) {
		this.allpcnt = allpcnt;
	}



	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public ArrayList<ContestPetDTO> getCpdList() {
		return cpdList;
	}



	public void setCpdList(ArrayList<ContestPetDTO> cpdList) {
		this.cpdList = cpdList;
	}

	

	public Timestamp getLastdate() {
	    return lastdate;
	}

	public void setLastdate(Timestamp lastdate) {
	    this.lastdate = lastdate;
	}


	
	
	
	
}
