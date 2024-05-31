package zootopia_mini.zootopia.controller.action.qna;

import java.io.IOException;

import zootopia_mini.zootopia.controller.action.Action;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class WriteQnaFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("qna/writeQnaForm.jsp").forward(request, response);
	}

}
