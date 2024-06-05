package zootopia_mini.zootopia.controller.action.mypage;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zootopia_mini.zootopia.controller.action.Action;
import zootopia_mini.zootopia.controller.dao.MypageDao;
import zootopia_mini.zootopia.controller.dto.MemberVO;
import zootopia_mini.zootopia.controller.dto.MyReplyDTO;

public class MyreplyAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser"); // 세션에서 사용자 아이디를 가져옵니다.
		
		if (mvo	 == null) 
        {
        	response.sendRedirect("zootopia.do?command=loginform");
        } 
        else 
        {
        	MypageDao mdao = MypageDao.getInstance();
        	ArrayList<MyReplyDTO> myReplyList = mdao.getMyReplyList(mvo.getUserid());
        	request.setAttribute("myReplyList", myReplyList);
        	request.getRequestDispatcher("mypage/myreply.jsp").forward(request, response);
        }
		
		
	}

}
