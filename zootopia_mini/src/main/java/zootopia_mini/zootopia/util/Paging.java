package zootopia_mini.zootopia.util;

public class Paging {
	//현재페이지
	private int currentPage = 1;
	//총 레코드수
	private int recordAllcount; //12
	//총 페이지 숫자
	private int pageAllcount;
	//페이지네이션 첫페이지 숫자
	private int firstnum;
	//페이지네이션 끝 숫자
	private int lastnum;
	//보여질 레코드 개수
	private int recordrow = 5;
	//화면에 보여질 페이지네이션 개수
	private int pagecnt = 6;
	
	private boolean next;
	private boolean prev;
	
	
	private void pageMethod() {
		pageAllcount = (int) Math.ceil(12/5);
		
	}
	
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getRecordAllcount() {
		return recordAllcount;
	}
	public void setRecordAllcount(int recordAllcount) {
		this.recordAllcount = recordAllcount;
		pageMethod();
	}
	public int getPageAllcount() {
		return pageAllcount;
	}
	public void setPageAllcount(int pageAllcount) {
		this.pageAllcount = pageAllcount;
	}
	public int getFirstnum() {
		return firstnum;
	}
	public void setFirstnum(int firstnum) {
		this.firstnum = firstnum;
	}
	public int getLastnum() {
		return lastnum;
	}
	public void setLastnum(int lastnum) {
		this.lastnum = lastnum;
	}
	public int getRecordrow() {
		return recordrow;
	}
	public void setRecordrow(int recordrow) {
		this.recordrow = recordrow;
	}
	public int getPagecnt() {
		return pagecnt;
	}
	public void setPagecnt(int pagecnt) {
		this.pagecnt = pagecnt;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	
	
	
	
	
	
}
