package zootopia_mini.zootopia.controller.action.contest;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.ContestDao;
import zootopia_mini.zootopia.controller.dao.MemberDao;
import zootopia_mini.zootopia.controller.dto.ContestDTO;
import zootopia_mini.zootopia.controller.dto.Contest_replyDTO;
import zootopia_mini.zootopia.util.Paging;

public class ContestDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cseq = request.getParameter("cseq");
		String index = request.getParameter("index");
		String pagenum = request.getParameter("pagenum");
		int replypagenum = 1;
		
		if(request.getParameter("pagenum") != null) replypagenum = Integer.parseInt(request.getParameter("pagenum"));
		
		System.out.println(replypagenum);
		
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
		request.setAttribute("replyAll", page.getRecordAllcount());
		request.setAttribute("creplylist", creplylist);
		request.setAttribute("now", now);
		request.setAttribute("index", index);
		request.setAttribute("contest_detail", cdto);
		request.getRequestDispatcher("contest/contestDetail.jsp").forward(request, response);
	}

}
