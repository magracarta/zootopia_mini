package zootopia_mini.zootopia.controller.action.contest;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.ContestDao;

public class ContestDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cseq = Integer.parseInt(request.getParameter("cseq"));
		
		
		ContestDao cdao = ContestDao.getInstance();
		int result = cdao.deleteContest(cseq);
		
		String url = "contest/contest_board.jsp";
		if(result == 0) url = "zootopia.do?command=contestDetail&delete=no&cseq="+cseq;
		
		request.getRequestDispatcher(url).forward(request, response);
		

	}

}
