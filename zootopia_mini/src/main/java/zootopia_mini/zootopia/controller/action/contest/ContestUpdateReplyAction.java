package zootopia_mini.zootopia.controller.action.contest;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.ContestDao;

public class ContestUpdateReplyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int crseq = Integer.parseInt(request.getParameter("crseq"));
		int cseq = Integer.parseInt(request.getParameter("cseq"));
		int index = Integer.parseInt(request.getParameter("index"));
		String content = request.getParameter("content");
		String pagenum = request.getParameter("pagenum");
		
		int page =1;
		if(pagenum != null) page = Integer.parseInt(pagenum);
		
		ContestDao cdao = ContestDao.getInstance();
		
		cdao.updateContestReply(crseq,content);
		
		

		
		
		request.setAttribute("pagenum", page);
		
		response.sendRedirect("zootopia.do?command=contestDetail&cseq="+cseq+"&index="+index+"&pagenum="+pagenum);
		

	}

}
