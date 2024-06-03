package zootopia_mini.zootopia.controller.action.contest;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.ContestDao;
import zootopia_mini.zootopia.controller.dto.ContestDTO;

public class ContestUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cseq = Integer.parseInt(request.getParameter("cseq"));
		ContestDao cdao = ContestDao.getInstance();
		ContestDTO cdto = cdao.getContest(cseq);
		cdto.setCpdList(cdao.getCpdList(cseq));
		
		
		request.setAttribute("contest_detail", cdto);
		request.getRequestDispatcher("contest/contestUpdateForm.jsp").forward(request, response);

	}

}
