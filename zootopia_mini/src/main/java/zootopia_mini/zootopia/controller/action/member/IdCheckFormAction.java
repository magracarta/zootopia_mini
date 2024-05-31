package zootopia_mini.zootopia.controller.action.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.MemberDao;
import zootopia_mini.zootopia.controller.dto.MemberVO;

public class IdCheckFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userid = request.getParameter("userid");
		MemberDao mdao = MemberDao.getInstance();
		MemberVO mvo = mdao.getMember(userid);
		
		if(mvo == null) request.setAttribute("result", -1); // 사용가능
		else request.setAttribute("result", 1); // 사용중
		
		request.setAttribute("userid", userid);
		
		request.getRequestDispatcher("member/idcheck.jsp").forward(request, response);
		
	}

}
