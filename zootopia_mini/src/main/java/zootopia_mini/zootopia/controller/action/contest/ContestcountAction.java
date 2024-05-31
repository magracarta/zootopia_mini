package zootopia_mini.zootopia.controller.action.contest;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.ContestDao;
import zootopia_mini.zootopia.controller.dto.ContestDTO;

public class ContestcountAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cseq = request.getParameter("cseq");
		ContestDao cdao = ContestDao.getInstance();
		ContestDTO cdot = cdao.getContest(Integer.parseInt(cseq));
		
		int visitcount = cdot.getCnt()+1;
		
		cdao.viewCountUp(visitcount , cseq);
		request.setAttribute("cseq", cseq);
		request.getRequestDispatcher("contest/contestcount.jsp").forward(request, response);
	}

}
