package zootopia_mini.zootopia.controller.action.admin;

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
import zootopia_mini.zootopia.controller.dao.MemberDao;
import zootopia_mini.zootopia.controller.dto.AdminVO;
import zootopia_mini.zootopia.controller.dto.ContestDTO;
import zootopia_mini.zootopia.controller.dto.Contest_replyDTO;
import zootopia_mini.zootopia.util.Paging;

public class AdminContestDetialAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		AdminVO avo = (AdminVO)session.getAttribute("adminUser");
		if(avo == null) {
			response.sendRedirect("zootopia.do?command=admin");
		}else {
			
			String cseq = request.getParameter("cseq");
			String pagenum = request.getParameter("pagenum");
			String beforePageNum = request.getParameter("beforePageNum");
			String category = request.getParameter("category");
			int replypagenum = 1;
			
			if(pagenum != null) replypagenum = Integer.parseInt(pagenum);
			
			
			ContestDao cdao = ContestDao.getInstance();
			MemberDao mdao = MemberDao.getInstance();
			ContestDTO cdto = cdao.getContest(Integer.parseInt(cseq));
			
			cdto.setCpdList(cdao.getCpdList(cdto.getCseq()));
			
			Date date = new Date();
			Timestamp now = new Timestamp(date.getTime());
			
			Paging page = new Paging();
			
			
			page.setCurrentPage(replypagenum);
			page.setRecordAllcount(cdao.getAllCountReply(cseq));
			//리스트 뿌리기
			ArrayList<Contest_replyDTO> creplylist = cdao.getContestList(cseq , page);
			
			for(Contest_replyDTO list : creplylist) {
				list.setMvo(mdao.getMember(list.getUserid()));
			}
			
			
			
			
			request.setAttribute("pagenum", page.getCurrentPage());
			request.setAttribute("paging", page);
			request.setAttribute("beforePageNum", beforePageNum);
			request.setAttribute("category", category);
			request.setAttribute("replyAll", page.getRecordAllcount());
			request.setAttribute("creplylist", creplylist);
			request.setAttribute("now", now);
			request.setAttribute("contest_detail", cdto);
			request.getRequestDispatcher("admin/contest/contestDetail.jsp").forward(request, response);
		}
	
	}

}
