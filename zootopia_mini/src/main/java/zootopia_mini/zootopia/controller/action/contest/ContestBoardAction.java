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
		
		String search = "";
		
		if(request.getParameter("search") != null) search =request.getParameter("search");
		else if( session.getAttribute("search") !=null) search = (String) session.getAttribute("search");
		else if(request.getParameter("search") == null && session.getAttribute("search")== null) search = "";
		
		ContestDao cdao = ContestDao.getInstance();
		int contestAllcount = cdao.getAllCount("contest" , search);
		
		Paging page = new Paging();
		if(currentPage != null) page.setCurrentPage(Integer.parseInt(currentPage));
		
		page.setRecordAllcount(contestAllcount);
		ArrayList<ContestDTO> list = cdao.getList(page , search);
		
		
		Date date = new Date();
        Timestamp timestamp = new Timestamp(date.getTime());
        for(ContestDTO cdto : list ) cdto.setCpdList(cdao.getCpdList(cdto.getCseq()));
        
        
        
        session.setAttribute("search", search);
        request.setAttribute("now", timestamp);
        request.setAttribute("paging", page);
		request.setAttribute("allcnt", contestAllcount);
		request.setAttribute("contestList", list);
		
		
		
		request.getRequestDispatcher("contest/contest_board.jsp").forward(request, response);

	}

}
