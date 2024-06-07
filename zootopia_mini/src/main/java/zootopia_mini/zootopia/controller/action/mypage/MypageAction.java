package zootopia_mini.zootopia.controller.action.mypage;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.MypageDao;
import zootopia_mini.zootopia.controller.dto.ContestDTO;
import zootopia_mini.zootopia.controller.dto.ContestPetDTO;
import zootopia_mini.zootopia.controller.dto.MemberVO;

public class MypageAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
		
		if(mvo == null) {
			response.sendRedirect("zootopia.do?command=loginform");
		}else {
			/*
			 * MypageDao mdao = MypageDao.getInstance(); ArrayList<ContestDTO> contestList =
			 * mdao.getMyContestList(mvo.getUserid()); ArrayList<ContestPetDTO>
			 * contestmypetList = mdao.mypetList(mvo.getUserid());
			 * 
			 * request.setAttribute("contestList", contestList);
			 * request.setAttribute("contestmypetList", contestmypetList);
			 */
			request.getRequestDispatcher("mypage/mypage.jsp").forward(request, response);
		}
		
	}

}
