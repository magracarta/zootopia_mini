package zootopia_mini.zootopia.controller.action.contest;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.ContestDao;
import zootopia_mini.zootopia.controller.dto.ContestDTO;

public class ContestBoardAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ContestDao cdao = ContestDao.getInstance();
		ArrayList<ContestDTO> list = cdao.getList();
		
		
		
		request.getRequestDispatcher("contest/contest_board.jsp").forward(request, response);

	}

}
