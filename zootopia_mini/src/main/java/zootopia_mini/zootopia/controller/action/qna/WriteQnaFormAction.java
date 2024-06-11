package zootopia_mini.zootopia.controller.action.qna;

import java.io.IOException;

import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dto.MemberVO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class WriteQnaFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
		
		 if (mvo == null) {
	        response.sendRedirect("zootopia.do?command=loginform");
	        return;
	    }
		request.getRequestDispatcher("qna/writeQnaForm.jsp").forward(request, response);
	}

}
