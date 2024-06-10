package zootopia_mini.zootopia.util;

public class Paging {
	//현재페이지
	private int currentPage = 1;
	//총 레코드수
	private int recordAllcount; //46
	//총 페이지 숫자
	private int pageAllcount; //10
	//페이지네이션 첫페이지 숫자
	private int firstnum; 
	//페이지네이션 끝 숫자
	private int lastnum;
	//보여질 레코드 개수
	private int recordrow = 5;
	//화면에 보여질 페이지네이션 개수
	private int pagecnt = 6;
	private int offsetnum;
	private int displayRow=10; 
	private int startNum; 
	private int page=1; 
	private int totalCount; 
	private int displayPage=10;
	private int beginPage;  
    private int endPage; 
    private int endNum;
	
	private boolean next;
	private boolean prev;
	
	
	private void pageMethod() {
		offsetnum = (currentPage-1)*recordrow;
		pageAllcount = (int) (Math.ceil((double)recordAllcount/recordrow)); //10
					
		 firstnum = ((currentPage - 1) / pagecnt) * pagecnt + 1;
		 lastnum = firstnum + pagecnt - 1;
		 if(lastnum > pageAllcount) lastnum = pageAllcount;
		
		
		if(firstnum <= 1 && lastnum <= pageAllcount) {
			prev = false;
		}else {
			prev = true;
		}
		
		if( lastnum < pageAllcount  ) {
			next = true;
		}else {
			next = false;
		}
		
		
		System.out.println((firstnum <= 1) + " : "+ prev);
		System.out.println((lastnum >= pageAllcount) + " : "+ next);
		System.out.println(pageAllcount	);
		
	}
	private void calPaging() {
    	endPage = ( (int)( Math.ceil( page/(double)displayPage ) ) )*displayPage;
    	beginPage = endPage - (displayPage - 1);
    	int totalPage = (int)Math.ceil(totalCount/(double)displayRow);
    	if( totalPage<endPage ) { 	
    		endPage = totalPage;    next = false;				 
    	}else{ 	
    		next = true;   
    	}
    	prev = (beginPage==1)? false : true; 
    	startNum = (page-1)*displayRow+1;   
        endNum = page*displayRow;                  
        System.out.println(beginPage + " "  + endPage + " "  + startNum + " "  + endNum);
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


	public int getOffsetnum() {
		return offsetnum;
	}


	public void setOffsetnum(int offsetnum) {
		this.offsetnum = offsetnum;
	}


	public int getDisplayRow() {
		
		return displayRow;
	}
	public void setDisplayRow(int displayRow) {
		this.displayRow = displayRow;
	}

	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}


	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calPaging(); 
	}
	public int getDisplayPage() {
		return displayPage;
	}
	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}  
	



	
	
	
	
	
	
	
}
