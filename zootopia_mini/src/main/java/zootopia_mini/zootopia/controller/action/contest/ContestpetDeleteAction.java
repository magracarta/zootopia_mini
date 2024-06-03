package zootopia_mini.zootopia.controller.action.contest;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.ContestDao;

public class ContestpetDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cpseq = Integer.parseInt(request.getParameter("cpseq"));
		int cseq = Integer.parseInt(request.getParameter("cseq"));
		int index = Integer.parseInt(request.getParameter("index"));
		
		
		ContestDao cdao = ContestDao.getInstance();
		cdao.deletePet(cpseq);
		
		response.sendRedirect("zootopia.do?command=contestDetail&cseq="+cseq+"&index="+index);
		

	}

}
