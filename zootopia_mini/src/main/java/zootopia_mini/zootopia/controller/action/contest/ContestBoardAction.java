package zootopia_mini.zootopia.controller.action.contest;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.ContestDao;
import zootopia_mini.zootopia.controller.dto.ContestDTO;
import zootopia_mini.zootopia.util.Paging;

public class ContestBoardAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String currentPage = request.getParameter("pagenum");
	    String category = "all" ;

	     if(request.getParameter("category") != null) {
	    	 category = request.getParameter("category");
	    	 session.setAttribute("category", category);
	     }
		 else if ( session.getAttribute("category") != null ) {
	     	category = (String) session.getAttribute("category");
	     }else if(request.getParameter("category") == null && session.getAttribute("category") == null) category = "all" ;
		
		String search = "";
		
		if(request.getParameter("search") != null) search =request.getParameter("search");
		else if( session.getAttribute("search") !=null) search = (String) session.getAttribute("search");
		else if(request.getParameter("search") == null && session.getAttribute("search")== null) search = "";
		
		ContestDao cdao = ContestDao.getInstance();
		int contestAllcount = cdao.getAllCount("contest" , search , category);
		
		Paging page = new Paging();
		if(currentPage != null) page.setCurrentPage(Integer.parseInt(currentPage));
		else if(session.getAttribute("paging") != null ) page = (Paging)session.getAttribute("paging");
		else if(request.getParameter("paging") == null && session.getAttribute("paging")== null) page.setCurrentPage(1);
		
		page.setRecordAllcount(contestAllcount);
		
		ArrayList<ContestDTO> list = cdao.getList(page , search , category);
		
		
		Date date = new Date();
        Timestamp timestamp = new Timestamp(date.getTime());
        for(ContestDTO cdto : list ) cdto.setCpdList(cdao.getCpdList(cdto.getCseq()));
        
        

        request.setAttribute("category", category);
        session.setAttribute("search", search);
        request.setAttribute("now", timestamp);
        session.setAttribute("paging", page);
		request.setAttribute("allcnt", contestAllcount);
		request.setAttribute("contestList", list);
		
		
		
		request.getRequestDispatcher("contest/contest_board.jsp").forward(request, response);

	}

}
