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

public class MycontestAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userid"); // 세션에서 사용자 아이디를 가져옵니다.
        
        System.out.println("UserId from session: " + userId);
        
        if (userId == null) {
            response.sendRedirect("zootopia.do?command=loginForm");
        } else {
            MypageDao mdao = MypageDao.getInstance();
            ArrayList<ContestDTO> contestList = mdao.getMyContestList(userId); // 사용자 아이디를 매개변수로 전달합니다.
			
			
			request.setAttribute("contestList", contestList);
			
			request.getRequestDispatcher("mypage/mycontest.jsp").forward(request, response);
			
		}
	}

}
