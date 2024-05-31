package zootopia_mini.zootopia.controller.action.member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.MemberDao;
import zootopia_mini.zootopia.controller.dto.MemberVO;

public class NicknameCheckFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String nickname = request.getParameter("nickname");
		MemberDao mdao = MemberDao.getInstance();
		MemberVO mvo = mdao.getMember(nickname);
		
		if(mvo == null) request.setAttribute("result2", -1); // 사용가능
		else request.setAttribute("result2", 1); // 사용중
		
		request.setAttribute("nickname", nickname);
		
		request.getRequestDispatcher("member/nicknamecheck.jsp").forward(request, response);
		
	}

}
