package zootopia_mini.zootopia.controller.action.mypage;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.MypageDao;
import zootopia_mini.zootopia.controller.dto.MemberVO;

public class DeleteMemberAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
		if(mvo == null) {
			response.sendRedirect("zootopia.do?command=loginForm");
		}else {
			MypageDao mpdao = MypageDao.getInstance();
			
			mpdao.deleteMember(mvo.getUserid());
			session.removeAttribute("loginUser");
			request.setAttribute("message", "회원탈퇴가 완료되었습니다");
			request.getRequestDispatcher("zootopia.do?command=loginform").forward(request, response);
		}
	}

}
