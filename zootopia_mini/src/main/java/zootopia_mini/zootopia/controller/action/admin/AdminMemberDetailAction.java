package zootopia_mini.zootopia.controller.action.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.MemberDao;
import zootopia_mini.zootopia.controller.dto.MemberVO;

public class AdminMemberDetailAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userid = request.getParameter("userid");
		MemberDao mdao = MemberDao.getInstance();
		MemberVO mvo = mdao.getMember(userid);
		
		request.setAttribute("memberVO", mvo);
		request.getRequestDispatcher("admin/member/memberDetail.jsp").forward(request, response);
		
	}

}
