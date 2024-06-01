package zootopia_mini.zootopia.controller.action.contest;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.ContestDao;
import zootopia_mini.zootopia.controller.dto.ContestDTO;

public class ContestDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cseq = request.getParameter("cseq");
		String index = request.getParameter("index");
		
		ContestDao cdao = ContestDao.getInstance();
		ContestDTO cdto = cdao.getContest(Integer.parseInt(cseq));
		
		cdto.setCpdList(cdao.getCpdList(cdto.getCseq()));
		
		Date date = new Date();
		Timestamp now = new Timestamp(date.getTime());
		
		request.setAttribute("now", now);
		request.setAttribute("index", index);
		request.setAttribute("contest_detail", cdto);
		request.getRequestDispatcher("contest/contestDetail.jsp").forward(request, response);
	}

}
