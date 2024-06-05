package zootopia_mini.zootopia.controller.action.contest;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.ContestDao;

public class TestProcedureAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ContestDao cdao = ContestDao.getInstance();
		
		ArrayList<testDto> list = cdao.testProcedure("user3");
		
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("contest/testcontest.jsp").forward(request, response);

	}

}
