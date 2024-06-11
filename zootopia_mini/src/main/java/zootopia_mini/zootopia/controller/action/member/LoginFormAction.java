package zootopia_mini.zootopia.controller.action.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;

public class LoginFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser") == null)request.getRequestDispatcher("member/loginForm.jsp").forward(request, response);
		else response.sendRedirect("zootopia.do?command=main");
		

	}

}
