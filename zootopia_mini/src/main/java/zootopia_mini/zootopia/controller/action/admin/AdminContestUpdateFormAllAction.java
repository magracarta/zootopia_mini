package zootopia_mini.zootopia.controller.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.ContestDao;
import zootopia_mini.zootopia.controller.dto.ContestDTO;

public class AdminContestUpdateFormAllAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cseq = Integer.parseInt(request.getParameter("cseq"));
		String category = request.getParameter("category");
		String beforePageNum = request.getParameter("beforePageNum");
		
		ContestDao cdao = ContestDao.getInstance();
		ContestDTO cdto = cdao.getContest(cseq);
		cdto.setCpdList(cdao.getCpdList(cseq));
		
		
		request.setAttribute("beforePageNum", beforePageNum);
		request.setAttribute("category", category);
		request.setAttribute("contest_detail", cdto);
		request.getRequestDispatcher("admin/contest/contestUpdateForm.jsp").forward(request, response);

	}

}
