package zootopia_mini.zootopia.controller.action.admin;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.action.contest.ContestAdminEnum;
import zootopia_mini.zootopia.controller.dao.AdminContestDao;
import zootopia_mini.zootopia.controller.dto.AdminVO;
import zootopia_mini.zootopia.controller.dto.ContestDTO;
import zootopia_mini.zootopia.controller.dto.ContestPetDTO;
import zootopia_mini.zootopia.util.Paging;

public class AdmincontestlistAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session= request.getSession();
		
		
		AdminVO avo = (AdminVO) session.getAttribute("adminUser");
		if(avo == null) {
			response.sendRedirect("zootopia.do?command=admin");
		}else {
			
			String currentPage = request.getParameter("pagenum");
			String category = request.getParameter("category");
			String search = "";
			
			if(request.getParameter("search") != null) search =request.getParameter("search");
			else if( session.getAttribute("search") !=null) search = (String) session.getAttribute("search");
			else if(request.getParameter("search") == null && session.getAttribute("search")== null) search = "";
			
			Paging page = new Paging();
				
			if(currentPage != null) page.setCurrentPage(Integer.parseInt(currentPage));
			else if(session.getAttribute("pagenum") != null ) page = (Paging) session.getAttribute("pagenum");
			else if(request.getParameter("pagenum") == null && session.getAttribute("pagenum")== null) page.setCurrentPage(1);

			
			
			AdminContestDao acdao = AdminContestDao.getInstance();
			Date date = new Date();
			Timestamp now = new Timestamp(date.getTime());
		
			String catewhere= " "; 
			if(category.equals("playing")) { catewhere = " and useyn = 'Y' and now() < lastdate  "; }
			if(category.equals("completed")) { catewhere = " and useyn = 'Y' and now() > lastdate  "; }
			if(category.equals("waiting")) { catewhere = " and useyn = 'W' "; }
			if(category.equals("rejected")) { catewhere = " and useyn = 'N' "; }
			 allContest(page , acdao , search , request , catewhere);
			
			
			request.setAttribute("title", "모든 콘테스트");
			request.setAttribute("now", now);
			request.setAttribute("paging", page);
			request.setAttribute("category", category);
			request.setAttribute("search", search);
			session.setAttribute("paging", page);
			session.setAttribute("search", search);
			request.getRequestDispatcher("admin/contest/contestList.jsp").forward(request, response);
		}
		
	

	}

	
	private void allContest(Paging page , AdminContestDao acdao , String search, HttpServletRequest request , String catewhere) {
		ContestAdminEnum all = ContestAdminEnum.CONESTVIEW;
		int Allcount = acdao.mysqlAllcount(all.getAllcount(search, catewhere));
		page.setRecordAllcount(Allcount);
		
		
		ArrayList<ContestDTO> contestDtoList = acdao.mysqlContestSelect( all.getSelectSQL(search, catewhere, page , "cseq desc" ) ,  new ContestDTO());
		
		for(ContestDTO cdto : contestDtoList) {
			ContestAdminEnum pet = ContestAdminEnum.CONTESTPETVIEW;
			 cdto.setCpdList(acdao.mysqlContestSelect(pet.getSelectSQL(" ", " cseq = " + cdto.getCseq()+" " , page , " recommends desc ") , new ContestPetDTO()));
		}
		
		
		
		request.setAttribute("realallcount", acdao.mysqlAllcount(all.getAllcount(" ", " ")));
		request.setAttribute("playingcount", acdao.mysqlAllcount(all.getAllcount("", "and useyn = 'Y' and lastdate > now() ")));
		request.setAttribute("waitingcount", acdao.mysqlAllcount(all.getAllcount("", "and useyn = 'W' ")));
		request.setAttribute("rejectcount", acdao.mysqlAllcount(all.getAllcount("", "and useyn = 'N' ")));
		request.setAttribute("Completecount", acdao.mysqlAllcount(all.getAllcount("", "and useyn = 'Y' and lastdate < now()")));
		request.setAttribute("Allcount", Allcount);
		request.setAttribute("contestDtoList", contestDtoList);
		
	}
	
	
	

}
